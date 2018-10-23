import list_manipulation, rospy, math
from geometry_msgs.msg import *
from geopy.distance import geodesic

global dist_follow
global wp_list
global car_speed
global gps_gap
global no_cars
def callback(data):
	idx = len(wp_list)-1
	if len(wp_list)==0:
		wp_list.append((data.LLA))
	elif geodesic((data.LLA.x,data.LLA.y),(wp[idx].x, wp[idx].y)).meters >= gps_gap:
		wp_list = list_manipulation.buffer_add(wp_list, data.LLA, int(math.ceil(2*no_cars*dist_follow/gps_gap)))
