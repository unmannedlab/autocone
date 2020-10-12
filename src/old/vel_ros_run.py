import rospy
import time
import pandas as pd
import numpy as np

# Import ros messages 
from std_msgs.msg import *
from geometry_msgs.msg import *
from ubxtranslator.msg import relpos2D, hpposllh

# Import controller items
from spline_controller import spline_controller
from vehicle_controller import vehicle_controller
from heading_rate_controller import PID_hdg
from vehicle_transforms import tf_skid_steering
import geometry

class ros_skid_steering_pure_hdg_controller:
    """
    """
    def __init__(
        self,
        command_dataframe,
        node_name,
        rover_gps_topic,
        rover_gps_type,
        rover_pos_topic,
        rover_pos_type,
        left_velocity_topic,
        right_velocity_topic,
        velocity_type,
        telem_topic_prefix,
        telem_type
        ):
        # Initialize the rospy node
        rospy.init_node(self.node_name)

        # Initialize internal objects
        self.commands = command_dataframe
        
        #self.tf = vehicle_control_transform_obj

        # Initialize internal variables
        self.rov_theta_current = None
        self.rov_gps_topic = rover_gps_topic
        self.rov_gps_type = rover_gps_type
        self.rov_pos_topic = rover_pos_topic
        self.rov_pos_type = rover_pos_type
        self.node_name = node_name
        self.lt_topic = left_velocity_topic
        self.rt_topic = right_velocity_topic
        self.vel_type = velocity_type
        self.telem_topic_prefix = telem_topic_prefix
        self.telem_type = telem_type
        self.time_start = None
        

        # Initialize left velocity publisher and message
        self.pub_lt = rospy.Publisher(self.lt_topic, self.vel_type, queue_size=None)
        self.msg_lt = self.vel_type()

        # Initialize right velocity publisher
        self.pub_rt = rospy.Publisher(self.rt_topic, self.vel_type, queue_size=None)
        self.msg_rt = self.vel_type()

        # Initialize the telemetry publishers
        self.pub_telem_targ_vel = rospy.Publisher(self.telem_topic_prefix+'targ_vel', self.telem_type, queue_size=None)
        self.msg_telem_targ_vel = self.telem_type()

    def get_desired_vel( self, time_val ):
        print(self.commands)
        # First find the first time that's less than or equal the given time
        for idx in range( len( self.commands.index )-1) :
            if self.commands['time'].iloc[idx] <= time_val and self.commands['time'].iloc[idx+1] > time_val:
                
                # second return the desired heading and velocity:
                return self.commands['velocity'].iloc[idx]
        
        return 0
        

    
    def callback_rover_pos( self, data ):
        # Produce the heading
        rospy.loginfo('Got the rover {}'.format(data))
        self.rov_theta_current = geometry.deg2rad(data.pos.theta) 

    def callback_rover_gps( self, data ):
        if self.rov_theta_current != None:
            # Produce rover feedback control:
            rospy.loginfo('Got the rover {}'.format(data))
            # initialize the time
            if self.time_start == None :
                self.time_start = time.time()

            # Define parameters
            #rov_x = data.llh.lat
            #rov_y = data.llh.lon
            #rov_theta = self.rov_theta_current
            t = time.time() - self.time_start
            print(t)
            # Get the desired heading and velocity:
            targ_vel = self.get_desired_vel( t )
 
            lvel = targ_vel
            rvel = targ_vel 

            rospy.loginfo('Sending the following commands \n target heading: {} \n target velocity: {} heading_rate: {} \n left/right velocity command : {}/{}'.format(targ_hdg, targ_vel, hdg_rate, rvel, lvel))
            self.msg_lt.data = lvel 
            self.msg_rt.data = rvel 
            self.msg_telem_targ_vel.data = targ_vel 

            self.pub_lt.publish( self.msg_lt )
            self.pub_rt.publish( self.msg_rt )
            self.pub_telem_targ_vel.publish( self.msg_telem_targ_vel )
        
    def listener( self ):
        # Start the subscribers

        # Start the node

        # Start the subscriber call back loops
        #rospy.Subscriber(self.src_topic, self.src_type, self.callback_source_gps)
        rospy.Subscriber(self.rov_pos_topic, self.rov_pos_type, self.callback_rover_pos)
        rospy.Subscriber(self.rov_gps_topic, self.rov_gps_type, self.callback_rover_gps)

        # Use rospy spin to watch the nodes
        rospy.spin()




if __name__ == '__main__' :
    # This is running control loop

    df = pd.DataFrame(
        {
            'time':[0,2,22],
            'velocity':[0,4.0,4.0]
        }
    )

    ros_controller = ros_skid_steering_pure_hdg_controller(
        heading_controller=hc,
        vehicle_transform=tf,
        command_dataframe=df,
        node_name='ros_spline_controller',
        left_velocity_topic='/left_wheel_velocity_controller/command',
        right_velocity_topic='/right_wheel_velocity_controller/command',
        velocity_type=Float64
    )

    ros_controller.listener()

