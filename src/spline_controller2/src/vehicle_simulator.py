# import libraries
import numpy as np 
class sim_skid_steering :
    """This class will simulate by integration the movement of a skid steering platform"""
    def __init__( self, axel_length, wheel_diameter, start_x, start_y, start_theta, init_time, acc_constant, input_dim='angular' ):

        # Save internal parameters
        self.ax = axel_length
        self.wd = wheel_diameter
        self.x = [start_x]
        self.y = [start_y]
        self.vr = [0]
        self.vl = [0]
        self.theta = [start_theta]
        self.time = [init_time]
        self.acc = acc_constant
        self.id = input_dim
        

    def step( self, rvel, lvel, time_stamp ) :
        if np.isnan(rvel) or np.isnan(lvel) or np.isnan( time_stamp):
            raise ValueError('The inputs cannot be nan values {}, {}, {}'.format(rvel,lvel,time_stamp))
        if not(rvel == 0 and lvel == 0) :
            new_vr = self.acc * (rvel - self.vr[-1]) * (time_stamp - self.time[-1]) + self.vr[-1]
            new_vl = self.acc * (lvel - self.vl[-1]) * (time_stamp - self.time[-1]) + self.vl[-1]

            dist = (time_stamp - self.time[-1]) * (self.vr[-1] + self.vl[-1]) / 2
            delta_theta = (time_stamp - self.time[-1]) * (self.vr[-1] - self.vl[-1]) / self.ax

            new_theta = self.theta[-1] + delta_theta 

            new_x = self.x[-1] + dist * np.cos(new_theta)
            new_y = self.y[-1] + dist * np.sin(new_theta)

            self.vr.append(new_vr)
            self.vl.append(new_vl)
            self.theta.append(new_theta)
            self.time.append(time_stamp)
            self.x.append(new_x)
            self.y.append(new_y)

            return (new_x,new_y,new_theta)
        else:
            return (self.x[-1], self.y[-1], self.theta[-1])