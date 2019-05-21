#!/usr/bin/env python
import rospy
import math
from sensor_msgs.msg import LaserScan
import matplotlib.path as mtplPath
from std_msgs.msg import Bool as bool_msg
#Determines if there is an obstacle infront of the laser scanner that is whithin the obstacle area.
# Obstacle area is defined in parameters YAML
#This induces the robot to move up before stepping forward


rospy.init_node('safety_obstacle', anonymous=True)

pub = rospy.Publisher('/robostilt/safety/obstacle_in_front', bool_msg, queue_size=1,latch=True) 
x_lenght=rospy.get_param("robostilt/dimensions/obstacle_area_lenght_x")
y_lenght=rospy.get_param("robostilt/dimensions/obstacle_area_width_y")

path_data = [
(mtplPath.Path.MOVETO, (0, 0)),
(mtplPath.Path.LINETO, (0, y_lenght/-2)),
(mtplPath.Path.LINETO, (x_lenght, y_lenght/-2)),
(mtplPath.Path.LINETO, (x_lenght, y_lenght/2)),
(mtplPath.Path.LINETO, (0, y_lenght/2)),
(mtplPath.Path.CLOSEPOLY, (0, 0))
]

codes, verts = zip(*path_data)
path = mtplPath.Path(verts, codes)

def _laser_callback(scan):
    #converts laser points into x and y and determines if the points are inside the critial area for a step forward
    numberOfPoints=len(scan.ranges)
    startAngle=scan.angle_min
    angleIncrement=scan.angle_increment    
    xyPoints=[]  

    currentAngle=startAngle
    
    for i in range(0, numberOfPoints):
        x=math.cos(currentAngle)*scan.ranges[i]
        y=math.sin(currentAngle)*scan.ranges[i]
        xyPoints.append((x,y))
        currentAngle+=angleIncrement 

    objectDetected=any(path.contains_points(tuple(xyPoints)))
    pub.publish(objectDetected)
    #rospy.loginfo(objectDetected)


rospy.Subscriber("robostilt/laser_scan", LaserScan, _laser_callback)
rospy.spin()