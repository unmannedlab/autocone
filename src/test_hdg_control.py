# Import relevant libraries
import rospy
import time

# Import ros messages
from std_msgs.msg import *

class ros_vel_tester:
    """
    """
    def __init__(
        self,
        node_str,
        command_vel_topic,
        command_hdg_topic,
        command_type,
        queue_size,
        frequency_hz
        ):

        # Create initialize the rosnode
        rospy.init_node(node_str)

        # Save the internal values:
        self.delay = 1/frequency_hz

        # Initialize the rospy publishers
        self.vpub = rospy.Publisher( command_vel_topic, command_type, queue_size=queue_size)
        self.hpub = rospy.Publisher( command_hdg_topic, command_type, queue_size=queue_size)
        # Initialize the message
        self.vmsg = command_type()
        self.hmsg = command_type()

    def velhdg_test(
        self,
        velocity,
        heading,
        time_length    
        ):

        # Update the message
        self.vmsg.data = velocity
        self.hmsg.data = heading

        # Save the end time
        et = time.time() + time_length
        
        rospy.loginfo('Sending the velocity command of {} for {} seconds'.format(velocity, time_length))
        while time.time() <= et :
            
            # Send the velocity commands
            self.vpub.publish(self.vmsg)
            self.hpub.publish(self.hmsg)

            time.sleep(self.delay)

        rospy.loginfo('Complete!')

    def run(
        self
        ):
        try:
            # Loop for control inputs
            while True:
                print('Input the desired velocity:\n')
                vel = float(input(''))
                print('Input the desired heading:\n')
                hdg = float(input(''))
                print('\nInput time:\n')
                time_length = float(input(''))
                self.velhdg_test(vel, hdg, time_length)

        except KeyboardInterrupt:
            print('\n\nKeyboard Interrupt\n\n')

if __name__=='__main__' :
    
    # Initialize:
    tester = ros_vel_tester(
        'hdg_vel_tester',
        '/rov_cmd/vel',
        '/rov_cmd/hdg',
        Float64,
        10,
        10
        )
    
    tester.run()
        