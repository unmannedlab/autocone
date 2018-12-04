import rospy, math, gps_manipulation, list_manipulation
from geometry_msgs.msg import *



def gen_pub(wp_list, freq, speed, max_error, pub_str, node_str, queuesize):
	try:
		# Create a simulated list of the waypoints that the VN300 has supposedly passed over while travelling and recorded
		wp_sim_list = gps_manipulation.wp_gen(wp_list, freq, speed, max_error)
		print(wp_sim_list)
		# Create node and publisher
		rospy.init_node(node_str)
		pub = rospy.Publisher(pub_str, Vector3, queue_size=queuesize)
		
		# Create delays:
		r = rospy.Rate(freq)
		
		# oop through the various gps wps and publish them:
		for wp in wp_sim_list:
			# Generate message
			msg = Vector3(wp[0], wp[1], 0)
			# Publish message
			pub.publish(msg)
			# Pause for the required amount of time
			r.sleep()
	except KeyboardInterrupt:
		print('KBI')
if __name__ == '__main__':
	# Trying for specific waypoints
	wp_list = [(30,-96), (31,-94), (32,-95)]
	freq = 100
	speed = 7
	max_error = 0.0000001
	pub_str = 'vn300/ins'
	node_str = 'vn_pubber'
	queuesize = None
	gen_pub(wp_list, freq, speed, max_error, pub_str, node_str, queuesize)
