; Auto-generated. Do not edit!


(cl:in-package robostilt_common-srv)


;//! \htmlinclude empty_call_bool_result-request.msg.html

(cl:defclass <empty_call_bool_result-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass empty_call_bool_result-request (<empty_call_bool_result-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <empty_call_bool_result-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'empty_call_bool_result-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robostilt_common-srv:<empty_call_bool_result-request> is deprecated: use robostilt_common-srv:empty_call_bool_result-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <empty_call_bool_result-request>) ostream)
  "Serializes a message object of type '<empty_call_bool_result-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <empty_call_bool_result-request>) istream)
  "Deserializes a message object of type '<empty_call_bool_result-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<empty_call_bool_result-request>)))
  "Returns string type for a service object of type '<empty_call_bool_result-request>"
  "robostilt_common/empty_call_bool_resultRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'empty_call_bool_result-request)))
  "Returns string type for a service object of type 'empty_call_bool_result-request"
  "robostilt_common/empty_call_bool_resultRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<empty_call_bool_result-request>)))
  "Returns md5sum for a message object of type '<empty_call_bool_result-request>"
  "eb13ac1f1354ccecb7941ee8fa2192e8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'empty_call_bool_result-request)))
  "Returns md5sum for a message object of type 'empty_call_bool_result-request"
  "eb13ac1f1354ccecb7941ee8fa2192e8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<empty_call_bool_result-request>)))
  "Returns full string definition for message of type '<empty_call_bool_result-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'empty_call_bool_result-request)))
  "Returns full string definition for message of type 'empty_call_bool_result-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <empty_call_bool_result-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <empty_call_bool_result-request>))
  "Converts a ROS message object to a list"
  (cl:list 'empty_call_bool_result-request
))
;//! \htmlinclude empty_call_bool_result-response.msg.html

(cl:defclass <empty_call_bool_result-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass empty_call_bool_result-response (<empty_call_bool_result-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <empty_call_bool_result-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'empty_call_bool_result-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robostilt_common-srv:<empty_call_bool_result-response> is deprecated: use robostilt_common-srv:empty_call_bool_result-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <empty_call_bool_result-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-srv:result-val is deprecated.  Use robostilt_common-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <empty_call_bool_result-response>) ostream)
  "Serializes a message object of type '<empty_call_bool_result-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <empty_call_bool_result-response>) istream)
  "Deserializes a message object of type '<empty_call_bool_result-response>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<empty_call_bool_result-response>)))
  "Returns string type for a service object of type '<empty_call_bool_result-response>"
  "robostilt_common/empty_call_bool_resultResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'empty_call_bool_result-response)))
  "Returns string type for a service object of type 'empty_call_bool_result-response"
  "robostilt_common/empty_call_bool_resultResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<empty_call_bool_result-response>)))
  "Returns md5sum for a message object of type '<empty_call_bool_result-response>"
  "eb13ac1f1354ccecb7941ee8fa2192e8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'empty_call_bool_result-response)))
  "Returns md5sum for a message object of type 'empty_call_bool_result-response"
  "eb13ac1f1354ccecb7941ee8fa2192e8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<empty_call_bool_result-response>)))
  "Returns full string definition for message of type '<empty_call_bool_result-response>"
  (cl:format cl:nil "bool result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'empty_call_bool_result-response)))
  "Returns full string definition for message of type 'empty_call_bool_result-response"
  (cl:format cl:nil "bool result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <empty_call_bool_result-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <empty_call_bool_result-response>))
  "Converts a ROS message object to a list"
  (cl:list 'empty_call_bool_result-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'empty_call_bool_result)))
  'empty_call_bool_result-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'empty_call_bool_result)))
  'empty_call_bool_result-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'empty_call_bool_result)))
  "Returns string type for a service object of type '<empty_call_bool_result>"
  "robostilt_common/empty_call_bool_result")