#!/bin/env python
from dronekit import *
import rospy
from geometry_msgs.msg import *
global car_mult

def callback(data):
	rospy.loginfo("%s, %s, %s"%(data.x, data.y, data.theta))

def listener():
	node_str = 'GPS_' + str(car_mult) + '_sub'
	pub_str = 'gps_' + str(car_mult) + '_pub'
	rospy.init_node(node_str)
	rospy.Subscriber(pub_str, Pose2D, callback)
	rospy.spin()

if __name__ == '__main__':
	car_mult = 1
	listener()
