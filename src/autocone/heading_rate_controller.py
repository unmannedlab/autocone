# Import libraries
import numpy as np 
from autocone.geometry import angle_min_diff

class PID_hdg :
    def __init__(self, kp, ki, kd):
        
        # Define internal parameters
        self.kp = kp 
        self.ki = ki 
        self.kd = kd 

        # Define future parameters
        self.prev_timestamp = None
        self.prev_error = None
        self.i_sum = 0

    def calc_p_term(self, error, timedelta):
        return self.kp * error 
    
    def calc_i_term(self, error, timedelta):
        if timedelta < 1:
            self.i_sum += error*timedelta
            return self.ki * self.i_sum
        else:
            return 0
    def calc_d_term(self, error, timedelta):
        if timedelta == 0 :
            return 0
        else:
            return self.kd * (error-self.prev_error) / timedelta
    
    def error_calc( self, target, feedback ):
        return angle_min_diff(target, feedback)
    
    def step( self, target, feedback, timestamp ):
        # Preliminary calculations:
        if self.prev_timestamp == None:
            self.prev_timestamp = timestamp
        timedelta = timestamp - self.prev_timestamp
        #print('Target heading: {}'.format(target))
        #print('Feedback heading: {}'.format(feedback))
        error = self.error_calc(target, feedback)
        #print('Error: {}'.format(error))
        PID_res = 0
        for calc_term in [self.calc_p_term, self.calc_d_term, self.calc_i_term] :
            PID_res += calc_term(error, timedelta)
        
        self.prev_timestamp = timestamp
        self.prev_error = error 
        #print('PID_result: {}'.format(PID_res))
        #print('Update delay: {}'.format(timedelta))
        return PID_res

