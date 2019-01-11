import list_manipulation, rospy, math
from geometry_msgs.msg import *
from geopy.distance import geodesic

global dist_follow
global wp_list
global car_speed
global gps_gap
global cars_list
# car = (sysid, follow_dist)





def callback(data):
	idx = len(wp_list)-1
	if len(wp_list)==0:
		wp_list.append((data.LLA))
	elif geodesic((data.LLA.x,data.LLA.y),(wp[idx].x, wp[idx].y)).meters >= gps_gap:
		wp_list = list_manipulation.buffer_add(wp_list, data.LLA, int(math.ceil(2*no_cars*dist_follow/gps_gap)))
	for car in cars_list:
		dist_idx = int(math.ceil(car[1]))
		
		
def listener():
	rospy.init_node('gps_publisher_node')
	rospy.Subscriber('vn300/ins',Vector3,callback)
	rospy.spin()

if __name__=='__main__':
	dist_follow = 5
	car_speed = 2
	gps_gap=1
	car = (1, 1*dist_follow)
	cars_list = [car]
	
	listener()
