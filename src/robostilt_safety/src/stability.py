#!/usr/bin/env python
import rospy
import geometry_msgs.msg
import tf2_ros
import tf2_geometry_msgs as tf_msg
from urdf_parser_py.urdf import URDF
from geometry_msgs.msg import PointStamped
from geometry_msgs.msg import Point
from geometry_msgs.msg import PolygonStamped
from robostilt_common.msg import RoboStiltStateMessage
import matplotlib.path as mpltPath
from sensor_msgs.msg import JointState


# Calculates robots center of mass and supporting polygon and publishes to topic

class Stability:
    # -------------------------------------------------------------------------------------------------------  GLOBALS
    center_of_mass = None
    center_of_mass_projected = None
    support_polygon = None
    joint_names = None
    supporting_legs = None
    tf_buffer = None
    tf_listener = None
    link_origin = None
    pub_com = None
    pub_projected = None
    pub_com = None
    mass = None
    links = None
    ros_rate = None


# ---------------------------------------------------------------------------------------------------------  CALLBACKS


    def _actuators_state_callback(self, msg):
        self.joint_names = msg.name
        self.supporting_legs = msg.is_supporting

# ---------------------------------------------------------------------------------------------------------  ROS
    def setup_ros_interface(self):
        # Variables
        rate = 50
        package_name = "safety"
        node_name = "stability"
        # Node
        rospy.init_node(node_name, anonymous=False)
        self.ros_rate = rospy.Rate(rate)
        rospy.loginfo("Node robostilt/"+package_name +
                      " " + node_name + " started.")
        # Publishers
        self.pub_com = rospy.Publisher(
            '/robostilt/safety/center_of_mass', PointStamped, queue_size=1, latch=True)
        self.pub_projected = rospy.Publisher(
            '/robostilt/safety/center_of_mass_projected', PointStamped, queue_size=1, latch=True)
        self.pub_suport_polygon = rospy.Publisher(
            '/robostilt/safety/support_polygon', PolygonStamped, queue_size=1, latch=True)
        # Subscribers
        rospy.Subscriber("robostilt/actuators_state", RoboStiltStateMessage,
                         self._actuators_state_callback)
        # Services

        # wait for...
        topic_name = "/robostilt/frames_state"

        rospy.loginfo("Waiting for message on topic "+topic_name + " ...")
        rospy.wait_for_message(topic_name, RoboStiltStateMessage)

