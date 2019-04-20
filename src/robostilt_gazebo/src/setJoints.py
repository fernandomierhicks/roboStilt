import rospy
from gazebo_msgs.srv import SetModelConfiguration
from gazebo_msgs.srv import SetModelConfigurationRequest

reset_joints = rospy.ServiceProxy(
    '/gazebo/set_model_configuration', SetModelConfiguration)

reset_req = SetModelConfigurationRequest()
reset_req.model_name = 'robostilt'
reset_req.urdf_param_name = 'robot_description'
reset_req.joint_names = ['base_link_to_leg_2'
                         'base_link_to_leg_4'
                         'base_link_to_leg_6'
                         'base_link_to_third_frame']  # list
reset_req.joint_positions = [-0.8, -0.8, -0.8, -0.5]  # list
res = reset_joints(reset_req)
