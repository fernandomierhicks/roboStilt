#! /usr/bin/env python
import rospy

from interactive_markers.interactive_marker_server import *
from visualization_msgs.msg import *
from std_msgs.msg import Float64

from geometry_msgs.msg import Pose
from geometry_msgs.msg import Point

from control_msgs.msg import JointTrajectoryControllerState
from control_msgs.msg import FollowJointTrajectoryGoal
from control_msgs.msg import FollowJointTrajectoryAction 
from trajectory_msgs.msg import (
    JointTrajectory,
    JointTrajectoryPoint
)


class myInteractivemarker:

    def __init__(self):
        rospy.init_node("markers")
        self.publisher=rospy.Publisher("/robostilt/trajectory_controller/command", JointTrajectory, queue_size=10)
        self.listener=rospy.Subscriber("/robostilt/trajectory_controller/state/", JointTrajectoryControllerState, self.joint_position_callback)  
        self.joint_z=0
        self.server = InteractiveMarkerServer("markers") 
        # create an interactive marker for our server
        int_marker = InteractiveMarker()
        int_marker.header.frame_id = "base_link_to_leg_2" 
        int_marker.name = "leg_2_marker"
        int_marker.description = "leg_2"

        # create two arrow markers
        arrow_up = Marker()
        arrow_up.type = Marker.ARROW

        start_point=Point()
        start_point.x=0.0
        start_point.y=0.0
        start_point.z=1.4   #top of the leg

        end_point=Point()
        end_point.x=0.0
        end_point.y=0.0
        end_point.z=1.4+0.2
        
        arrow_up.points.append(start_point)
        arrow_up.points.append(end_point)
        arrow_up.scale.x = 0.05        #shaft diameter
        arrow_up.scale.y = 0.1       #head diameter
        arrow_up.scale.z = 0.1        #head lenght

        arrow_up.color.r = 0.0
        arrow_up.color.g = 0.0
        arrow_up.color.b = 1.0
        arrow_up.color.a = 1.0      

        #Arrow down
        arrow_down = Marker()
        arrow_down.type = Marker.ARROW

        start_point=Point()
        start_point.x=0.0
        start_point.y=0.0
        start_point.z=1.4   #top of the leg

        end_point=Point()
        end_point.x=0.0
        end_point.y=0.0
        end_point.z=1.4-0.2
        
        arrow_down.points.append(start_point)
        arrow_down.points.append(end_point)
        arrow_down.scale.x = 0.05        #shaft diameter
        arrow_down.scale.y = 0.1       #head diameter
        arrow_down.scale.z = 0.1        #head lenght

        arrow_down.color.r = 0.0
        arrow_down.color.g = 0.0
        arrow_down.color.b = 1.0
        arrow_down.color.a = 1.0     



        # create a control which will move the box
        # this control does not contain any markers,
        # which will cause RViz to insert two arrows
        control = InteractiveMarkerControl()
        control.name = "move_leg_2"
        control.orientation.w = 1
        control.orientation.x = 0
        control.orientation.y = 1
        control.orientation.z = 0    
        control.always_visible = True    
        control.interaction_mode = InteractiveMarkerControl.MOVE_AXIS
        control.markers.append(arrow_up)
        control.markers.append(arrow_down)
        # add the control to the interactive marker      
        
        int_marker.controls.append(control)


        # add the interactive marker to our collection &
        # tell the server to call processFeedback() when feedback arrives for it
        self.server.insert(int_marker, self.process_feedback)
        # 'commit' changes and send to all clients
        self.server.applyChanges()
         

    def process_feedback(self, feedback):
        p = feedback.pose.position
        
        increment=0.01
        if(p.z < 0.0):
            increment=increment*-1


        print feedback.marker_name + " is now at z=, " + str(p.z) + " joint is at z= " + str(self.joint_z + " publishing "+ str(self.joint_z+increment))           
        #publish to topic with a small increment in position         
        trajectory=self.create_trajectory(self.joint_z+increment,"base_link_to_leg_2")
        self.publisher.publish(trajectory)

        #permanently position marker the current joint position
        feedback.pose.position.z = 0
        # Apply changes to the marker.
        self.server.setPose(feedback.marker_name, feedback.pose)
        self.server.applyChanges()   
        
    def create_trajectory(self,position,joint_name):
        trajectory = JointTrajectory()
        point = JointTrajectoryPoint()
        #Final position
        point.positions = [position]
        trajectory.points.append(point)
        #How long to get there
        trajectory.points[0].time_from_start=rospy.Duration(0.001)
        trajectory.joint_names.append(joint_name)
        return trajectory  

    def joint_position_callback(self,data):
        #update vartiable with joint posiiont of leg_2
        self.joint_z = data.actual.positions[2]
        
                   
        
        

if __name__=="__main__":    
    myinteractivemarker=myInteractivemarker()  
    rospy.spin()