# ---------------------------------------------------------------------------------------------------------  INIT

    def __init__(self):
        self.setup_ros_interface()
        self.start_calculations()

    def calculate_total_mass(self):

        self.mass = 0
        # get robot description from URDF
        robot = URDF.from_parameter_server()
        self.links = robot.link_map

        # Delete links, which contain no mass description
        unnecessary_links = []
        for link in self.links:
            if self.links[link].inertial == None:
                unnecessary_links.append(link)

        for link in unnecessary_links:
            del self.links[link]

        # Calculate the total mass of the robot
        for link in self.links:
            self.mass += self.links[link].inertial.mass

        rospy.loginfo("Mass of robot is %f", self.mass)

    def start_calculations(self):
         # initialize calculation variables
        self.center_of_mass = PointStamped()
        self.center_of_mass_projected = PointStamped()
        self.tfBuffer = tf2_ros.Buffer()
        self.tf_listener = tf2_ros.TransformListener(self.tfBuffer)
        self.link_origin = geometry_msgs.msg.PointStamped()

        self.calculate_total_mass()

        while not rospy.is_shutdown():

            self.calculate_center_of_mass()
            self.calculate_support_polygon()

            self.check_com_is_inside_support_polygon()

            try:
                # catch exeption of moving backwarts in time, when restarting simulator
                self.ros_rate.sleep()
            except rospy.exceptions.ROSTimeMovedBackwardsException:
                rospy.logwarn(
                    "We moved backwards in time. I hope you just resetted the simulation. If not there is something wrong")

    def calculate_support_polygon(self):
        point = []
        support_area = PolygonStamped()
        j = 0
        for i in range(0, 8):

            if(self.supporting_legs[4] == True and self.supporting_legs[6] == True):
                # to publish polygon with correct order on vertices, need to swap legs 4 and 6 in case both are present
                if(i == 4):
                    i = 6
                elif(i == 6):
                    i = 4

            if(self.supporting_legs[i] == True):
                # processing a leg that is currently supporting robot
                try:
                    # get transform of each link with respect to base link
                    self.tf_world_to_link = self.tf_buffer.lookup_transform(
                        "world", self.joint_names[i], rospy.Time())
                    point.append(Point())
                    point[j].x = self.tf_world_to_link.transform.translation.x
                    point[j].y = self.tf_world_to_link.transform.translation.y
                    point[j].z = 0
                    support_area.polygon.points.append(point[j])
                    j += 1
                except:
                    rospy.logerr("TF error in COM computation")
        support_area.header.stamp = rospy.Time.now()
        support_area.header.frame_id = "world"
        self.pub_suport_polygon.publish(support_area)
        self.support_polygon = support_area.polygon

    def calculate_center_of_mass(self):
        x = 0
        y = 0
        z = 0
        for link in self.links:

            try:
                # print (self.links[link])   #get structure of link

                # get transform of each link with respect to base link
                self.tf_base_to_link = self.tf_buffer.lookup_transform(
                    "base_link", link, rospy.Time())

                self.link_origin.point.x = self.links[link].inertial.origin.xyz[0]
                self.link_origin.point.y = self.links[link].inertial.origin.xyz[1]
                self.link_origin.point.z = self.links[link].inertial.origin.xyz[2]
                self.link_origin.header.frame_id = link
                self.link_origin.header.stamp = rospy.get_rostime()

                tf_base_to_link_origin = tf_msg.do_transform_point(
                    self.link_origin, self.tf_base_to_link)

                # calculate part of CoM equation depending on link
                x += self.links[link].inertial.mass * \
                    tf_base_to_link_origin.point.x
                y += self.links[link].inertial.mass * \
                    tf_base_to_link_origin.point.y
                z += self.links[link].inertial.mass * \
                    tf_base_to_link_origin.point.z
            except:
                rospy.logerr("TF error in COM computation")

        # finish CoM calculation
        self.center_of_mass.header.stamp = rospy.Time.now()
        self.center_of_mass.header.frame_id = "base_link"
        self.center_of_mass.point.x = x/self.mass
        self.center_of_mass.point.y = y/self.mass
        self.center_of_mass.point.z = z/self.mass

        self.pub_com.publish(self.center_of_mass)

        # project COM into ground, z=0
        self.tf_base_to_world = self.tfBuffer.lookup_transform(
            "world", "base_link", rospy.Time())
        self.tf_com_location_to_world = tf_msg.do_transform_point(
            self.center_of_mass, self.tf_base_to_world)

        self.center_of_mass_projected.header.frame_id = "world"
        self.center_of_mass_projected.header.stamp = rospy.Time.now()
        self.center_of_mass_projected.point.x = self.tf_com_location_to_world.point.x
        self.center_of_mass_projected.point.y = self.tf_com_location_to_world.point.y
        self.center_of_mass_projected.point.z = 0  # zero height

        self.pub_projected.publish(self.center_of_mass_projected)

    def check_com_is_inside_support_polygon(self):
        # Generate a matplotlib path and use its path.contains function
        if(self.support_polygon != None and len(self.support_polygon.points) >= 3):
            vertices = []
            codes = []
            x = 0
            y = 0
            number_of_points = len(self.support_polygon.points)

            # first point

            x = self.support_polygon.points[0].x
            y = self.support_polygon.points[0].y
            codes.append(mpltPath.Path.MOVETO)
            vertices.append((x, y))

            for i in range(1, (number_of_points)):
                x = self.support_polygon.points[i].x
                y = self.support_polygon.points[i].y
                codes.append(mpltPath.Path.LINETO)
                vertices.append((x, y))

            # last point is same as first but with CLOSEPOLY code
            x = self.support_polygon.points[0].x
            y = self.support_polygon.points[0].y
            codes.append(mpltPath.Path.CLOSEPOLY)
            vertices.append((x, y))

            path = mpltPath.Path(vertices, codes)

            x = self.center_of_mass_projected.point.x
            y = self.center_of_mass_projected.point.y

            if(path.contains_point((x, y)) == False):
                rospy.logerr("ROBOT IS UNSTABLE, FALLING!!")
                # do something else!!
        else:
            rospy.loginfo(
                "Waiting for valid support polygon, this shouldnt happen as we should be waiting. FIX ME")


# ---------------------------------------------------------------------------------------------------------  MAIN
if __name__ == '__main__':
    try:
        stability = Stability()
    except rospy.ROSInterruptException:
        pass
