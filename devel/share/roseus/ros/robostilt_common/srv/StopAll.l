;; Auto-generated. Do not edit!


(when (boundp 'robostilt_common::StopAll)
  (if (not (find-package "ROBOSTILT_COMMON"))
    (make-package "ROBOSTILT_COMMON"))
  (shadow 'StopAll (find-package "ROBOSTILT_COMMON")))
(unless (find-package "ROBOSTILT_COMMON::STOPALL")
  (make-package "ROBOSTILT_COMMON::STOPALL"))
(unless (find-package "ROBOSTILT_COMMON::STOPALLREQUEST")
  (make-package "ROBOSTILT_COMMON::STOPALLREQUEST"))
(unless (find-package "ROBOSTILT_COMMON::STOPALLRESPONSE")
  (make-package "ROBOSTILT_COMMON::STOPALLRESPONSE"))

(in-package "ROS")





(defclass robostilt_common::StopAllRequest
  :super ros::object
  :slots ())

(defmethod robostilt_common::StopAllRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass robostilt_common::StopAllResponse
  :super ros::object
  :slots (_success ))

(defmethod robostilt_common::StopAllResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass robostilt_common::StopAll
  :super ros::object
  :slots ())

(setf (get robostilt_common::StopAll :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get robostilt_common::StopAll :datatype-) "robostilt_common/StopAll")
(setf (get robostilt_common::StopAll :request) robostilt_common::StopAllRequest)
(setf (get robostilt_common::StopAll :response) robostilt_common::StopAllResponse)

(defmethod robostilt_common::StopAllRequest
  (:response () (instance robostilt_common::StopAllResponse :init)))

(setf (get robostilt_common::StopAllRequest :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get robostilt_common::StopAllRequest :datatype-) "robostilt_common/StopAllRequest")
(setf (get robostilt_common::StopAllRequest :definition-)
      "---
bool success
")

(setf (get robostilt_common::StopAllResponse :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get robostilt_common::StopAllResponse :datatype-) "robostilt_common/StopAllResponse")
(setf (get robostilt_common::StopAllResponse :definition-)
      "---
bool success
")



(provide :robostilt_common/StopAll "358e233cde0c8a8bcfea4ce193f8fc15")


