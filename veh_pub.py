#!/bin/env python
from dronekit import *
import rospy
from geometry_msgs import *
cnct_str = '/dev/ttyACM0'
baud_rate = 115200
hb_to = 300
update_rate = 1
from geometry_msgs.msg import *

vehicle = connect(cnct_str, baud=baud_rate, wait_ready=True, heartbeat_timeout=hb_to)

cont_var = True

rospy.init_node('gps_pub', disable_signals=True)
r = rospy.Rate(update_rate)
pub = rospy.Publisher('GPS_Pubber', Pose2D, queue_size=10)
try:
	while cont_var:
	
		msg = Pose2D(vehicle.location.global_frame.lat, vehicle.location.global_frame.lon, vehicle.heading)
		pub.publish(msg)
		
	
		r.sleep()

except KeyboardInterrupt:
	print('Keyboard Interrupt, stopping publisher')
	cont_var = False

