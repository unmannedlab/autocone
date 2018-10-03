#!/bin/env python
from dronekit import *
import rospy
from geometry_msgs.msg import *
wp_list = list()
global wp_list
def callback(data):
	wp_list.append(data)
	rospy.loginfo("GPS_List: %s"%wp_list)

def listener():
	rospy.init_node('GPS_Lister')
	rospy.Subscriber("GPS_Pubber", Pose2D, callback)
	rospy.spin()

if __name__ == '__main__':
	listener()
