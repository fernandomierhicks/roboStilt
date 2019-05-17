;; Auto-generated. Do not edit!


(when (boundp 'robostilt_common::RoboStiltStateMessage)
  (if (not (find-package "ROBOSTILT_COMMON"))
    (make-package "ROBOSTILT_COMMON"))
  (shadow 'RoboStiltStateMessage (find-package "ROBOSTILT_COMMON")))
(unless (find-package "ROBOSTILT_COMMON::ROBOSTILTSTATEMESSAGE")
  (make-package "ROBOSTILT_COMMON::ROBOSTILTSTATEMESSAGE"))

(in-package "ROS")
;;//! \htmlinclude RoboStiltStateMessage.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass robostilt_common::RoboStiltStateMessage
  :super ros::object
  :slots (_header _name _is_supporting ))

(defmethod robostilt_common::RoboStiltStateMessage
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:name __name) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:is_supporting __is_supporting) (let (r) (dotimes (i 0) (push nil r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _name __name)
   (setq _is_supporting __is_supporting)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:is_supporting
   (&optional __is_supporting)
   (if __is_supporting (setq _is_supporting __is_supporting)) _is_supporting)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string[] _name
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _name)) 4
    ;; bool[] _is_supporting
    (* 1    (length _is_supporting)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string[] _name
     (write-long (length _name) s)
     (dolist (elem _name)
       (write-long (length elem) s) (princ elem s)
       )
     ;; bool[] _is_supporting
     (write-long (length _is_supporting) s)
     (dotimes (i (length _is_supporting))
       (if (elt _is_supporting i) (write-byte -1 s) (write-byte 0 s))
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string[] _name
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _name (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _name i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; bool[] _is_supporting
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _is_supporting (make-list n))
     (dotimes (i n)
     (setf (elt _is_supporting i) (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
     ))
   ;;
   self)
  )

(setf (get robostilt_common::RoboStiltStateMessage :md5sum-) "7b6f28c055f5a9e7c3caa539d494bf54")
(setf (get robostilt_common::RoboStiltStateMessage :datatype-) "robostilt_common/RoboStiltStateMessage")
(setf (get robostilt_common::RoboStiltStateMessage :definition-)
      "# This is a message that holds data abou the general state of the robo
#
# name holds the name of each leg
# is_supporting=true when that leg is currenlty supporting weight of the robot. Otherwise its false
#
# Each leg is uniquely identified by its name
# The header specifies the time at which the leg states were recorded. All the leg states
# in one message have to be recorded at the same time.
#
# This message consists of a multiple arrays, one for each part of the leg state. 
#
# All arrays in this message should have the same size, or be empty.
# This is the only way to uniquely associate the joint name with the correct
# states.

Header header

string[] name
bool[] is_supporting
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



(provide :robostilt_common/RoboStiltStateMessage "7b6f28c055f5a9e7c3caa539d494bf54")


