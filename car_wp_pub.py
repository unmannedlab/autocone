
#!/bin/env python
from dronekit import *
import rospy
from geometry_msgs.msg import *
from vn300.msg import *
from geopy.distance import geodesic
from multiprocessing import Process
import list_manipulation
global dist_limit
global dist_follow
global wp
def wp_indexer(car_mult, dist_follow):
	dist_sum = 0
	idx = 0
	while ((dist_sum<car_mult*dist_follow) and (idx<(len(wp_list)-2))):
		idx_prev = idx
		idx += 1
		dist_add = geodesic((wp_list[idx].x,wp_list[idx].y),(wp_list[idx_prev].x,wp_list[idx_prev].y)).meters
		dist_sum += dist_add
		#print(dist_sum)

	car_wp = wp_list[idx]
	return car_wp


def callback(data):
	if len(wp_list)==0:
		wp_list.append(data.LLA)
	elif geodesic((data.LLA.x,data.LLA.y),(wp_list[0].x,wp_list[0].y)).meters >= dist_limit:
		wp_list = list_manipulation.buffer_add(wp_list, data.LLA, 60)
		#rospy.loginfo("GPS_List: %s"%wp_list)
		wp = wp_indexer(car_mult, dist_follow)
		msg=Vector3(wp.x, wp.y, wp.z)
		rospy.loginfo(msg)
		global pub
		pub.publish(msg)
def listener():
	node_str = 'gps_pub_car_' + str(car_mult)
	rospy.init_node(node_str)

	pub_str = 'gps_' + str(car_mult) + '_pub'
	global pub
	pub = rospy.Publisher(pub_str, Vector3, queue_size=None)

	rospy.Subscriber("vectornav/ins", ins, callback)
	rospy.spin()

if __name__ == '__main__':
	dist_limit = 1
	dist_follow = 5
	update_rate = 1
	car_mult = 1
	wp_list = list()
	global wp_list
	listener()
