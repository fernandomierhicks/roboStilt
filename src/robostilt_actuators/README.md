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
|      **Triggers**      |                                                              |

  _

|       Node name        | actuator_states                                              |
| :--------------------: | ------------------------------------------------------------ |
|    **Description**     | Actuator state and command interface                         |
|  **Published topic**   | robostilt/actuator_states                                    |
| **Published message**  | ActuatorStates.msg                                           |
|  **Published fields**  | position<br />velocity<br />effort<br />etc..                |
|   **Subscriptions**    | robostilt/joint_states                                       |
| **Services available** | set_position(indexes,position,velocity,effort) <br>set_velocity(indexes,velocity,effort) |
|      **Triggers**      | robostilt/robot_state/set_fault()                            |



