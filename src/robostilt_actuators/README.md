# robostilt_actuators

This package takes care of the low level to midlevel abstractions level of the robot, pertaining actuators,frames and general hardware state of the robot. 

|       Node name        | robostilt_state                                              |
| :--------------------: | ------------------------------------------------------------ |
|    **Description**     | General state of the robot. High level.                      |
|  **Published topic**   | robostilt/robostilt_state                                    |
| **Published message**  | RoboStiltState.msg                                           |
|  **Published fields**  | status: FAULTED, READY, ETC                                  |
|   **Subscriptions**    | robostilt/actuator_states<br />robostilt/frame_states        |
| **Services available** | step_forward(stroke,rotation) <br>step_backward(stroke,rotation) <br />set_fault(FAULT_CODE,SOURCE) clear_fault() |
|      **Triggers**      | robostilt/frame_states services                              |



|       Node name        | frame_states                                                 |
| :--------------------: | ------------------------------------------------------------ |
|    **Description**     | Mid level abstraction layer. Deals with a group of actuators, frames and leveling. Moves frames |
|  **Published topic**   | robostilt/frame_states                                       |
| **Published message**  | FrameStates.msg                                              |
|  **Published fields**  | supporting_tripod (CONSTANT FRAME.EVEN etc...)<br />pose?<br />raised_frame? |
|   **Subscriptions**    | robostilt/actuator_states                                    |
| **Services available** | raise_frame() <br>lower_frame() <br />lower_legs_on_frame()<br />raise_legs_on frame()<br />move_prismatic()<br />rotate_revolute()<br />set_pose()<br />level_in_place() |
|      **Triggers**      | robostilt/robostilt_state/fault()                            |

 

|       Node name        | actuator_states                                              |
| :--------------------: | ------------------------------------------------------------ |
|    **Description**     | Actuator state and command interface. Moves legs             |
|  **Published topic**   | robostilt/actuator_states                                    |
| **Published message**  | ActuatorsState.msg *which is an array of ActuatorState.msg*  |
|  **Published fields**  | position<br />velocity<br />effort<br />etc..                |
|   **Subscriptions**    | robostilt/joint_states                                       |
| **Services available** | set_position(indexes,positions,velocities,efforts) <br>set_velocity(indexes,velocity,effort) |
|      **Triggers**      | robostilt/robot_state/set_fault()                            |