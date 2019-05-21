#!/usr/bin/env python
import rospy
import geometry_msgs.msg

from visualization_msgs.msg import Marker
from sensor_msgs.msg import JointState
from std_msgs.msg import ColorRGBA


#Shows Center of mass and support polygon in rviz


x_lenght=rospy.get_param("robostilt/dimensions/obstacle_area_lenght_x")
y_lenght=rospy.get_param("robostilt/dimensions/obstacle_area_width_y")

namespace="obstacles"
indexes=("obstacles_area")


markers=[]
#initialize markers
for i in range (0,len(indexes)):    
    markers.append(Marker())
    markers[i].id=i
    markers[i].ns=namespace
    markers[i].action = Marker.ADD


rospy.init_node('markers_obstacles', anonymous=False)
pub_markers = rospy.Publisher('/markers/obstacles', Marker, queue_size=1,latch=True)


def _JointStates_callback(data):
    x_origin=data.position[1]     #Leg2 is always the object "most infront"

    i=indexes.index("obstacles_area")      
    markers[i].header.frame_id = "base_link"
    markers[i].header.stamp = rospy.Time()
    markers[i].type = Marker.CUBE
    markers[i].pose.orientation.w = 1.0
    markers[i].color.a=0.2
    markers[i].color.r=0.0
    markers[i].color.g=0.0
    markers[i].color.b=1.0
    markers[i].scale.x = x_lenght
    markers[i].scale.y = y_lenght
    markers[i].scale.z = 2.0  

    markers[i].pose.position.x = 1.1
    markers[i].pose.position.y = 0
    markers[i].pose.position.z = 0


    pub_markers.publish(markers[i])
    markers[i].points=[]
    




rospy.Subscriber("/robostilt/joint_states", JointState, _JointStates_callback)

rospy.spin()


