#!/usr/bin/env python
import rospy
import geometry_msgs.msg

from visualization_msgs.msg import Marker
from geometry_msgs.msg import PointStamped


#Shows Center of mass and support polygon in rviz

def _COM_callback(data):
    com_marker = Marker()
    com_marker.header.frame_id = "base_link"
    com_marker.header.stamp = rospy.Time()
    com_marker.type = com_marker.SPHERE
    com_marker.action = com_marker.ADD
    com_marker.pose.orientation.w = 1.0
    com_marker.color.a = 1.0
    com_marker.color.r = 0.5
    com_marker.color.g = 0.5
    com_marker.color.b = 0.5
    com_marker.scale.x = 0.2
    com_marker.scale.y = 0.2
    com_marker.scale.z = 0.2

    com_marker.pose.position.x = data.point.x
    com_marker.pose.position.y = data.point.y
    com_marker.pose.position.z = data.point.z
    pub_com.publish(com_marker)

        

def _COM_projected_callback(data):
    com_projected_marker = Marker()
    com_projected_marker.header.frame_id = "world"
    com_projected_marker.header.stamp = rospy.Time()
    com_projected_marker.type = com_projected_marker.SPHERE
    com_projected_marker.action = com_projected_marker.ADD
    com_projected_marker.pose.orientation.w = 1.0
    com_projected_marker.color.a = 1.0
    com_projected_marker.color.r = 1.0
    com_projected_marker.color.g = 1.0
    com_projected_marker.color.b = 1.0
    com_projected_marker.scale.x = 0.2
    com_projected_marker.scale.y = 0.2
    com_projected_marker.scale.z = 0.2

    com_projected_marker.pose.position.x = data.point.x
    com_projected_marker.pose.position.y = data.point.y
    com_projected_marker.pose.position.z = 0 # always display marker at zero height with respect to world
    pub_projected.publish(com_projected_marker)





rospy.init_node('markers_stability', anonymous=True)
pub_com = rospy.Publisher('/markers/com', Marker, queue_size=1)
pub_projected = rospy.Publisher('/markers/com_projected', Marker, queue_size=1)

rospy.Subscriber("/robostilt/safety/center_of_mass", PointStamped, _COM_callback)
rospy.Subscriber("/robostilt/safety/center_of_mass_projected", PointStamped, _COM_projected_callback)

rospy.spin()

