'''
This publishes a arm/disarm to the subscribed vehicles

'''
from std_msgs.msg import String
import rospy

def AD_pubber():
	# Create Node
	rospy.init_node('AD_cmd_node')
	# Create the publisher
	pub = rospy.Publisher('AD_cmd', String, queue_size=3)
	r = rospy.Rate(.5)
	try:
		while True:
			try:
				AD_input = str(raw_input('Type ARM to arm, press anything to disarm: '))
			except SyntaxError:
				AD_input = ''
			if AD_input=='ARM':
				msg_str = 'arm'
			else:
				msg_str = 'disarm'
			print(msg_str)
			msg = String(msg_str)
			pub.publish(msg)

			#rospy.spin()
			r.sleep()
	except KeyboardInterrupt:
		print('Keyboard Interrupt')	
if __name__ == '__main__':
	AD_pubber()
	
	
