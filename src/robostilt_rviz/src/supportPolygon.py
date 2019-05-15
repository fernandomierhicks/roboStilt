#!/usr/bin/env python
import rospy
import geometry_msgs.msg
import tf2_ros
import tf2_geometry_msgs as tf_msg
from urdf_parser_py.urdf import URDF
from visualization_msgs.msg import Marker

class supportPolygon: 
    
    def __init__(self):
        rospy.init_node('support_polygon', anonymous=True)
        self.calculate_support_polygon()
    
    def calculate_support_polygon(self):
        #initialisations for tf and marker
        tfBuffer = tf2_ros.Buffer()
        listener = tf2_ros.TransformListener(tfBuffer)

        marker = Marker()
        marker.header.frame_id = "world"
        marker.header.stamp = rospy.Time()
        marker.type = marker.LINE_STRIP
        marker.action = marker.ADD        
        marker.color.a = 1.0
        marker.color.r = 1.0
        marker.color.g = 1.0
        marker.color.b = 1.0
        marker.scale.x = 0.02 #line width
        marker.pose.orientation.x = 0.0
        marker.pose.orientation.y = 0.0
        marker.pose.orientation.z = 0.0
        marker.pose.orientation.w = 1.0
        
        pub = rospy.Publisher('/support_polygon', Marker, queue_size=1)

     
        rate = rospy.Rate(30)
        rospy.sleep(1)
        
        #loop for calculating the CoM while robot is not shutdown
        while not rospy.is_shutdown():
            x = 0
            y = 0
            z = 0


            # for link in self.links:                

            #     try:
            #         #print (self.links[link])   #get structure of link

            #         #get transform of each link with respect to base link
            #         tf_base_to_link = tfBuffer.lookup_transform("base_link", link, rospy.Time())
                    
            #         link_origin.point.x = self.links[link].inertial.origin.xyz[0] 
            #         link_origin.point.y = self.links[link].inertial.origin.xyz[1] 
            #         link_origin.point.z = self.links[link].inertial.origin.xyz[2] 
            #         link_origin.header.frame_id = link
            #         link_origin.header.stamp = rospy.get_rostime()

            #         tf_base_to_link_origin = tf_msg.do_transform_point(link_origin, tf_base_to_link)
                   

            #         #calculate part of CoM equation depending on link
            #         x += self.links[link].inertial.mass * tf_base_to_link_origin.point.x
            #         y += self.links[link].inertial.mass * tf_base_to_link_origin.point.y
            #         z += self.links[link].inertial.mass * tf_base_to_link_origin.point.z
            #     except tf2_ros.TransformException as err:
            #         rospy.logerr("TF error in COM computation %s", err)

                
            point1 = geometry_msgs.msg.Point(0,0,0)
            point2 = geometry_msgs.msg.Point(1,1,0)
            point3 = geometry_msgs.msg.Point(0,1,0)

            marker.points.append(point1)
            marker.points.append(point2)
            marker.points.append(point3)

            pub.publish(marker)


            #rospy.loginfo("COM of robot with respect to world is: "+ str(tf_com_location_to_world.point.x) + " , " + str(tf_com_location_to_world.point.y) +" , " + str(tf_com_location_to_world.point.z))


            try:
                # catch exeption of moving backwarts in time, when restarting simulator
                rate.sleep()
            except rospy.exceptions.ROSTimeMovedBackwardsException:
                rospy.logwarn("We moved backwards in time. I hope you just resetted the simulation. If not there is something wrong")
            
            
if __name__ == '__main__':
    polygon = supportPolygon()