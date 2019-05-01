#! /usr/bin/env python
import roslaunch
import rospy

#rospy.init_node('en_Mapping', anonymous=True)
uuid = roslaunch.rlutil.get_or_generate_uuid(None, False)
roslaunch.configure_logging(uuid)

# # THIS ONLY WORK ON LUNAR:
# Load Master YAML into parameter server
# Read individual parameters from Python
# Launch URDF.xacro launch file with argument from python. 
# ----Cant do it in Kinetic as roslaunch only acepts arguments in Lunar. ----Cant call xacro from python.

cli_args = ['/home/fernandomierhicks/robostilt/src/robostilt_description/launch/urdf2.launch','leg_lenght:=10.0']
roslaunch_args = cli_args[1:]
roslaunch_file = [(roslaunch.rlutil.resolve_launch_arguments(cli_args)[0], roslaunch_args)]
print str(roslaunch_file)

launch = roslaunch.parent.ROSLaunchParent(uuid, roslaunch_file)
launch.start()
rospy.loginfo("started")
rospy.sleep(50)
# 3 seconds later
launch.shutdown()