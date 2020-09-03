"""
"""
#import numpy as np
#import geometry

class tf_skid_steering :
    """This will accomplish the transforms for the takn skid steering"""
    def __init__(self, axel_length, wheel_diameter, input_dim='linear', output_dim='linear') :

        # Set internal parameters

        self.ax = axel_length
        self.wd = wheel_diameter
        self.id = input_dim
        self.od = output_dim

    def transform( self, yaw_rate, velocity ) :
        yaw_rate_contrib = 0.5 * yaw_rate * self.ax 

        rvel = velocity + yaw_rate_contrib
        lvel = velocity - yaw_rate_contrib

        if self.id==self.od :
            return (rvel, lvel)
        elif self.id == 'linear' and self.od == 'angular':
            rvel /= self.wd/2
            lvel /= self.wd/2

            return (rvel, lvel)
        
        elif self.id=='angular' and self.od =='linear' :
            rvel *= self.wd/2
            lvel *= self.wd/2

            return (rvel, lvel)
        
    
