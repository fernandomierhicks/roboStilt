#!/usr/bin/env python
import rospy
import geometry_msgs.msg

from visualization_msgs.msg import Marker
from geometry_msgs.msg import PointStamped
from geometry_msgs.msg import Point
from geometry_msgs.msg import PolygonStamped
from std_msgs.msg import ColorRGBA


# Shows Center of mass and support polygon in rviz

rospy.init_node('markers_stability', anonymous=False)
pub_markers = rospy.Publisher(
    '/markers/stability', Marker, queue_size=1, latch=True)


rospy.loginfo("Markers Stability started.")
rospy.loginfo("Waiting for COM radius parameter...")
param_name = "/robostilt/safety/center_of_mass_radius"
while(rospy.has_param(param_name) is False):
    rospy.sleep(1.0)
COM_radius = rospy.get_param(param_name)

rospy.loginfo("Markers Stability publishing...")
namespace = "stabilty"
# holds the different markers
indexes = ("com", "com_projected", "support_polygon")


markers = []
# initialize markers
for i in range(0, len(indexes)):
    markers.append(Marker())
    markers[i].id = i
    markers[i].ns = namespace
    markers[i].action = Marker.ADD


def _COM_callback(data):
    i = indexes.index("com")
    markers[i].header.frame_id = data.header.frame_id
    markers[i].pose.orientation.w = 1.0
    markers[i].type = Marker.SPHERE

    markers[i].color.a = 1.0
    markers[i].color.r = 0.5
    markers[i].color.g = 0.5
    markers[i].color.b = 0.5
    markers[i].scale.x = COM_radius*2.0
    markers[i].scale.y = COM_radius*2.0
    markers[i].scale.z = COM_radius*2.0

    markers[i].pose.position.x = data.point.x
    markers[i].pose.position.y = data.point.y
    markers[i].pose.position.z = data.point.z
    pub_markers.publish(markers[i])


def _COM_projected_callback(data):
    i = indexes.index("com_projected")
    markers[i].header.frame_id = data.header.frame_id
    markers[i].pose.orientation.w = 1.0
    markers[i].type = Marker.SPHERE
    markers[i].color.a = 1.0
    markers[i].color.r = 1.0
    markers[i].color.g = 1.0
    markers[i].color.b = 1.0
    markers[i].scale.x = COM_radius*2.0
    markers[i].scale.y = COM_radius*2.0
    markers[i].scale.z = 0.1

    markers[i].pose.position.x = data.point.x
    markers[i].pose.position.y = data.point.y
    # always display marker at zero height with respect to world
    markers[i].pose.position.z = 0
    pub_markers.publish(markers[i])


def _support_polygon_callback(data):
    i = indexes.index("support_polygon")
    markers[i].header.frame_id = data.header.frame_id
    markers[i].header.stamp = rospy.Time()
    markers[i].type = Marker.TRIANGLE_LIST
    markers[i].pose.orientation.w = 1.0
    markers[i].colors = []  # empty colors per vertex
    markers[i].color.a = 1.0
    markers[i].color.r = 1.0
    markers[i].color.g = 1.0
    markers[i].color.b = 1.0
    markers[i].scale.x = 1.0
    markers[i].scale.y = 1.0
    markers[i].scale.z = 1.0

    # assigning one color per vertex avoids shader issues
    color = ColorRGBA(0.0, 1.0, 0.0, 0.5)

    if (3 <= len(data.polygon.points) <= 6):

        # rospy.loginfo("Entering with #legs: " +str(len(data.polygon.points)))
        # initial triangle
        markers[i].points.append(data.polygon.points[0])
        markers[i].colors.append(color)

        markers[i].points.append(data.polygon.points[1])
        markers[i].colors.append(color)

        markers[i].points.append(data.polygon.points[2])
        markers[i].colors.append(color)

        for j in range(2, (len(data.polygon.points)-1)):

            #rospy.loginfo("j= " +str(j))
            # Always have the zero vertex as a triangle corner
            markers[i].points.append(data.polygon.points[0])
            markers[i].colors.append(color)

            markers[i].points.append(data.polygon.points[j])
            markers[i].colors.append(color)

            markers[i].points.append(data.polygon.points[j+1])
            markers[i].colors.append(color)

        pub_markers.publish(markers[i])
        markers[i].points = []


rospy.Subscriber("/robostilt/safety/center_of_mass",
                 PointStamped, _COM_callback)
rospy.Subscriber("/robostilt/safety/center_of_mass_projected",
                 PointStamped, _COM_projected_callback)
rospy.Subscriber("/robostilt/safety/support_polygon",
                 PolygonStamped, _support_polygon_callback)

rospy.spin()
