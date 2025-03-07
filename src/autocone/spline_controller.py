"""
This is the spline following implementation for a rover following a lead vehicle using only position and orientation data.
"""

# Import libraries
import numpy as np 
import time

# Import my libraries
import autocone.utils as utils
import autocone.geometry as geometry
import autocone.utm as utm 

class spline_controller :
    """
    This is a single rover spline controller.
    """
    def __init__(
        self,
        targ_hdg_fnc,
        src_type,
        rov_type,
        rov_max_speed,
        rov_min_speed,
        rov_acc_max,
        rov_max_lat_acc,
        rov_ang_tol,
        min_src_gap,
        min_src_dist,
        min_points,
        max_points
        ) :
        """
        Initialization function for the controller object:
        Inputs:
        targ_hdg_fnc:   Function which intakes parameters and outputs a target heading
        src_type:       The message type that the source gps will publish
        rov_type:       The message type that the rover will publish
        rov_max_speed:  The maximum speed the rover would give (m/s)
        rov_min_speed:  The minimum following speed allowed (m/s)
        rov_acc_max:    The maximum approximate acceleration which will be allowed when calculating desired speed (m/s^2)
        rov_max_lat_acc:The maximum approximate lateral acceleration which will be allowed when calculating desired speed (m/s^2)
        rov_ang_tol:    The maximum angle delta which will be allowed in order to travel at speeds above minimum (radians)
        min_src_gap:    The minimum gap between source waypoints which will be accepted in meters
        min_src_dist:   The minimum distance between the rover and the lead vehicle in meters
        min_points:     The minimum number of points before starting the following regiment
        max_points:     The maximum number of points allowed in the queue
        """

        # Check the inputs
        if src_type not in ['xyz', 'llh'] :
            raise ValueError('The source type must be ''llh'' or ''xyz'' not {}'.format( src_type ) ) 
        
        if rov_type not in ['xyz', 'llh'] :
            raise ValueError('The rover gps type must be ''llh'' or ''xyz'' not {}'.format( rov_type ) )

        # Save the internal parameters
        self.targ_hdg_fnc = targ_hdg_fnc
        self.src_pos_type = src_type
        self.rov_pos_type = rov_type
        self.rov_max_speed = rov_max_speed
        self.rov_min_speed = rov_min_speed
        self.rov_acc_max = rov_acc_max
        self.rov_max_lat_acc = rov_max_lat_acc
        self.rov_ang_tol = rov_ang_tol
        self.src_min_gap = min_src_gap
        self.src_min_dist = min_src_dist
        self.src_min_points = min_points
        self.src_max_points = max_points

        # Create the data structures

        # The rov_data  structure will keep track of the rover's timestamp, position (x (N),y (E)), and, heading (theta) 
        #self.rov_data = np.zeros( (0,4) )

        # The source data structure will keep track of the sources's timestamp, position (x (N), y (E)), source velocity, heading (theta), heading / distance rate
        self.idx_timestamp = 0
        self.idx_x = 1
        self.idx_y = 2
        self.idx_vel = 3
        self.idx_heading= 4
        self.idx_heading_dist_rate=5
        self.idx_heading_delta = 6
        self.idx_gap = 7
        self.idx_tot_dist = 8
        self.src_data = utils.queue_array_handler_2D(max_points, 9)

        # Initialize some variables
        self.buf_x = None
        self.buf_y = None
        self.buf_theta = None
        self.buf_timestamp = None
        self.buf_prev_dist = 0

        self.utm = None
        self.prev_rov_vel_targ = 0
        self.ready = False
        self.min_cp_idx = None
        self.rov_time_stamp = time.time()

    def src_buffer_add( self, pos_x, pos_y, time_stamp ) :

        # Check which step we're on
        
        if self.buf_x == None and self.buf_y == None and self.buf_timestamp == None :
            # This is the first step, simply add the items
            self.buf_x = pos_x
            self.buf_y = pos_y 
            self.buf_timestamp = time_stamp

            return None 
        
        if self.buf_x != None and self.buf_y != None and self.buf_timestamp != None :
            new_theta = geometry.bearing(
                    (self.buf_x, self.buf_y),
                    (pos_x, pos_y)
                )
            

            if self.buf_theta == None :
                # Second step where we are computing the first theta value
                ret = None
                total_dist= geometry.distance((pos_x,pos_y),(self.buf_x,self.buf_y))
            else :
                # The default step when the first two data points have been processed:
                dist = geometry.distance( (self.buf_x, self.buf_y), (pos_x, pos_y ) )
                total_dist = self.buf_prev_dist + dist
                head_delta = geometry.angle_min_diff( self.buf_theta, new_theta )
                theta_dist_rate = head_delta/dist

                vel_x = (pos_x - self.buf_x) / (time_stamp - self.buf_timestamp)
                vel_y = (pos_y - self.buf_y) / (time_stamp - self.buf_timestamp)

                vel = np.sqrt( vel_x**2 + vel_y**2 )
                #print('Estimated source velocity: {} m/s'.format(vel))
                ret = (self.buf_timestamp, self.buf_x, self.buf_y, vel, new_theta, theta_dist_rate, head_delta, dist, total_dist)

                

            self.buf_x=pos_x 
            self.buf_y=pos_y
            self.buf_theta = new_theta
            self.buf_timestamp = time_stamp
            self.buf_prev_dist = total_dist

            return ret
    
    def src_add( self, pos_x, pos_y, time_stamp ) :
        # Add the source information to the buffer structure, if any returns, add those to the main structure.
        if self.src_pos_type == 'llh' :
            if self.utm == None :
                self.utm = utm.utm(pos_y, 0)
            
            (pos_x, pos_y) = self.utm.llh2utm((pos_x,pos_y))

        # Call the buffering function for adding new points:
        ret = self.src_buffer_add( pos_x, pos_y, time_stamp )

        if ret != None :
            # Add the item to the list
            self.src_data.add( ret )
            if self.src_data.curr_max_idx + 1 >= self.src_min_points :
                self.ready=True

    def targ_velocity(self, rov_vel, rov_hdg, ref_vel, cp_hdg, cp_hdg_rate, cp_hdg_delta, time_delta):
        
        # Calculate the max velocity from lateral acceleration
        if abs(cp_hdg_delta) > self.rov_ang_tol :
            v_acc = (2 * self.rov_max_lat_acc * np.sin(cp_hdg_delta/2)) / cp_hdg_delta
        elif abs(geometry.angle_min_diff(rov_hdg,cp_hdg)) > self.rov_ang_tol :
            v_acc = self.rov_min_speed

        else :
            v_acc = self.rov_max_speed

        dv = self.rov_acc_max * time_delta
        v_allow_max = max(ref_vel, v_acc, self.rov_min_speed, rov_vel + dv)
        v_allow_min = min(max(v_allow_max, rov_vel - dv), self.rov_max_speed)
        
        return v_allow_min

    def controller_step(self, time_stamp, rov_x, rov_y, rov_heading):
        # This will step through the controller function to output target heading and the error of the heading
        hdg_targ = None 
        vel_targ = None 
        lateness = None 
        
        # input check
        if np.isnan(time_stamp) or np.isnan(rov_x) or np.isnan(rov_y) or np.isnan(rov_heading) :
            raise ValueError('Inputs cannot be NaN {}, {}, {}, {}'.format(time_stamp, rov_x, rov_y, rov_heading))

        if self.rov_pos_type == 'llh' :
            if self.utm == None :
                self.utm = utm.utm(rov_y, 0)
            
            (rov_x, rov_y) = self.utm.llh2utm((rov_x, rov_y))
        
        if self.ready :
            # This will compute the heading error and target velocity
            arr = self.src_data.get_whole_array()
            vec_x = arr[:,self.idx_x]
            vec_y = arr[:,self.idx_y]

            # Find the closest point on the spline 
            closest_idx = geometry.min_idx_dist2D_w_arr( rov_x, rov_y, vec_x, vec_y)
            if self.min_cp_idx == None or closest_idx >= self.min_cp_idx :
                self.min_cp_idx = closest_idx
            else :
                closest_idx = self.min_cp_idx

            if self.src_data.show_last()[self.idx_tot_dist] - arr[closest_idx, self.idx_tot_dist] > self.src_min_dist :
                # gather the details from the closest index
                cp_timestamp = arr[closest_idx, self.idx_timestamp]
                cp_x = arr[closest_idx, self.idx_x]
                cp_y = arr[closest_idx, self.idx_y]
                #cur_vel = self.rov_min_speed
                #try:
                #        cur_vel = arr[self.src_data.curr_max_idx, self.idx_vel]
                #except IndexError:
                #        cur_Vel = arr[self.src_data.curr_max_idx-1, self.idx_vel]
                cp_vel = arr[closest_idx, self.idx_vel]
                cp_hdg = arr[closest_idx, self.idx_heading]
                cp_hdg_rate = arr[closest_idx, self.idx_heading_dist_rate]
                cp_hdg_delta = arr[closest_idx, self.idx_heading_delta]

                # Calculate how many seconds behind the rover is:
                lateness=cp_timestamp-time_stamp
                look_ahead=2
                hdg_targ_unbounded = self.targ_hdg_fnc(rov_x, rov_y, rov_heading, cp_x, cp_y, cp_hdg)
                next_point_brg = geometry.bearing( (rov_x, rov_y), (arr[closest_idx+look_ahead,self.idx_x],arr[closest_idx+look_ahead,self.idx_y]))
                hdg_targ = hdg_targ_unbounded
                #hdg_targ = geometry.targ_angle_bound(hdg_targ_unbounded, next_point_brg, cp_hdg)
                new_time_stamp = time.time()
                time_delta = new_time_stamp - self.rov_time_stamp
                vel_targ = self.targ_velocity(self.prev_rov_vel_targ, rov_heading, cp_vel, cp_hdg, cp_hdg_rate, cp_hdg_delta, time_delta)
                halt=False
                self.rov_time_stamp = new_time_stamp
                self.prev_rov_vel_targ = vel_targ
            
            
        if hdg_targ == None and vel_targ == None and lateness == None :
            # This will return 0 for all responses
            hdg_targ = rov_heading
            vel_targ = 0
            lateness = 0
            halt=True

        return (hdg_targ, vel_targ, lateness, halt)
