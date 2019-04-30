#! /usr/bin/env python
import rospy

from interactive_markers.interactive_marker_server import *
from visualization_msgs.msg import *
from std_msgs.msg import Float64

from geometry_msgs.msg import Pose


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
        self.server = InteractiveMarkerServer("markers") 
        # create an interactive marker for our server
        int_marker = InteractiveMarker()
        int_marker.header.frame_id = "leg_2" 
        int_marker.name = "leg_2_marker"
        int_marker.description = "leg_2"

        # create a grey box marker
        cyl_marker = Marker()
        cyl_marker.type = Marker.CYLINDER
        cyl_marker.scale.x = 0.03
        cyl_marker.scale.y = 0.03
        cyl_marker.scale.z = 0.2
        cyl_marker.color.r = 0.0
        cyl_marker.color.g = 0.0
        cyl_marker.color.b = 1.0
        cyl_marker.color.a = 1.0        
        # create a non-interactive control which contains the box
        box_control = InteractiveMarkerControl()
        box_control.always_visible = True
        box_control.markers.append( cyl_marker )
        int_marker.controls.append(box_control)      



        # create a control which will move the box
        # this control does not contain any markers,
        # which will cause RViz to insert two arrows
        control = InteractiveMarkerControl()
        control.name = "move_leg_2"
        control.orientation.w = 1
        control.orientation.x = 0
        control.orientation.y = 1
        control.orientation.z = 0        
        control.interaction_mode = InteractiveMarkerControl.MOVE_AXIS
        # add the control to the interactive marker      
        
        int_marker.controls.append(control)

        int_marker.scale=0.4



        # add the interactive marker to our collection &
        # tell the server to call processFeedback() when feedback arrives for it
        self.server.insert(int_marker, self.process_feedback)
        # 'commit' changes and send to all clients
        self.server.applyChanges()
         

    def process_feedback(self, feedback):

        p = feedback.pose.position
        print feedback.marker_name + " is now at " + str(p.x) + ", " + str(p.y) + ", " + str(p.z)            
        #publish to topic
        trajectory=self.create_trajectory(feedback.pose.position.z,"base_link_to_leg_2")

        self.publisher.publish(trajectory)

        #Make marker return to its original position.
        if feedback.pose.position.z != 0:
            feedback.pose.position.z = 1.0    #leg lenght /2.0
            feedback.pose.position.x = 0.2   
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
        

if __name__=="__main__":    
    myinteractivemarker=myInteractivemarker()  
    rospy.spin()