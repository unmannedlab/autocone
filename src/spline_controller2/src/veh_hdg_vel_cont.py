import rospy
import time

# Import ros messages
from std_msgs.msg import *
from geometry_msgs.msg import *
from ubxtranslator.msg import relpos2D

# Import controller items
from heading_rate_controller import PID_hdg
from vehicle_transforms import tf_skid_steering

class ros_hdg_vel_controller:
    """
    """
    def __init__(
        self,
        heading_controller,
        vehicle_transform,
        node_name,
        rover_pos_topic,
        rover_pos_type,
        left_velocity_topic,
        right_velocity_topic,
        velocity_type,
        command_vel_topic,
        command_hdg_topic,
        command_type
        ):

        # Initialize the rospy node
        rospy.init_node(node_name)

        # Initialize internal objects
        self.hc = heading_controller
        self.tf = vehicle_transform

        # Initialize internal variables
        self.rov_theta_current = None 
        self.rov_cmd_vel_current = None
        self.rov_cmd_hdg_current = None
        self.rover_pos_topic = rover_pos_topic
        self.rover_pos_type = rover_pos_type
        self.node_name = node_name
        self.lt_topic = left_velocity_topic
        self.rt_topic = right_velocity_topic
        self.vel_type = velocity_type
        self.cmd_topic_vel = command_vel_topic
        self.cmd_topic_hdg = command_hdg_topic
        self.cmd_type = command_type
        self.time_start = time.time()
        
        # Initialize left and right publishers
        self.pub_lt = rospy.Publisher(self.lt_topic, self.vel_type, queue_size=10)
        self.msg_lt = self.vel_type()
        self.pub_rt = rospy.Publisher(self.rt_topic, self.vel_type, queue_size=10)
        self.msg_rt = self.vel_type()

    def callback_rov_pos(
        self,
        data
        ):
        rospy.loginfo('Got the rover {}'.format(data))
        self.rov_theta_current = geometry.deg2rad(data.pos.theta)
    
    def callback_cmd_vel(
        self,
        data    
        ):
        rospy.loginfo('Got the vel cmd {}'.format(data))
        self.rov_cmd_vel_current = data.data
    
    def callback_cmd_hdg(
        self,
        data
        ):
        rospy.loginfo('Got the hdg cmd {}'.format(data))
        self.rov_cmd_hdg_current = data.data

        # Peform update commands
        if self.rov_theta_current != None and self.rov_cmd_vel_current != None and self.rov_cmd_hdg_current != None :
            t = time.time() - self.time_start
            hdg_rate = self.hc.step( self.rov_cmd_hdg_current, self.rov_theta_current, t)
            (rvel, lvel) = self.tf.transform( hdg_rate, self.rov_cmd_vel_current)

            rospy.loginfo('Sending the following commands \n target heading: {} \n target velocity: {} heading_rate: {} \n left/right velocity : {} / {}'.format(targ_hdg, targ_vel, hdg_rate, rvel, lvel))
            self.msg_lt.data = lvel 
            self.msg_rt.data = rvel 

            self.pub_lt.publish( self.msg_lt )
            self.pub_rt.publish( self.msg_rt )

    def listener( self ) :
        # Starat the subscribers
        rospy.Subscriber(self.rover_pos_topic, self.rover_pos_type, self.callback_rov_pos)
        rospy.Subscriber(self.cmd_topic_vel, self.command_type, self.callback_cmd_vel)
        rospy.Subscriber(self.cmd_topic_hdg, self.command_type, self.callback_cmd_hdg)

        # Use rospy spin to hold the node open or whatever
        rospy.spin()

if __name__=='__main__' :
    # This is going to run the heading / velocity control loop
    kp = 1
    ki = 0
    kd = 0

    # Initialize the heading controller and the transform
    hc = PID_hdg(kp, ki, kd)

    tf = tf_skid_steering( 0.5, 0.254 )

    controller = ros_hdg_vel_controller(
        heading_controller=hc,
        vehicle_transform=tf,
        node_name='rover_vel_hdg_controller',
        rover_pos_topic='/UBX/hpposllh',
        rover_pos_type=relpos2D,
        left_velocity_topic='/left_wheel_velocity_controller/command',
        right_velocity_topic='/right_wheel_velocity_controller/command',
        velocity_type=Float64,
        command_vel_topic='/rov_cmd/vel',
        command_hdg_topic='/rov_cmd/hdg',
        command_type=Float64
    )

    controller.listener()    