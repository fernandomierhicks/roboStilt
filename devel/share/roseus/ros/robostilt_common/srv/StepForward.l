;; Auto-generated. Do not edit!


(when (boundp 'robostilt_common::StepForward)
  (if (not (find-package "ROBOSTILT_COMMON"))
    (make-package "ROBOSTILT_COMMON"))
  (shadow 'StepForward (find-package "ROBOSTILT_COMMON")))
(unless (find-package "ROBOSTILT_COMMON::STEPFORWARD")
  (make-package "ROBOSTILT_COMMON::STEPFORWARD"))
(unless (find-package "ROBOSTILT_COMMON::STEPFORWARDREQUEST")
  (make-package "ROBOSTILT_COMMON::STEPFORWARDREQUEST"))
(unless (find-package "ROBOSTILT_COMMON::STEPFORWARDRESPONSE")
  (make-package "ROBOSTILT_COMMON::STEPFORWARDRESPONSE"))

(in-package "ROS")





(defclass robostilt_common::StepForwardRequest
  :super ros::object
  :slots ())

(defmethod robostilt_common::StepForwardRequest
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

(defclass robostilt_common::StepForwardResponse
  :super ros::object
  :slots (_success ))

(defmethod robostilt_common::StepForwardResponse
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

(defclass robostilt_common::StepForward
  :super ros::object
  :slots ())

(setf (get robostilt_common::StepForward :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get robostilt_common::StepForward :datatype-) "robostilt_common/StepForward")
(setf (get robostilt_common::StepForward :request) robostilt_common::StepForwardRequest)
(setf (get robostilt_common::StepForward :response) robostilt_common::StepForwardResponse)

(defmethod robostilt_common::StepForwardRequest
  (:response () (instance robostilt_common::StepForwardResponse :init)))

(setf (get robostilt_common::StepForwardRequest :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get robostilt_common::StepForwardRequest :datatype-) "robostilt_common/StepForwardRequest")
(setf (get robostilt_common::StepForwardRequest :definition-)
      "---
bool success
")

(setf (get robostilt_common::StepForwardResponse :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get robostilt_common::StepForwardResponse :datatype-) "robostilt_common/StepForwardResponse")
(setf (get robostilt_common::StepForwardResponse :definition-)
      "---
bool success
")



(provide :robostilt_common/StepForward "358e233cde0c8a8bcfea4ce193f8fc15")


