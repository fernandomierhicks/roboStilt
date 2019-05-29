;; Auto-generated. Do not edit!


(when (boundp 'robostilt_common::RobotState)
  (if (not (find-package "ROBOSTILT_COMMON"))
    (make-package "ROBOSTILT_COMMON"))
  (shadow 'RobotState (find-package "ROBOSTILT_COMMON")))
(unless (find-package "ROBOSTILT_COMMON::ROBOTSTATE")
  (make-package "ROBOSTILT_COMMON::ROBOTSTATE"))

(in-package "ROS")
;;//! \htmlinclude RobotState.msg.html


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
(defclass robostilt_common::RobotState
  :super ros::object
  :slots (_state _state_string _fault _fault_string ))

(defmethod robostilt_common::RobotState
  (:init
   (&key
    ((:state __state) 0)
    ((:state_string __state_string) "")
    ((:fault __fault) 0)
    ((:fault_string __fault_string) "")
    )
   (send-super :init)
   (setq _state (round __state))
   (setq _state_string (string __state_string))
   (setq _fault (round __fault))
   (setq _fault_string (string __fault_string))
   self)
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

(setf (get robostilt_common::RobotState :md5sum-) "df8799c1ffe4dea4788499b5ad10d0fa")
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

int32 state
string state_string

int32 fault
string fault_string
")



(provide :robostilt_common/RobotState "df8799c1ffe4dea4788499b5ad10d0fa")


