#!/usr/bin/env python
import rospy
import geometry_msgs.msg

from visualization_msgs.msg import Marker
from geometry_msgs.msg import PointStamped
from geometry_msgs.msg import PolygonStamped


#Shows Center of mass and support polygon in rviz


namespace="stabilty"


indexes=("com","com_projected","support_polygon")


markers=[]
#initialize markers
for i in range (0,len(indexes)):    
    markers.append(Marker())
    markers[i].id=i
    markers[i].ns=namespace
    markers[i].action = Marker.ADD




def _COM_callback(data):
    i=indexes.index("com")
    markers[i].header.frame_id = data.header.frame_id
    markers[i].header.stamp = rospy.Time()    
    markers[i].type = Marker.SPHERE    
    markers[i].pose.orientation.w = 1.0
    markers[i].color.a = 1.0
    markers[i].color.r = 0.5
    markers[i].color.g = 0.5
    markers[i].color.b = 0.5
    markers[i].scale.x = 0.2
    markers[i].scale.y = 0.2
    markers[i].scale.z = 0.2

    markers[i].pose.position.x = data.point.x
    markers[i].pose.position.y = data.point.y
    markers[i].pose.position.z = data.point.z
    pub_markers.publish(markers[i])

        

def _COM_projected_callback(data): 
    i=indexes.index("com_projected")   
    markers[i].header.frame_id = data.header.frame_id
    markers[i].header.stamp = rospy.Time()
    markers[i].type = Marker.SPHERE    
    markers[i].pose.orientation.w = 1.0
    markers[i].color.a = 1.0
    markers[i].color.r = 1.0
    markers[i].color.g = 1.0
    markers[i].color.b = 1.0
    markers[i].scale.x = 0.2
    markers[i].scale.y = 0.2
    markers[i].scale.z = 0.2

    markers[i].pose.position.x = data.point.x
    markers[i].pose.position.y = data.point.y
    markers[i].pose.position.z = 0 # always display marker at zero height with respect to world
    pub_markers.publish(markers[i])

def _support_polygon_callback(data):
    i=indexes.index("support_polygon")      
    markers[i].header.frame_id = data.header.frame_id
    markers[i].header.stamp = rospy.Time()
    markers[i].type = Marker.TRIANGLE_LIST
    markers[i].pose.orientation.w = 1.0
    markers[i].color.a = 0.5
    markers[i].color.r = 0.0
    markers[i].color.g = 1.0
    markers[i].color.b = 0.0
    markers[i].scale.x = 1.0
    markers[i].scale.y = 1.0
    markers[i].scale.z = 1.0

    if (len(data.polygon.points)>=3):
        #3 points make a triangle    
        markers[i].points.append(data.polygon.points[0])
        markers[i].points.append(data.polygon.points[1])
        markers[i].points.append(data.polygon.points[2])
        pub_markers.publish(markers[i])
        markers[i].points=[]


rospy.init_node('markers_stability', anonymous=True)
pub_markers = rospy.Publisher('/markers/stability', Marker, queue_size=1)

rospy.Subscriber("/robostilt/safety/center_of_mass", PointStamped, _COM_callback)
rospy.Subscriber("/robostilt/safety/center_of_mass_projected", PointStamped, _COM_projected_callback)
rospy.Subscriber("/robostilt/safety/support_polygon", PolygonStamped, _support_polygon_callback)

rospy.spin()

