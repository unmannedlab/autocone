import rospy
import time

# Import ros messages 
from std_msgs.msg import *
from geometry_msgs.msg import *
from ubxtranslator.msg import relpos2D, llh

# Import controller items
from spline_controller import spline_controller
from vehicle_controller import vehicle_controller
from heading_rate_controller import PID_hdg
from vehicle_transforms import tf_skid_steering
import geometry
class ros_skid_steering_controller:
    """
    """
    def __init__(
        self,
        vehicle_controller,
        node_name,
        source_gps_topic,
        source_gps_type,
        rover_gps_topic,
        rover_gps_type,
        rover_pos_topic,
        rover_pos_type,
        left_velocity_topic,
        right_velocity_topic,
        velocity_type
        ):

        # Initialize internal objects
        self.vc = vehicle_controller
        
        #self.tf = vehicle_control_transform_obj

        # Initialize internal variables
        self.src_topic = source_gps_topic
        self.src_type = source_gps_type
        self.rov_gps_topic = rover_gps_topic
        self.rov_gps_type = rover_gps_type
        self.rov_pos_topic = rover_pos_topic
        self.rov_pos_type = rover_pos_type
        self.node_name = node_name
        self.lt_topic = left_velocity_topic
        self.rt_topic = right_velocity_topic
        self.vel_type = velocity_type

        # Initialize left velocity publisher and message
        self.pub_lt = rospy.Publisher(self.lt_topic, self.vel_type, queue_size=None)
        self.msg_lt = self.vel_type()

        # Initialize right velocity publisher
        self.pub_rt = rospy.Publisher(self.rt_topic, self.vel_type, queue_size=None)
        self.msg_rt = self.vel_type()

    def callback_source_gps( self, data ):
        # Add the source gps point to the data stack of the rover controller
        
        # Define x, y, t
        x=data.llh.lat
        y=data.llh.lon
        t=time.time()

        # Add the source GPS point to the spline controller:
        self.vc.src_add(x, y, t)
    
    def callback_rover_pos( self, data ):
        # Produce the heading

        self.rov_theta_current = geometry.deg2rad(data.pos.theta) 

    def callback_rover_gps( self, data ):
        # Produce rover feedback control:

        # Define parameters
        rov_x = data.llh.lat
        rov_y = data.llh.lon
        rov_theta = self.rov_theta_current
        t = time.time()

        # Produce the control feedback
        ((rvel, lvel), lateness, halt ) = self.vc.controller_step( t, rov_x, rov_y, rov_theta )
        
        self.msg_lt.data = lvel 
        self.msg_rt.data = rvel 
        self.pub_lt.publish( self.msg_lt )
        self.pub_rt.publish( self.msg_rt )
        
    def listener( self ):
        # Start the subscribers

        # Start the node
        rospy.init_node(self.node_name)

        # Start the subscriber call back loops
        rospy.Subscriber(self.src_topic, self.src_type, self.callback_source_gps)
        rospy.Subscriber(self.rov_pos_topic, self.rov_pos_type, self.callback_rover_pos)
        rospy.Subscriber(self.rov_gps_topic, self.rov_gps_type, self.callback_rover_gps)

        # Use rospy spin to watch the nodes
        rospy.spin()




if __name__ == '__main__' :
    # This is running control loop

    # Initialize parameters
    kp = 2.0
    ki = 0.0
    kd = 1.0
    acc = 1.0

    # Initialize the spline controller
    sc = spline_controller(
        targ_hdg_fnc=geometry.target_heading_function,
        src_type='llh',
        rov_type='llh',
        rov_max_speed=1.0,
        rov_min_speed=0.5,
        rov_max_lat_acc=1.0,
        min_src_gap=1.0,
        min_src_dist=5.0,
        min_points=10,
        max_points=10000
    )
    
    # Initialize the heading controller
    hc = PID_hdg(kp, ki, kd)

    tf = tf_skid_steering( 0.5, 0.254 )

    # Initialize the vehicle controller
    vc = vehicle_controller(
        spline_controller_obj=sc,
        heading_rate_cont_obj=hc,
        vehicle_control_transform_obj=tf
    )

    ros_controller = ros_skid_steering_controller(
        vehicle_controller=vc,
        node_name='ros_spline_controller',
        source_gps_topic='/src_UBX/hpposllh',
        source_gps_type=llh,
        rover_gps_topic='/UBX/hpposllh',
        rover_gps_type=llh,
        rover_pos_topic='/UBX/relpos2D',
        rover_pos_type=relpos2D,
        left_velocity_topic='/left_wheel_velocity_controller/command',
        right_velocity_topic='/right_wheel_velocity_controller/command',
        velocity_type=Float32
    )

    ros_controller.listener()