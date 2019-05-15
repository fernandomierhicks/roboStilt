#!/usr/bin/env python
import rospy
import geometry_msgs.msg
import tf2_ros
import tf2_geometry_msgs as tf_msg
from urdf_parser_py.urdf import URDF
from visualization_msgs.msg import Marker

class CoMCalculator: 
    
    def __init__(self):
        rospy.init_node('com_calculation', anonymous=True)
        self.Mass = 0
        #get robot description from URDF
        robot = URDF.from_parameter_server()
        self.links = robot.link_map
        
        #Delete links, which contain no mass description
        unnecessary_links = []
        for link in self.links:
            if self.links[link].inertial == None:
                unnecessary_links.append(link)

        for link in unnecessary_links:
            del self.links[link]
        
        #Calculate the total mass of the robot
        for link in self.links:
            self.Mass += self.links[link].inertial.mass

        rospy.loginfo("Mass of robot is %f", self.Mass)
        self.calculator()
    
    def calculator(self):
        #initialisations for tf and marker
        tfBuffer = tf2_ros.Buffer()
        listener = tf2_ros.TransformListener(tfBuffer)
        link_origin = geometry_msgs.msg.PointStamped()
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

        pub_com = rospy.Publisher('/com', Marker, queue_size=1)
        pub_projected = rospy.Publisher('/com_ground', Marker, queue_size=1)
        
        rate = rospy.Rate(30)
        rospy.sleep(1)
        
        #loop for calculating the CoM while robot is not shutdown
        while not rospy.is_shutdown():
            x = 0
            y = 0
            z = 0


            for link in self.links:                

                try:
                    #print (self.links[link])   #get structure of link

                    #get transform of each link with respect to base link
                    tf_base_to_link = tfBuffer.lookup_transform("base_link", link, rospy.Time())
                    
                    link_origin.point.x = self.links[link].inertial.origin.xyz[0] 
                    link_origin.point.y = self.links[link].inertial.origin.xyz[1] 
                    link_origin.point.z = self.links[link].inertial.origin.xyz[2] 
                    link_origin.header.frame_id = link
                    link_origin.header.stamp = rospy.get_rostime()

                    tf_base_to_link_origin = tf_msg.do_transform_point(link_origin, tf_base_to_link)
                   

                    #calculate part of CoM equation depending on link
                    x += self.links[link].inertial.mass * tf_base_to_link_origin.point.x
                    y += self.links[link].inertial.mass * tf_base_to_link_origin.point.y
                    z += self.links[link].inertial.mass * tf_base_to_link_origin.point.z
                except tf2_ros.TransformException as err:
                    rospy.logerr("TF error in COM computation %s", err)

                
            #finish CoM calculation
            com_location= geometry_msgs.msg.PointStamped()
            com_location.point.x= x/self.Mass
            com_location.point.y= y/self.Mass
            com_location.point.z= z/self.Mass

            #send CoM position to RViZ. This positions are in reference to the base_link
            com_marker.pose.position.x = com_location.point.x
            com_marker.pose.position.y = com_location.point.y
            com_marker.pose.position.z = com_location.point.z
            pub_com.publish(com_marker)



            #project COM into ground, z=0
            tf_base_to_world = tfBuffer.lookup_transform("world", "base_link", rospy.Time())
            tf_com_location_to_world = tf_msg.do_transform_point(com_location, tf_base_to_world)

            #send CoM position to RViZ. This positions are in reference to the base_link
            com_projected_marker.pose.position.x = tf_com_location_to_world.point.x
            com_projected_marker.pose.position.y = tf_com_location_to_world.point.y
            com_projected_marker.pose.position.z = 0 # always display marker at zero height with respect to world
            pub_projected.publish(com_projected_marker)

            #rospy.loginfo("COM of robot with respect to world is: "+ str(tf_com_location_to_world.point.x) + " , " + str(tf_com_location_to_world.point.y) +" , " + str(tf_com_location_to_world.point.z))


            try:
                # catch exeption of moving backwarts in time, when restarting simulator
                rate.sleep()
            except rospy.exceptions.ROSTimeMovedBackwardsException:
                rospy.logwarn("We moved backwards in time. I hope you just resetted the simulation. If not there is something wrong")
            
            
if __name__ == '__main__':
    calc = CoMCalculator()