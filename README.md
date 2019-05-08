# RoboStilt

This is the main ROS workspace for the RoboStilt robot. 

This release has the following features

* URDF model with XACRO and gazebo tags loaded also into parameter server
* ros_control/effort_controllers to read and control joints in simulation
  * JointTrajecotry controller to move multiple actuators at the same time with trajectorized paths
  * YAML anchors
* Dynamic reconfiguration publisher
* Gazebo simulation is stable, spawns in known position and with known joint positions
  * Gazebo crashes sometimes.
* RVIZ connected to simulation via TF publisher with interactive markers
* Stable forward with effor limit detection.

# ROS Flow

* `robostilt_description/launch/init_robot.launch`
  * Sets common arguments and saves some of them on the parameter server
  * Loads URDF model of robot into param server using the previous arguments.
    * Single spot for robot dimension, accessible to URDF and parameter server 
* `robostilt_control/launch/controllaunch`
  * Loads controller configuration from `robostilt_control/config/control.yaml`
  * Loads controllers into controller spawner including the gazebo **joint_state_publisher**
  * ***in Gazebo the ouptut of the controller, the manipulation variable, limits are not visible on the respective topics. But they are  really applied. The controller might send XXX in /state/command and gazebo clamps it to what is on the URDF.*** 
  * These limits are really enfored on a real robot on the write() read()function
  * Loads **robot_state_publisher** to update TFs from joint position information
* `robostilt_rviz/launch/rviz.launch`
  * Loads rviz with known config
  * Launches simple_marker.py node
    * Creates an interactive maker server
    * The node takes in the data from the joint state topic uses it with the interactive marker location and publishes a new set point fort he joint so it moves in a intuitive fashion. 
* `robostilt_gazebo/launch/gazebo.launch`
  * Launches gazebo with empty world
  * Spawns robot into gazebo with known joint positions and pose
  * Launch python node that publishes base to world TF. 
    * Used to position robot in rviz
* RQT_GUI
  * Launch RQT gui with known perspective

# How to launch

```
roslaunch robostilt_pkg demoGazebo.launch
```

Wait for all programs to load

1. Play simulation in Gazebo. Model falls and remains flat on ground. 

   1. **Gazebo sometimes crashes and fails to open**

2. Publish joit positions using RQT_GUI message publisher or run python script:

   ```
   rosrun robostilt_common stepForward.py
   ```


To reset simulation.

`roslaunch robostilt_gazebo reset.launch`

# TODO

* Sensors in simulation

* Individual JointTrajectoryControllers on all joints

  * Move leg down, with effort limit

* Gait based on sensor input

  