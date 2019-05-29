;; Auto-generated. Do not edit!


(when (boundp 'robostilt_common::TriggerFault)
  (if (not (find-package "ROBOSTILT_COMMON"))
    (make-package "ROBOSTILT_COMMON"))
  (shadow 'TriggerFault (find-package "ROBOSTILT_COMMON")))
(unless (find-package "ROBOSTILT_COMMON::TRIGGERFAULT")
  (make-package "ROBOSTILT_COMMON::TRIGGERFAULT"))
(unless (find-package "ROBOSTILT_COMMON::TRIGGERFAULTREQUEST")
  (make-package "ROBOSTILT_COMMON::TRIGGERFAULTREQUEST"))
(unless (find-package "ROBOSTILT_COMMON::TRIGGERFAULTRESPONSE")
  (make-package "ROBOSTILT_COMMON::TRIGGERFAULTRESPONSE"))

(in-package "ROS")





(defclass robostilt_common::TriggerFaultRequest
  :super ros::object
  :slots (_fault_code ))

(defmethod robostilt_common::TriggerFaultRequest
  (:init
   (&key
    ((:fault_code __fault_code) 0)
    )
   (send-super :init)
   (setq _fault_code (round __fault_code))
   self)
  (:fault_code
   (&optional __fault_code)
   (if __fault_code (setq _fault_code __fault_code)) _fault_code)
  (:serialization-length
   ()
   (+
    ;; int32 _fault_code
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _fault_code
       (write-long _fault_code s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _fault_code
     (setq _fault_code (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass robostilt_common::TriggerFaultResponse
  :super ros::object
  :slots (_success ))

(defmethod robostilt_common::TriggerFaultResponse
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

(defclass robostilt_common::TriggerFault
  :super ros::object
  :slots ())

(setf (get robostilt_common::TriggerFault :md5sum-) "48423ad27bada7cd9dea5c77b2e6e973")
(setf (get robostilt_common::TriggerFault :datatype-) "robostilt_common/TriggerFault")
(setf (get robostilt_common::TriggerFault :request) robostilt_common::TriggerFaultRequest)
(setf (get robostilt_common::TriggerFault :response) robostilt_common::TriggerFaultResponse)

(defmethod robostilt_common::TriggerFaultRequest
  (:response () (instance robostilt_common::TriggerFaultResponse :init)))

(setf (get robostilt_common::TriggerFaultRequest :md5sum-) "48423ad27bada7cd9dea5c77b2e6e973")
(setf (get robostilt_common::TriggerFaultRequest :datatype-) "robostilt_common/TriggerFaultRequest")
(setf (get robostilt_common::TriggerFaultRequest :definition-)
      "int32 fault_code
---
bool success
")

(setf (get robostilt_common::TriggerFaultResponse :md5sum-) "48423ad27bada7cd9dea5c77b2e6e973")
(setf (get robostilt_common::TriggerFaultResponse :datatype-) "robostilt_common/TriggerFaultResponse")
(setf (get robostilt_common::TriggerFaultResponse :definition-)
      "int32 fault_code
---
bool success
")



(provide :robostilt_common/TriggerFault "48423ad27bada7cd9dea5c77b2e6e973")


