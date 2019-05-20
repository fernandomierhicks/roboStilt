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



#Calculates robots center of mass and supporting polygon and publishes to topic

class Calculator: 
    
    supportingLegs=None
    center_of_mass=None
    center_of_mass_projected=None
    tfBuffer=None
    listener = None
    link_origin = None
    pub_com = None
    pub_projected = None
    pub_com = None
    mass=None
    links=None
    #from robostilt message
    supportingLegs=[False]*8
    jointNames=[" "]*8
    
    def __init__(self):
        rospy.loginfo("Stability caluclations started")
        #node
        rospy.init_node('stability_calculations', anonymous=True)
        rospy.Subscriber("robostilt/general_state_topic", RoboStiltStateMessage, self._supporting_legs_callback)
        #publishers
        self.pub_com = rospy.Publisher('/robostilt/safety/center_of_mass', PointStamped, queue_size=1,latch=True)
        self.pub_projected = rospy.Publisher('/robostilt/safety/center_of_mass_projected', PointStamped, queue_size=1,latch=True)
        self.pub_suport_polygon = rospy.Publisher('/robostilt/safety/support_polygon', PolygonStamped, queue_size=1,latch=True)  
                
        #initialize calculation variables
        self.center_of_mass=PointStamped()
        self.center_of_mass_projected=PointStamped()
        self.tfBuffer = tf2_ros.Buffer()
        self.listener = tf2_ros.TransformListener(self.tfBuffer)
        self.link_origin = geometry_msgs.msg.PointStamped()
        #get mass     
        self.calculateTotalMass()
        #start continous calculations
        self.start()

    def calculateTotalMass(self):
        
        self.mass = 0
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
            self.mass += self.links[link].inertial.mass

        rospy.loginfo("Mass of robot is %f", self.mass)

    def _supporting_legs_callback(self, data):
        #Populate currently supporting legs
        self.jointNames=data.name
        self.supportingLegs=data.is_supporting

    
    def start(self):        
      
        rate = rospy.Rate(50)
        rospy.sleep(1)
        rospy.loginfo("Started COM and support polygon calculations...")
        #loop for calculating the CoM while robot is not shutdown
        while not rospy.is_shutdown():               
            self.calculateCenterOfMass()   
            self.calculateSupportPolygon()
            #rospy.loginfo("COM of robot with respect to world is: "+ str(tf_com_location_to_world.point.x) + " , " + str(tf_com_location_to_world.point.y) +" , " + str(tf_com_location_to_world.point.z))
            try:
                # catch exeption of moving backwarts in time, when restarting simulator
                rate.sleep()
            except rospy.exceptions.ROSTimeMovedBackwardsException:
                rospy.logwarn("We moved backwards in time. I hope you just resetted the simulation. If not there is something wrong")
    
    def calculateSupportPolygon(self):
            point=[Point(),Point(),Point()]
            support_area=PolygonStamped()     
            j=0
            for i in range(0, 8):
                if(self.supportingLegs[i]==True):                
                    #processing a leg that is currently supporting robot                
                    try:                        
                        #get transform of each link with respect to base link
                        self.tf_world_to_link = self.tfBuffer.lookup_transform("world", self.jointNames[i], rospy.Time())    
                        #rospy.loginfo(self.tf_world_to_link)   #get structure of link
                        point[j].x=self.tf_world_to_link.transform.translation.x
                        point[j].y=self.tf_world_to_link.transform.translation.y
                        point[j].z=0  
                        support_area.polygon.points.append(point[j])
                        rospy.loginfo(str(j))
                        j+=1

                    except tf2_ros.TransformException as err:
                        rospy.logerr("TF error in COM computation %s", err)
            #rospy.loginfo(point)
            #rospy.loginfo(support_area)

            support_area.header.stamp=rospy.Time.now()
            support_area.header.frame_id="world"
            self.pub_suport_polygon.publish(support_area)

                
            
                        
           
    def calculateCenterOfMass(self):
            x = 0
            y = 0
            z = 0
            for link in self.links:                

                try:
                    #print (self.links[link])   #get structure of link

                    #get transform of each link with respect to base link
                    self.tf_base_to_link = self.tfBuffer.lookup_transform("base_link", link, rospy.Time())
                    
                    self.link_origin.point.x = self.links[link].inertial.origin.xyz[0] 
                    self.link_origin.point.y = self.links[link].inertial.origin.xyz[1] 
                    self.link_origin.point.z = self.links[link].inertial.origin.xyz[2] 
                    self.link_origin.header.frame_id = link
                    self.link_origin.header.stamp = rospy.get_rostime()

                    tf_base_to_link_origin = tf_msg.do_transform_point(self.link_origin, self.tf_base_to_link)
                   

                    #calculate part of CoM equation depending on link
                    x += self.links[link].inertial.mass * tf_base_to_link_origin.point.x
                    y += self.links[link].inertial.mass * tf_base_to_link_origin.point.y
                    z += self.links[link].inertial.mass * tf_base_to_link_origin.point.z
                except tf2_ros.TransformException as err:
                    rospy.logerr("TF error in COM computation %s", err)

                
            #finish CoM calculation
                        
            self.center_of_mass.header.stamp=rospy.Time.now()
            self.center_of_mass.header.frame_id="base_link"
            self.center_of_mass.point.x= x/self.mass
            self.center_of_mass.point.y= y/self.mass
            self.center_of_mass.point.z= z/self.mass

            self.pub_com.publish(self.center_of_mass)

            #project COM into ground, z=0
            self.tf_base_to_world = self.tfBuffer.lookup_transform("world", "base_link", rospy.Time())
            self.tf_com_location_to_world = tf_msg.do_transform_point(self.center_of_mass, self.tf_base_to_world)
            

            self.center_of_mass_projected.header.frame_id="world"
            self.center_of_mass_projected.header.stamp=rospy.Time.now()
            self.center_of_mass_projected.point.x = self.tf_com_location_to_world.point.x
            self.center_of_mass_projected.point.y = self.tf_com_location_to_world.point.y
            self.center_of_mass_projected.point.z = 0 # zero height

            self.pub_projected.publish(self.center_of_mass_projected)


if __name__ == '__main__':
    calc = Calculator()