"""
Testing script for testing the motor controllers.
"""
# Import relevant libraries
import rospy
import time

# Import ros messages
from std_msgs.msg import *

class ros_vel_tester:
    def __init__(
        self,
        node_str,
        left_velocity_topic,
        right_velocity_topic,
        velocity_msg_type,
        queue_size,
        frequency_hz
        ):
        """
        Inputs:
        node_str:               The string which the node will be broadcast as
        left_velocity_topic:    The topic which the commands for the left motor velocity will be broadcasted on
        right_velocity_topic:   The topic which the commands for the right motor velocity will be broadcasted on
        velocity_msg_type:      The ros message type which will be used for sending the velocities
        queue_size:             Ros publisher parameter
        frequency_hz:           The frequency of publishing the velocity commands
        """

        # Create initialize the rosnode
        rospy.init_node(node_str)

        # Save the internal values:
        self.delay = 1/frequency_hz

        # Initialize the rospy
        self.lpub = rospy.Publisher(left_velocity_topic, velocity_msg_type, queue_size=queue_size)
        self.rpub = rospy.Publisher(right_velocity_topic, velocity_msg_type, queue_size=queue_size)

        # Initialize the messages:
        self.vmsg = velocity_msg_type

    def velocity_test(
        self,
        velocity,
        time_length    
        ):

        # Update the message
        self.vmsg.data = velocity

        # Save the end time
        et = time.time() + time_length
        
        rospy.loginfo('Sending the velocity command of {} for {} seconds'.format(velocity, time_length))
        while time.time() <= et :
            
            # Send the velocity commands
            lpub.publish(self.vmsg)
            rpub.publish(self.vmsg)

            time.sleep(self.delay)

        rospy.loginfo('Complete!')

    def run(
        self
        ):
        try:
            # Loop for control inputs
            while True:
                print('Input the desired velocity:\n')
                vel = float(Input(''))
                print('\nInput time:\n')
                time_length = float(Input(''))
                self.velocity_test(vel, time_length)

        except KeyboardInterrupt:
            print('\n\nKeyboard Interrupt\n\n')

if __name__=='__main__' :
    
    # Initialize:
    veltester = ros_vel_tester(
        'velocity_tester',
        '/left_wheel_velocity_controller/command',
        '/right_wheel_velocity_controller/command',
        Float64,
        10,
        10
        )
    
    veltester.run()
        