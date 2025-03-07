#!/usr/bin/env python3

# Create a ros subscribing/publishing loop for the spline controller
import sys, os, time
import numpy as np 
import pandas as pd 
from autocone.spline_controller import spline_controller
import autocone.geometry as geometry
import autocone.utm as utm

# Import ros messages
from std_msgs.msg import *
from geometry_msgs.msg import * 
from ubxtranslator.msg import relpos2D, llh


# Create a class which subscribes to the rover pos, gps coordinates, and the source gps coordinates and publishes velocity and heading commands for the rover
class ros_spline_mgr:
    """
    """
    def __init__(
        self,
        spline_controller,
        node_name,
        source_gps_topic,
        source_gps_type,
        rover_gps_topic,
        rover_gps_type,
        rover_pos_topic,
        rover_pos_type,
        command_vel_topic,
        command_hdg_topic,
        command_type
        ):

        # initialize ros node:
        rospy.init_node(node_name)

        # Save internal components:
        self.sc = spline_controller
        
        # Create messages:
        self.cmd_vel_msg = command_type()
        self.cmd_hdg_msg = command_type()

        # Create publishers:
        self.cmd_vel_pub = rospy.Publisher(command_vel_topic, command_type, queue_size=None)
        self.cmd_hdg_pub = rospy.Publisher(command_hdg_topic, command_type, queue_size=None)

        # Save parameters for the subscriber loop
        self.src_gps_topic = source_gps_topic
        self.src_gps_type = source_gps_type
        self.rov_gps_topic = rover_gps_topic
        self.rov_gps_type = rover_gps_type
        self.rov_pos_topic = rover_pos_topic
        self.rov_pos_type = rover_pos_type

        # Other variables for logic flow:
        self.rov_theta_current = False
        self.rov_theta = None

    def callback_src_gps( self, data ):
        # Add the source gps point to the data stack of the rover controller

        # perform the loginfo rospy
        rospy.loginfo('Received the source gps point: \n{}'.format(data))
        # Define src_x, src_y, time:
        src_lat = data.llh.lat 
        src_lon = data.llh.lon 
        t = time.time() 

        # Add the gps point into the spline controller
        self.sc.src_add(src_lat, src_lon, t)
    
    def callback_rov_pos( self, data ):

        # Perform the rospy loginfo:
        rospy.loginfo('Received the rover position: {}'.format(data))

        # Set the theta and the current vars
        self.rov_theta = geometry.deg2rad(data.pos.theta)
        self.rov_theta_current = True 
    
    def callback_rov_gps( self, data) :
        # Produce the rover feedback commands:

        # Perform rospy loginfo
        rospy.loginfo('Received the rover gps: {}'.format(data))
        
        # Define parameters from the incoming message
        rov_lat = data.llh.lat
        rov_lon = data.llh.lon 
        rov_theta = self.rov_theta
        t = time.time()

        self.rov_theta_current = False 

        # Produce feedback control:
        (hdg_targ, vel_targ, lateness, halt) = self.sc.controller_step( t, rov_lat, rov_lon, rov_theta )

        # Create messages:
        self.cmd_hdg_msg.data = hdg_targ
        self.cmd_vel_msg.data = vel_targ 

        # Create rospy loginfo
        rospy.loginfo('Publishing target heading and velocity: {} and {}'.format(self.cmd_hdg_msg, self.cmd_vel_msg))
        
        # Publish commands
        self.cmd_vel_pub.publish(self.cmd_vel_msg)
        self.cmd_hdg_pub.publish(self.cmd_hdg_msg)

    def listener( self ) :

        # Create the subscribers:
        rospy.Subscriber(self.src_gps_topic, self.src_gps_type, self.callback_src_gps)
        rospy.Subscriber(self.rov_pos_topic, self.rov_pos_type, self.callback_rov_pos)
        rospy.Subscriber(self.rov_gps_topic, self.rov_gps_type, self.callback_rov_gps)

        # Create a rospy spin to keep the loop from closing:
        rospy.spin()



# Run the above if main:
if __name__ == '__main__' :

    # initialize the spline controller:
    sc = spline_controller(
        geometry.target_heading_function,
        'llh',
        'llh',
        4.0,
        1.0,
        1.0,
        1.0,
        5.0,
        5,
        10000
    )

    # create ros mgr
    ros_mgr = ros_spline_mgr(
        sc,
        'ros_rover_mgr_node',
        '/src_UBX/hpposllh',
        llh,
        '/UBX/hpposllh',
        llh,
        '/UBX/relpos2D',
        relpos2D,
        '/rov_cmd/vel',
        '/rov_cmd/hdg',
        Float64
    )

    ros_mgr.listener()
