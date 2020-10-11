"""
"""

# Import libraries
import numpy as np 

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
        rov_max_lat_acc,
        min_src_gap,
        min_src_dist,
        min_points,
        max_points
        ) :

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
        self.rov_max_lat_acc = rov_max_lat_acc
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

        self.ready = False

    def src_buffer_add( self, pos_x, pos_y, time_stamp ) :

        # Check which step we're on
        a
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

    def targ_velocity(self, cp_vel, cp_hdg_rate, cp_hdg_delta):
        
        # Calculate the max velocity from lateral acceleration
        if cp_hdg_delta != 0 :
            v_acc = (2 * self.rov_max_lat_acc * np.sin(cp_hdg_delta/2)) / cp_hdg_delta
        else :
            v_acc = self.rov_max_speed
        v_src = max(cp_vel, self.rov_min_speed)
        v_allow = min(v_acc, v_src, self.rov_max_speed)

        return v_allow

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

            if self.src_data.show_last()[self.idx_tot_dist] - arr[closest_idx, self.idx_tot_dist] > self.src_min_dist :
                # gather the details from the closest index
                cp_timestamp = arr[closest_idx, self.idx_timestamp]
                cp_x = arr[closest_idx, self.idx_x]
                cp_y = arr[closest_idx, self.idx_y]
                cp_vel = arr[closest_idx, self.idx_vel]
                cp_hdg = arr[closest_idx, self.idx_heading]
                cp_hdg_rate = arr[closest_idx, self.idx_heading_dist_rate]
                cp_hdg_delta = arr[closest_idx, self.idx_heading_delta]

                # Calculate how many seconds behind the rover is:
                lateness=cp_timestamp-time_stamp
                look_ahead=2
                hdg_targ_unbounded = self.targ_hdg_fnc(rov_x, rov_y, rov_heading, cp_x, cp_y, cp_hdg)
                next_point_brg = geometry.bearing( (rov_x, rov_y), (arr[closest_idx+look_ahead,self.idx_x],arr[closest_idx+look_ahead,self.idx_y]))
                hdg_targ = geometry.targ_angle_bound(hdg_targ_unbounded, next_point_brg, cp_hdg)
                vel_targ = self.targ_velocity( cp_vel, cp_hdg_rate, cp_hdg_delta)
                halt=False
            
            
        if hdg_targ == None and vel_targ == None and lateness == None :
            # This will return 0 for all responses
            hdg_targ = 0
            vel_targ = 0
            lateness = 0
            halt=True

        return (hdg_targ, vel_targ, lateness, halt)
