;; Auto-generated. Do not edit!


(when (boundp 'robostilt_common::empty_call_bool_result)
  (if (not (find-package "ROBOSTILT_COMMON"))
    (make-package "ROBOSTILT_COMMON"))
  (shadow 'empty_call_bool_result (find-package "ROBOSTILT_COMMON")))
(unless (find-package "ROBOSTILT_COMMON::EMPTY_CALL_BOOL_RESULT")
  (make-package "ROBOSTILT_COMMON::EMPTY_CALL_BOOL_RESULT"))
(unless (find-package "ROBOSTILT_COMMON::EMPTY_CALL_BOOL_RESULTREQUEST")
  (make-package "ROBOSTILT_COMMON::EMPTY_CALL_BOOL_RESULTREQUEST"))
(unless (find-package "ROBOSTILT_COMMON::EMPTY_CALL_BOOL_RESULTRESPONSE")
  (make-package "ROBOSTILT_COMMON::EMPTY_CALL_BOOL_RESULTRESPONSE"))

(in-package "ROS")





(defclass robostilt_common::empty_call_bool_resultRequest
  :super ros::object
  :slots ())

(defmethod robostilt_common::empty_call_bool_resultRequest
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

(defclass robostilt_common::empty_call_bool_resultResponse
  :super ros::object
  :slots (_result ))

(defmethod robostilt_common::empty_call_bool_resultResponse
  (:init
   (&key
    ((:result __result) nil)
    )
   (send-super :init)
   (setq _result __result)
   self)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; bool _result
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _result
       (if _result (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _result
     (setq _result (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass robostilt_common::empty_call_bool_result
  :super ros::object
  :slots ())

(setf (get robostilt_common::empty_call_bool_result :md5sum-) "eb13ac1f1354ccecb7941ee8fa2192e8")
(setf (get robostilt_common::empty_call_bool_result :datatype-) "robostilt_common/empty_call_bool_result")
(setf (get robostilt_common::empty_call_bool_result :request) robostilt_common::empty_call_bool_resultRequest)
(setf (get robostilt_common::empty_call_bool_result :response) robostilt_common::empty_call_bool_resultResponse)

(defmethod robostilt_common::empty_call_bool_resultRequest
  (:response () (instance robostilt_common::empty_call_bool_resultResponse :init)))

(setf (get robostilt_common::empty_call_bool_resultRequest :md5sum-) "eb13ac1f1354ccecb7941ee8fa2192e8")
(setf (get robostilt_common::empty_call_bool_resultRequest :datatype-) "robostilt_common/empty_call_bool_resultRequest")
(setf (get robostilt_common::empty_call_bool_resultRequest :definition-)
      "---
bool result
")

(setf (get robostilt_common::empty_call_bool_resultResponse :md5sum-) "eb13ac1f1354ccecb7941ee8fa2192e8")
(setf (get robostilt_common::empty_call_bool_resultResponse :datatype-) "robostilt_common/empty_call_bool_resultResponse")
(setf (get robostilt_common::empty_call_bool_resultResponse :definition-)
      "---
bool result
")



(provide :robostilt_common/empty_call_bool_result "eb13ac1f1354ccecb7941ee8fa2192e8")


