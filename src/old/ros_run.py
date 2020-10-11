import rospy
from std_msgs.msg import *
from geometry_msgs.msg import *
from ubxtranslator.msg import relpos2D, llh

class ros_skid_steering_controller:
    """
    """
    def __init__(
        self,
        spline_controller_obj,
        heading_rate_cont_obj,
        #vehicle_control_transform_obj,
        node_name,
        source_gps_topic,
        source_gps_type,
        rover_gps_topic,
        rover_gps_type,
        left_velocity_topic,
        right_velocity_topic,
        velocity_type
        ):

        # Initialize internal objects
        self.sc = spline_controller_obj
        self.hc = heading_rate_cont_obj
        #self.tf = vehicle_control_transform_obj

        # Initialize internal variables
        self.src_topic = source_gps_topic
        self.src_type = source_gps_type
        self.rov_topic = rover_gps_topic
        self.rov_type = rover_gps_type
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
        x= 
        y=
        t= 

        # Add the source GPS point to the spline controller:
        self.sc.src_add(x, y, t)
    
    def callback_rover_gps( self, data ):
        # Produce rover feedback control:

        # Define parameters
        rov_x =
        rov_y =
        rov_theta =
        t = 

        # Produce the control feedback
        ((rvel, lvel), lateness, halt ) = self.sc( t, rov_x, rov_y, rov_theta )
        
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
        rospy.Subscriber(self.rov_topic, self.rov_type, self.callback_rover_gps)

        # Use rospy spin to watch the nodes
        rospy.spin()




if __name__ == '__main__' :
    # This is 