# RoboStilt

This is the main ROS workspace for the RoboStilt robot. 

This release has the following features

* URDF model with XACRO and gazebo tags
* ros_control/effort_controllers to read and control joints in simulation
  * YAML anchors
* Dynamic reconfiguration publiser
* Gazebo simulation is stable, spawns in known position and with known joint positions
  * Gazebo crashes sometimes.
* RVIZ connected to simulation via TF publisher
* Command joint positions via python script

# ROS Flow

* `robostilt_description/launch/urdf.launch`
  * Loads URDF model of robot into param server. 
* `robostilt_control/launch/controllaunch`
  * Loads joint controller configuration from `robostilt_control/config/control.yaml`
  * Loads controllers into controller spawner including the gazebo **joint_state_publisher**
  * OPTIONAL Run python script that updates the dynamic reconfigurable parameters to each controller.  `initialize_controllers.py`
  * Loads **robot_state_publisher** to update TFs from joint position information
* `robostilt_rviz/launch/rviz.launch`
  * Loads rviz with known config
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
   rosrun robostilt_gait update_gait
   ```

   

# TODO

* JointTrajectory controller on all joints
* Gait script
* Sensors in simulation
* Joint limits
* Interactive markers