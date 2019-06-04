;; Auto-generated. Do not edit!


(when (boundp 'robostilt_common::RobotState)
  (if (not (find-package "ROBOSTILT_COMMON"))
    (make-package "ROBOSTILT_COMMON"))
  (shadow 'RobotState (find-package "ROBOSTILT_COMMON")))
(unless (find-package "ROBOSTILT_COMMON::ROBOTSTATE")
  (make-package "ROBOSTILT_COMMON::ROBOTSTATE"))

(in-package "ROS")
;;//! \htmlinclude RobotState.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*STATE_READY*" (find-package "ROBOSTILT_COMMON::ROBOTSTATE"))
(shadow '*STATE_READY* (find-package "ROBOSTILT_COMMON::ROBOTSTATE"))
(defconstant robostilt_common::RobotState::*STATE_READY* 0)
(intern "*STATE_FAULTED*" (find-package "ROBOSTILT_COMMON::ROBOTSTATE"))
(shadow '*STATE_FAULTED* (find-package "ROBOSTILT_COMMON::ROBOTSTATE"))
(defconstant robostilt_common::RobotState::*STATE_FAULTED* 1)
(intern "*STATE_BUSY_MOVING*" (find-package "ROBOSTILT_COMMON::ROBOTSTATE"))
(shadow '*STATE_BUSY_MOVING* (find-package "ROBOSTILT_COMMON::ROBOTSTATE"))
(defconstant robostilt_common::RobotState::*STATE_BUSY_MOVING* 2)
(intern "*STATE_BUSY_COMPUTING*" (find-package "ROBOSTILT_COMMON::ROBOTSTATE"))
(shadow '*STATE_BUSY_COMPUTING* (find-package "ROBOSTILT_COMMON::ROBOTSTATE"))
(defconstant robostilt_common::RobotState::*STATE_BUSY_COMPUTING* 3)
(intern "*FAULT_CLEAR*" (find-package "ROBOSTILT_COMMON::ROBOTSTATE"))
(shadow '*FAULT_CLEAR* (find-package "ROBOSTILT_COMMON::ROBOTSTATE"))
(defconstant robostilt_common::RobotState::*FAULT_CLEAR* 0)
(intern "*FAULT_ESTOP*" (find-package "ROBOSTILT_COMMON::ROBOTSTATE"))
(shadow '*FAULT_ESTOP* (find-package "ROBOSTILT_COMMON::ROBOTSTATE"))
(defconstant robostilt_common::RobotState::*FAULT_ESTOP* 1)
(intern "*FAULT_EFFORT*" (find-package "ROBOSTILT_COMMON::ROBOTSTATE"))
(shadow '*FAULT_EFFORT* (find-package "ROBOSTILT_COMMON::ROBOTSTATE"))
(defconstant robostilt_common::RobotState::*FAULT_EFFORT* 2)
(intern "*FAULT_TRAJECTORY*" (find-package "ROBOSTILT_COMMON::ROBOTSTATE"))
(shadow '*FAULT_TRAJECTORY* (find-package "ROBOSTILT_COMMON::ROBOTSTATE"))
(defconstant robostilt_common::RobotState::*FAULT_TRAJECTORY* 3)
(intern "*FAULT_STABILITY_COM_OUTSIDE*" (find-package "ROBOSTILT_COMMON::ROBOTSTATE"))
(shadow '*FAULT_STABILITY_COM_OUTSIDE* (find-package "ROBOSTILT_COMMON::ROBOTSTATE"))
(defconstant robostilt_common::RobotState::*FAULT_STABILITY_COM_OUTSIDE* 4)
(defclass robostilt_common::RobotState
  :super ros::object
  :slots (_header _state _state_string _fault _fault_string ))

(defmethod robostilt_common::RobotState
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:state __state) 0)
    ((:state_string __state_string) "")
    ((:fault __fault) 0)
    ((:fault_string __fault_string) "")
    )
   (send-super :init)
   (setq _header __header)
   (setq _state (round __state))
   (setq _state_string (string __state_string))
   (setq _fault (round __fault))
   (setq _fault_string (string __fault_string))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:state
   (&optional __state)
   (if __state (setq _state __state)) _state)
  (:state_string
   (&optional __state_string)
   (if __state_string (setq _state_string __state_string)) _state_string)
  (:fault
   (&optional __fault)
   (if __fault (setq _fault __fault)) _fault)
  (:fault_string
   (&optional __fault_string)
   (if __fault_string (setq _fault_string __fault_string)) _fault_string)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int32 _state
    4
    ;; string _state_string
    4 (length _state_string)
    ;; int32 _fault
    4
    ;; string _fault_string
    4 (length _fault_string)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int32 _state
       (write-long _state s)
     ;; string _state_string
       (write-long (length _state_string) s) (princ _state_string s)
     ;; int32 _fault
       (write-long _fault s)
     ;; string _fault_string
       (write-long (length _fault_string) s) (princ _fault_string s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int32 _state
     (setq _state (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _state_string
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _state_string (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _fault
     (setq _fault (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _fault_string
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _fault_string (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get robostilt_common::RobotState :md5sum-) "ea7c2299644417198ffdc91fa298b902")
(setf (get robostilt_common::RobotState :datatype-) "robostilt_common/RobotState")
(setf (get robostilt_common::RobotState :definition-)
      "int32 STATE_READY=0
int32 STATE_FAULTED=1
int32 STATE_BUSY_MOVING=2
int32 STATE_BUSY_COMPUTING=3

int32 FAULT_CLEAR=0
int32 FAULT_ESTOP=1
int32 FAULT_EFFORT=2
int32 FAULT_TRAJECTORY=3
int32 FAULT_STABILITY_COM_OUTSIDE=4


Header header

int32 state
string state_string

int32 fault
string fault_string
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

")



(provide :robostilt_common/RobotState "ea7c2299644417198ffdc91fa298b902")


