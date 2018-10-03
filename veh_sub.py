#!/bin/env python
from dronekit import *
import rospy
from geometry_msgs.msg import *

def callback(data):
	rospy.loginfo("I heard this gps loc/heading: %s, %s, %s"%(data.x, data.y, data.theta))

def listener():
	rospy.init_node('GPS_Sub')
	rospy.Subscriber("GPS_Pubber", Pose2D, callback)
	rospy.spin()

if __name__ == '__main__':
	listener()
