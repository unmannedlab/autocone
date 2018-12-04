#!/bin/env python

'''
Purposes of this code:
- publish this vehicle's position
- subscribe and send the vehicle to the indicated positions from the remote publisher
- subscribe and control the arming on this vehicle from the remote publisher

List of improvements:
- more checking for wrong movements
- error checking


'''
from std_msgs.msg import String
from geometry_msgs.msg import Vector3

from dronekit import *
from geopy.distance import geodesic
import math, rospy

# Declare global variables
global vehicle
global verbose
global spd
global wp_rad

# Vehicle connection
def connector(property_list):
	cnct_str = property_list[1]
	baud_rate = property_list[2]
	hb_to = property_list[3]
	vehicle = connect(cnct_str, baud=baud_rate, wait_ready=True, heartbeat_timeout=hb_to)
	return vehicle


# GPS waypoint format converters
# Between ros and dronekit vector3 mag
def vector3_2_dk(msg):
	dk_wp = LocationGlobal(msg.x, msg.y, msg.z)
	return dk_wp
def dk_2_vector3(wp):
	msg = Vector3(wp.lat, wp.lon, wp.alt)
	return msg
# Between ros vector3 and geopy
def vector3_2_geopy(msg):
	wp = (msg.x, msg.y)
	return wp
def geopy_2_vector3(wp, alt=100):
	msg = Vector3(wp[0], wp[1], alt)
	return msg
# Between dronekit and geopy
def dk_2_geopy(wp):
	geopy_wp = (wp.lat, wp.lon)
	return geopy_wp
def geopy_2_dk(wp, alt=100):
	dk_wp = LocationGlobal(wp[0], wp[1], alt)
	return dk_wp	


# Simplistic command to control the arming and disarming of the vehicle
def AD(vehicle, AD_cmd, verbose=True):
	if AD_cmd=='arm':
		vehicle.armed=True
	else:
		vehicle.armed=False

# Function which sends the vehicle to the specific waypoint
def sender(vehicle, wp, spd, wp_rad, verbose=True):
	vehicle.simple_goto(wp)

# Callback for following:
def wp_send_cb(data):
	rospy.loginfo('WP set:\t %s,\t %s'%(data.x, data.y))
	wp = vector3_2_dk(data)
	sender(vehicle, wp, spd, wp_rad, verbose)

# Callback for arming and disarming
def AD_cb(data):
	rospy.loginfo('Arm/Disarm set:\t %s'%(data.data))
	AD(vehicle, data.data, verbose)

# Listener Function
def listener(node_str, sub1_str, sub2_str, message_type1, message_type2, cb1, cb2):
	# Create rospy node
	rospy.init_node(node_str)
	# Create Subscriber for sub1
	rospy.Subscriber(sub1_str, message_type1, cb1)
	# Create Subscriber for WP
	rospy.Subscriber(sub2_str, message_type2, cb2)
	# Rospy Spin to keep then subscribers from closing
	rospy.spin()

# Function to recover the vehicle number as a string from a file
def car_prop_reader():
	with open('car_properties.txt') as f:
		property_list = [ line.strip() for line in list(f) ]
		f.close()
	# Index:Property
	# 0:car_no
	# 1:connection string
	# 2:baud rate
	# 3:heartbeat timeout
	# 4:follow distance
	# 5:wp radius
	# 6:speed
	return property_list
	
def rospy_str_ctr(property_list):
	# Retrieve the cars properties
	car_no = property_list[0]
	
	node_str = 'car_' + car_no + '_control'
	sub1_str = 'AD_cmd'
	sub2_str = 'wp_cmd_car_' + car_no
	
	message_type1 = String()
	message_type2 = Vector3()
	
	cb1 = AD_cb
	cb2 = wp_send_cb
	return(node_str, sub1_str, sub2_str, message_type1, message_type2, cb1, cb2)
	
	
	
	
if __name__ == '__main__':
	verbose = True
	# Read the property list from the file
	property_list = car_prop_reader()
	
	wp_rad = property_list[5]
	spd = property_list[6]
	
	# Connect to the vehicle:
	vehicle = connector(property_list)
	
	# Generate all the rospy parameters:
	(node_str, sub1_str, sub2_str, message_type1, message_type2, cb1, cb2) = rospy_str_ctr(property_list)
	
	# Begin when ready
	input('Press enter to begin')
	listener(node_str, sub1_str, sub2_str, message_type1, message_type2, cb1, cb2)
	
	# Disarm and close the connection
	vehicle.armed=False
	vehicle.close()
	
