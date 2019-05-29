;; Auto-generated. Do not edit!


(when (boundp 'robostilt_common::FramesState)
  (if (not (find-package "ROBOSTILT_COMMON"))
    (make-package "ROBOSTILT_COMMON"))
  (shadow 'FramesState (find-package "ROBOSTILT_COMMON")))
(unless (find-package "ROBOSTILT_COMMON::FRAMESSTATE")
  (make-package "ROBOSTILT_COMMON::FRAMESSTATE"))

(in-package "ROS")
;;//! \htmlinclude FramesState.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*NONE*" (find-package "ROBOSTILT_COMMON::FRAMESSTATE"))
(shadow '*NONE* (find-package "ROBOSTILT_COMMON::FRAMESSTATE"))
(defconstant robostilt_common::FramesState::*NONE* 0)
(intern "*ODD*" (find-package "ROBOSTILT_COMMON::FRAMESSTATE"))
(shadow '*ODD* (find-package "ROBOSTILT_COMMON::FRAMESSTATE"))
(defconstant robostilt_common::FramesState::*ODD* 1)
(intern "*EVEN*" (find-package "ROBOSTILT_COMMON::FRAMESSTATE"))
(shadow '*EVEN* (find-package "ROBOSTILT_COMMON::FRAMESSTATE"))
(defconstant robostilt_common::FramesState::*EVEN* 2)
(intern "*PRISMATIC*" (find-package "ROBOSTILT_COMMON::FRAMESSTATE"))
(shadow '*PRISMATIC* (find-package "ROBOSTILT_COMMON::FRAMESSTATE"))
(defconstant robostilt_common::FramesState::*PRISMATIC* 3)
(intern "*REVOLUTE*" (find-package "ROBOSTILT_COMMON::FRAMESSTATE"))
(shadow '*REVOLUTE* (find-package "ROBOSTILT_COMMON::FRAMESSTATE"))
(defconstant robostilt_common::FramesState::*REVOLUTE* 4)
(intern "*ODD_AND_EVEN*" (find-package "ROBOSTILT_COMMON::FRAMESSTATE"))
(shadow '*ODD_AND_EVEN* (find-package "ROBOSTILT_COMMON::FRAMESSTATE"))
(defconstant robostilt_common::FramesState::*ODD_AND_EVEN* 5)
(intern "*PRISMATIC_AND_REVOLUTE*" (find-package "ROBOSTILT_COMMON::FRAMESSTATE"))
(shadow '*PRISMATIC_AND_REVOLUTE* (find-package "ROBOSTILT_COMMON::FRAMESSTATE"))
(defconstant robostilt_common::FramesState::*PRISMATIC_AND_REVOLUTE* 6)
(defclass robostilt_common::FramesState
  :super ros::object
  :slots (_header _supporting_frame ))

(defmethod robostilt_common::FramesState
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:supporting_frame __supporting_frame) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _supporting_frame (round __supporting_frame))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:supporting_frame
   (&optional __supporting_frame)
   (if __supporting_frame (setq _supporting_frame __supporting_frame)) _supporting_frame)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint8 _supporting_frame
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint8 _supporting_frame
       (write-byte _supporting_frame s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint8 _supporting_frame
     (setq _supporting_frame (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get robostilt_common::FramesState :md5sum-) "99027c087e70afd82e291601a344b52e")
(setf (get robostilt_common::FramesState :datatype-) "robostilt_common/FramesState")
(setf (get robostilt_common::FramesState :definition-)
      "uint8 NONE=0
uint8 ODD = 1
uint8 EVEN = 2
uint8 PRISMATIC = 3
uint8 REVOLUTE = 4
uint8 ODD_AND_EVEN = 5
uint8 PRISMATIC_AND_REVOLUTE = 6


Header header
uint8 supporting_frame



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



(provide :robostilt_common/FramesState "99027c087e70afd82e291601a344b52e")


