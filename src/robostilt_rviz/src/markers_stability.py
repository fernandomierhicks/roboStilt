#!/usr/bin/env python
import rospy
import geometry_msgs.msg

from visualization_msgs.msg import Marker
from geometry_msgs.msg import PointStamped
from geometry_msgs.msg import PolygonStamped


#Shows Center of mass and support polygon in rviz

def _COM_callback(data):
    marker = Marker()
    marker.header.frame_id = data.header.frame_id
    marker.header.stamp = rospy.Time()
    marker.type = marker.SPHERE
    marker.action = marker.ADD
    marker.pose.orientation.w = 1.0
    marker.color.a = 1.0
    marker.color.r = 0.5
    marker.color.g = 0.5
    marker.color.b = 0.5
    marker.scale.x = 0.2
    marker.scale.y = 0.2
    marker.scale.z = 0.2

    marker.pose.position.x = data.point.x
    marker.pose.position.y = data.point.y
    marker.pose.position.z = data.point.z
    pub_com.publish(marker)

        

def _COM_projected_callback(data):
    marker = Marker()
    marker.header.frame_id = data.header.frame_id
    marker.header.stamp = rospy.Time()
    marker.type = marker.SPHERE
    marker.action = marker.ADD
    marker.pose.orientation.w = 1.0
    marker.color.a = 1.0
    marker.color.r = 1.0
    marker.color.g = 1.0
    marker.color.b = 1.0
    marker.scale.x = 0.2
    marker.scale.y = 0.2
    marker.scale.z = 0.2

    marker.pose.position.x = data.point.x
    marker.pose.position.y = data.point.y
    marker.pose.position.z = 0 # always display marker at zero height with respect to world
    pub_projected.publish(marker)

def _support_polygon_callback(data):
    
    marker = Marker()
    marker.header.frame_id = data.header.frame_id
    marker.header.stamp = rospy.Time()
    marker.type = marker.TRIANGLE_LIST
    marker.action = Marker.ADD

    marker.pose.orientation.w = 1.0
    marker.color.a = 0.5
    marker.color.r = 0.0
    marker.color.g = 1.0
    marker.color.b = 0.0
    marker.scale.x = 1.0
    marker.scale.y = 1.0
    marker.scale.z = 1.0

    #3 points make a triangle

    # data.polygon.points[0].x=0
    data.polygon.points[0].z=0.01

    # data.polygon.points[1].x=1
    data.polygon.points[1].z=0.01

    # data.polygon.points[2].x=0
    data.polygon.points[2].z=0.01
    
    marker.points.append(data.polygon.points[0])
    marker.points.append(data.polygon.points[1])
    marker.points.append(data.polygon.points[2])

    pub_support_polygon.publish(marker)




rospy.init_node('markers_stability', anonymous=True)
pub_com = rospy.Publisher('/markers/com', Marker, queue_size=1)
pub_projected = rospy.Publisher('/markers/com_projected', Marker, queue_size=1)
pub_support_polygon = rospy.Publisher('/markers/support_polygon', Marker, queue_size=1)

rospy.Subscriber("/robostilt/safety/center_of_mass", PointStamped, _COM_callback)
rospy.Subscriber("/robostilt/safety/center_of_mass_projected", PointStamped, _COM_projected_callback)
rospy.Subscriber("/robostilt/safety/support_polygon", PolygonStamped, _support_polygon_callback)

rospy.spin()

