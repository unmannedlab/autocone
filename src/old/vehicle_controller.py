 # Import libraries

import numpy as np
import utm 
from spline_controller import spline_controller
import utils 
import geometry

class vehicle_controller :
    """This will act as a go manager of various parts of the control schema"""
    def __init__(
        self, 
        spline_controller_obj,
        heading_rate_cont_obj,
        vehicle_control_transform_obj
        ):

        # Save internal objects
        self.sc = spline_controller_obj
        self.hc = heading_rate_cont_obj
        self.vct = vehicle_control_transform_obj

    
    def src_add( self, pos_x, pos_y, time_stamp ) :
        self.sc.src_add( pos_x, pos_y, time_stamp )

    def controller_step( self, time_stamp, rov_x, rov_y, rov_heading ):
        # First iterate through the spline controller
        (hdg_targ, vel_targ, lateness, halt) = self.sc.controller_step( time_stamp, rov_x, rov_y, rov_heading )

        hdg_rate = self.hc.step(hdg_targ, rov_heading, time_stamp)
        # Next generate the steering commands
        return (self.vct.transform( hdg_rate, vel_targ ), lateness, halt)