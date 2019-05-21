;; Auto-generated. Do not edit!


(when (boundp 'robostilt_common::empty_call_bool_Result)
  (if (not (find-package "ROBOSTILT_COMMON"))
    (make-package "ROBOSTILT_COMMON"))
  (shadow 'empty_call_bool_Result (find-package "ROBOSTILT_COMMON")))
(unless (find-package "ROBOSTILT_COMMON::EMPTY_CALL_BOOL_RESULT")
  (make-package "ROBOSTILT_COMMON::EMPTY_CALL_BOOL_RESULT"))
(unless (find-package "ROBOSTILT_COMMON::EMPTY_CALL_BOOL_RESULTREQUEST")
  (make-package "ROBOSTILT_COMMON::EMPTY_CALL_BOOL_RESULTREQUEST"))
(unless (find-package "ROBOSTILT_COMMON::EMPTY_CALL_BOOL_RESULTRESPONSE")
  (make-package "ROBOSTILT_COMMON::EMPTY_CALL_BOOL_RESULTRESPONSE"))

(in-package "ROS")





(defclass robostilt_common::empty_call_bool_ResultRequest
  :super ros::object
  :slots ())

(defmethod robostilt_common::empty_call_bool_ResultRequest
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

(defclass robostilt_common::empty_call_bool_ResultResponse
  :super ros::object
  :slots (_result ))

(defmethod robostilt_common::empty_call_bool_ResultResponse
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

(defclass robostilt_common::empty_call_bool_Result
  :super ros::object
  :slots ())

(setf (get robostilt_common::empty_call_bool_Result :md5sum-) "eb13ac1f1354ccecb7941ee8fa2192e8")
(setf (get robostilt_common::empty_call_bool_Result :datatype-) "robostilt_common/empty_call_bool_Result")
(setf (get robostilt_common::empty_call_bool_Result :request) robostilt_common::empty_call_bool_ResultRequest)
(setf (get robostilt_common::empty_call_bool_Result :response) robostilt_common::empty_call_bool_ResultResponse)

(defmethod robostilt_common::empty_call_bool_ResultRequest
  (:response () (instance robostilt_common::empty_call_bool_ResultResponse :init)))

(setf (get robostilt_common::empty_call_bool_ResultRequest :md5sum-) "eb13ac1f1354ccecb7941ee8fa2192e8")
(setf (get robostilt_common::empty_call_bool_ResultRequest :datatype-) "robostilt_common/empty_call_bool_ResultRequest")
(setf (get robostilt_common::empty_call_bool_ResultRequest :definition-)
      "---
bool result
")

(setf (get robostilt_common::empty_call_bool_ResultResponse :md5sum-) "eb13ac1f1354ccecb7941ee8fa2192e8")
(setf (get robostilt_common::empty_call_bool_ResultResponse :datatype-) "robostilt_common/empty_call_bool_ResultResponse")
(setf (get robostilt_common::empty_call_bool_ResultResponse :definition-)
      "---
bool result
")



(provide :robostilt_common/empty_call_bool_Result "eb13ac1f1354ccecb7941ee8fa2192e8")


