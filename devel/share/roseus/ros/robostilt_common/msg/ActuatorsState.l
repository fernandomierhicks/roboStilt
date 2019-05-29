;; Auto-generated. Do not edit!


(when (boundp 'robostilt_common::ActuatorsState)
  (if (not (find-package "ROBOSTILT_COMMON"))
    (make-package "ROBOSTILT_COMMON"))
  (shadow 'ActuatorsState (find-package "ROBOSTILT_COMMON")))
(unless (find-package "ROBOSTILT_COMMON::ACTUATORSSTATE")
  (make-package "ROBOSTILT_COMMON::ACTUATORSSTATE"))

(in-package "ROS")
;;//! \htmlinclude ActuatorsState.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*COUNT*" (find-package "ROBOSTILT_COMMON::ACTUATORSSTATE"))
(shadow '*COUNT* (find-package "ROBOSTILT_COMMON::ACTUATORSSTATE"))
(defconstant robostilt_common::ActuatorsState::*COUNT* 8)
(intern "*THIRD_FRAME_PRISMATIC*" (find-package "ROBOSTILT_COMMON::ACTUATORSSTATE"))
(shadow '*THIRD_FRAME_PRISMATIC* (find-package "ROBOSTILT_COMMON::ACTUATORSSTATE"))
(defconstant robostilt_common::ActuatorsState::*THIRD_FRAME_PRISMATIC* 0)
(intern "*LEG_1*" (find-package "ROBOSTILT_COMMON::ACTUATORSSTATE"))
(shadow '*LEG_1* (find-package "ROBOSTILT_COMMON::ACTUATORSSTATE"))
(defconstant robostilt_common::ActuatorsState::*LEG_1* 1)
(intern "*LEG_2*" (find-package "ROBOSTILT_COMMON::ACTUATORSSTATE"))
(shadow '*LEG_2* (find-package "ROBOSTILT_COMMON::ACTUATORSSTATE"))
(defconstant robostilt_common::ActuatorsState::*LEG_2* 2)
(intern "*LEG_3*" (find-package "ROBOSTILT_COMMON::ACTUATORSSTATE"))
(shadow '*LEG_3* (find-package "ROBOSTILT_COMMON::ACTUATORSSTATE"))
(defconstant robostilt_common::ActuatorsState::*LEG_3* 3)
(intern "*LEG_4*" (find-package "ROBOSTILT_COMMON::ACTUATORSSTATE"))
(shadow '*LEG_4* (find-package "ROBOSTILT_COMMON::ACTUATORSSTATE"))
(defconstant robostilt_common::ActuatorsState::*LEG_4* 4)
(intern "*LEG_5*" (find-package "ROBOSTILT_COMMON::ACTUATORSSTATE"))
(shadow '*LEG_5* (find-package "ROBOSTILT_COMMON::ACTUATORSSTATE"))
(defconstant robostilt_common::ActuatorsState::*LEG_5* 5)
(intern "*LEG_6*" (find-package "ROBOSTILT_COMMON::ACTUATORSSTATE"))
(shadow '*LEG_6* (find-package "ROBOSTILT_COMMON::ACTUATORSSTATE"))
(defconstant robostilt_common::ActuatorsState::*LEG_6* 6)
(intern "*THIRD_FRAME_REVOLUTE*" (find-package "ROBOSTILT_COMMON::ACTUATORSSTATE"))
(shadow '*THIRD_FRAME_REVOLUTE* (find-package "ROBOSTILT_COMMON::ACTUATORSSTATE"))
(defconstant robostilt_common::ActuatorsState::*THIRD_FRAME_REVOLUTE* 7)
(intern "*ABS*" (find-package "ROBOSTILT_COMMON::ACTUATORSSTATE"))
(shadow '*ABS* (find-package "ROBOSTILT_COMMON::ACTUATORSSTATE"))
(defconstant robostilt_common::ActuatorsState::*ABS* nil)
(intern "*REL*" (find-package "ROBOSTILT_COMMON::ACTUATORSSTATE"))
(shadow '*REL* (find-package "ROBOSTILT_COMMON::ACTUATORSSTATE"))
(defconstant robostilt_common::ActuatorsState::*REL* nil)
(defclass robostilt_common::ActuatorsState
  :super ros::object
  :slots (_header _actuators _have_all_been_homed _all_are_ready ))

(defmethod robostilt_common::ActuatorsState
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:actuators __actuators) (let (r) (dotimes (i 0) (push (instance robostilt_common::SingleActuator :init) r)) r))
    ((:have_all_been_homed __have_all_been_homed) nil)
    ((:all_are_ready __all_are_ready) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _actuators __actuators)
   (setq _have_all_been_homed __have_all_been_homed)
   (setq _all_are_ready __all_are_ready)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:actuators
   (&rest __actuators)
   (if (keywordp (car __actuators))
       (send* _actuators __actuators)
     (progn
       (if __actuators (setq _actuators (car __actuators)))
       _actuators)))
  (:have_all_been_homed
   (&optional __have_all_been_homed)
   (if __have_all_been_homed (setq _have_all_been_homed __have_all_been_homed)) _have_all_been_homed)
  (:all_are_ready
   (&optional __all_are_ready)
   (if __all_are_ready (setq _all_are_ready __all_are_ready)) _all_are_ready)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; robostilt_common/SingleActuator[] _actuators
    (apply #'+ (send-all _actuators :serialization-length)) 4
    ;; bool _have_all_been_homed
    1
    ;; bool _all_are_ready
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; robostilt_common/SingleActuator[] _actuators
     (write-long (length _actuators) s)
     (dolist (elem _actuators)
       (send elem :serialize s)
       )
     ;; bool _have_all_been_homed
       (if _have_all_been_homed (write-byte -1 s) (write-byte 0 s))
     ;; bool _all_are_ready
       (if _all_are_ready (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; robostilt_common/SingleActuator[] _actuators
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _actuators (let (r) (dotimes (i n) (push (instance robostilt_common::SingleActuator :init) r)) r))
     (dolist (elem- _actuators)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; bool _have_all_been_homed
     (setq _have_all_been_homed (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _all_are_ready
     (setq _all_are_ready (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get robostilt_common::ActuatorsState :md5sum-) "7026e9a150e20fe0ee17ebe9f4258d15")
(setf (get robostilt_common::ActuatorsState :datatype-) "robostilt_common/ActuatorsState")
(setf (get robostilt_common::ActuatorsState :definition-)
      "# This is a message that holds the state of all actuators as an array.

uint8 COUNT=8
uint8 THIRD_FRAME_PRISMATIC = 0
uint8 LEG_1 = 1
uint8 LEG_2 = 2
uint8 LEG_3 = 3
uint8 LEG_4 = 4
uint8 LEG_5 = 5
uint8 LEG_6 = 6
uint8 THIRD_FRAME_REVOLUTE = 7

bool ABS=True
bool REL=False


Header header

SingleActuator[] actuators
bool have_all_been_homed
bool all_are_ready
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: robostilt_common/SingleActuator
# This is a message that holds extended data for a single actuator

string  name
int32   index

float64 position
float64 position_setpoint   #trajectorized setpoint TODO
float64 position_goal       #long term goal

float64 velocity
float64 velocity_setpoint   #trajectorized velocity TODO

float64 effort
float64 effort_limit_upper
float64 effort_limit_lower
float64 effort_fault_expected


float32 manipulation
float32 progress

bool is_moving
bool is_ready
bool has_been_homed
bool is_supporting_weight





")



(provide :robostilt_common/ActuatorsState "7026e9a150e20fe0ee17ebe9f4258d15")


