#!/bin/env python
from dronekit import *
import rospy
from geometry_msgs.msg import *
from geopy.distance import geodesic
from multiprocessing import Process
global dist_limit
global dist_follow
global wp_list
global wp
global pub
def wp_indexer(car_mult, dist_follow):
	dist_sum = 0
	idx = 0
	while ((dist_sum<car_mult*dist_follow) and (idx<(len(wp_list)-2))):
		idx_prev = idx
		idx += 1
		dist_add = geodesic((wp_list[idx].x,wp_list[idx],y),(wp_list[idx_prev].x,wp_list[idx_prev].y)).meters
		dist_sum += dist_add
		print(dist_sum)
	
	car_wp = wp_list[idx]
	return car_wp


def callback(data):
	if len(wp_list)==0:
		wp_list.append(data)
	elif geodesic((data.x,data.y),(wp_list[len(wp_list)-1].x,wp_list[len(wp_list)-1].y)).meters >= dist_limit:
		wp_list.append(data)
		rospy.loginfo("GPS_List: %s"%wp_list)
		wp = wp_indexer(car_mult, dist_follow)
		msg = Pose2D(wp.x, wp.y, wp.theta)
		pub.publish(msg)
def listener():
	node_str = 'gps_pub_car_' + str(car_mult)
	rospy.init_node(node_str)

	pub_str = 'gps_' + str(car_mult) + '_pub'
	pub = rospy.Publisher(pub_str, Pose2D, queue_size=None)

	rospy.Subscriber("GPS_Pubber", Pose2D, callback)
	rospy.spin()

if __name__ == '__main__':
	dist_limit = 1
	dist_follow = 5
	update_rate = 1
	car_mult = 1
	wp_list = list()
	global wp_list
	listener()
