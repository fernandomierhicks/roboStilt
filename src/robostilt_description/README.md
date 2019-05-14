# Robot description

* `robostilt_description/launch/init_robot.launch`
  * Sets some of the most important dimensions of the robot on the parameter 
  * Loads URDF model of robot into param server using the previous arguments.
    * Single spot for robot dimensions, accessible to URDF and parameter server 
  * Init_joint_limits.py replicates paramaters from leg1 to all the other legs. 

### Parameter YAMLS

**joint_limits.YAML :** Holds parameters relevant to ros_control and Gazebo.

**parameters.YAML:** Holds parameters used on gait and other custom nodes. 

Offsets can be manages in several ways:

* Inside robot_state python script:
  * Joint states doesnt publish offested datat, will need to republihsed
* By adding offset on transmission elemet
  * Dont know how to do via URDF description
* Changing the origin of the URDF joint. **CURRENTLY IMPLEMENTED**