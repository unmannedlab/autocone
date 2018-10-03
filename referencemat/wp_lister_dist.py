#!/bin/env python
from dronekit import *
import rospy
from geometry_msgs.msg import *
from geopy.distance import geodesic

def callback(data):
	if len(wp_list)==0:
		wp_list.append(data)
	elif geodesic((data.x,data.y),(wp_list[len(wp_list)-1].x,wp_list[len(wp_list)-1].y)).meters >= dist_limit:
		wp_list.append(data)
		rospy.loginfo("GPS_List: %s"%wp_list)
def listener():
	rospy.init_node('GPS_Lister')
	rospy.Subscriber("GPS_Pubber", Pose2D, callback)
	rospy.spin()

if __name__ == '__main__':
	dist_limit = 1
	wp_list = list()
	global wp_list
	listener()

