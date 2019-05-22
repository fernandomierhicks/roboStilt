#!/usr/bin/env python
import rospy
import math
from sensor_msgs.msg import LaserScan
import matplotlib.path as MtplPath
from std_msgs.msg import Bool as MsgBool

# Determines if there is an obstacle infront of the laser scanner that is whithin the obstacle area.
# Obstacle area is defined in parameters YAML
# This induces the robot to move up before stepping forward


class Obstacle():

    # -------------------------------------------------------------------------------------------------------  GLOBALS
    x_length = None
    y_length = None
    path = None
    publisher = None
    # -------------------------------------------------------------------------------------------------------  CALLBACKS

    def _laser_callback(self, msg):
        # converts laser points into x and y and determines if the points are inside the critial area for a step forward
        number_of_points = len(msg.ranges)
        start_angle = msg.angle_min
        angle_increment = msg.angle_increment
        xy_points = []

        current_angle = start_angle

        for i in range(0, number_of_points):
            x = math.cos(current_angle)*msg.ranges[i]
            y = math.sin(current_angle)*msg.ranges[i]
            xy_points.append((x, y))
            current_angle += angle_increment

        object_detected = any(self.path.contains_points(tuple(xy_points)))
        self.publisher.publish(object_detected)
        # rospy.loginfo(objectDetected)
    # ---------------------------------------------------------------------------------------------------------  ROS

    def setup_ros_interface(self):
        # Variables
        rate = 50
        package_name = "safety"
        node_name = "obstacles"
        # Node
        rospy.init_node(node_name, anonymous=False)
        self.ros_rate = rospy.Rate(rate)
        rospy.loginfo("Node robostilt/"+package_name +
                      "/" + node_name + " started.")
        # Publishers
        self.publisher = rospy.Publisher(
            '/robostilt/safety/obstacle_in_front', MsgBool, queue_size=1, latch=True)
    # Subscribers
        rospy.Subscriber("robostilt/laser_scan",
                         LaserScan, self._laser_callback)
        # Services

        # wait for...
        topic_name = "/robostilt/laser_scan"
        rospy.loginfo("Waiting for message on topic " + topic_name + " ...")
        rospy.wait_for_message(topic_name, LaserScan)

        # get parameters
        self.x_length = rospy.get_param(
            "robostilt/dimensions/obstacle_area_lenght_x")
        self.y_length = rospy.get_param(
            "robostilt/dimensions/obstacle_area_width_y")
    # ---------------------------------------------------------------------------------------------------------  METHODS

    def createPath(self):
        path_data = [
            (MtplPath.Path.MOVETO, (0, 0)),
            (MtplPath.Path.LINETO, (0, self.y_lenght/-2)),
            (MtplPath.Path.LINETO, (self.x_lenght, self.y_lenght/-2)),
            (MtplPath.Path.LINETO, (self.x_lenght, self.y_lenght/2)),
            (MtplPath.Path.LINETO, (0, self.y_lenght/2)),
            (MtplPath.Path.CLOSEPOLY, (0, 0))
        ]
        codes, verts = zip(*path_data)
        self.path = MtplPath.Path(verts, codes)
    # ---------------------------------------------------------------------------------------------------------  INIT

    def __init__(self):
        self.setup_ros_interface()
        self.createPath()


if __name__ == '__main__':
    try:
        obstacle = Obstacle()
        while not rospy.is_shutdown():
            rospy.spin()
    except rospy.ROSInterruptException:
        pass
