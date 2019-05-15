* # **robot**_state

  * supporting_frame
  * actively_moving_frame
  * *lower_legs_on_frame()*
  * *raise_legs_on_frame()*
  * *level()*

  * ## **actuators_state**

    * *init_motors()*

    * *have_all_actuators_reached_goal()*

    * *wait_for_all_actuatros_to_finish()*

    * *set_effort_limit_on_actuators()*

    * *set_effort_limit_to_max_on_actuators()*

    * ### **actuator** [8]

      * name

      * has_been_homed

      * is_supporting

      * #### **motor**

        * name
        * actionClient
        * position
        * velocity
        * effort
        * offset
        * current
        * is_moving
        * has_reached goal
        * effor_limit...
        * *setPosition()*
        * *assertPosition()*
        * *stop()*
        * *setEffortLimits()*
        * *set_effort_limits_to_max()*
        * *overide_effort_limits_for_time()*

      * #### Force

      * #### Switch

  * ## housekeeping

    * **Battery**
    * **LEDS**
    * **ESTOP**
    * **Switch**
    * **Buzzer**

  * ## Sensors

    * **IMU**
    * **LIDAR**
    * **Ultrasonic**

  * ## Safety

  * ## State_machine

    * **Mode**
      * Standby
      * Faulted
      * Moving
      * Sequence



