; Auto-generated. Do not edit!


(cl:in-package robostilt_common-srv)


;//! \htmlinclude SetSupportingLegs-request.msg.html

(cl:defclass <SetSupportingLegs-request> (roslisp-msg-protocol:ros-message)
  ((indexes
    :reader indexes
    :initarg :indexes
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (is_supporting_weight
    :reader is_supporting_weight
    :initarg :is_supporting_weight
    :type (cl:vector cl:boolean)
   :initform (cl:make-array 0 :element-type 'cl:boolean :initial-element cl:nil)))
)

(cl:defclass SetSupportingLegs-request (<SetSupportingLegs-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetSupportingLegs-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetSupportingLegs-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robostilt_common-srv:<SetSupportingLegs-request> is deprecated: use robostilt_common-srv:SetSupportingLegs-request instead.")))

(cl:ensure-generic-function 'indexes-val :lambda-list '(m))
(cl:defmethod indexes-val ((m <SetSupportingLegs-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-srv:indexes-val is deprecated.  Use robostilt_common-srv:indexes instead.")
  (indexes m))

(cl:ensure-generic-function 'is_supporting_weight-val :lambda-list '(m))
(cl:defmethod is_supporting_weight-val ((m <SetSupportingLegs-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-srv:is_supporting_weight-val is deprecated.  Use robostilt_common-srv:is_supporting_weight instead.")
  (is_supporting_weight m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetSupportingLegs-request>) ostream)
  "Serializes a message object of type '<SetSupportingLegs-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'indexes))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'indexes))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'is_supporting_weight))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if ele 1 0)) ostream))
   (cl:slot-value msg 'is_supporting_weight))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetSupportingLegs-request>) istream)
  "Deserializes a message object of type '<SetSupportingLegs-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'indexes) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'indexes)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'is_supporting_weight) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'is_supporting_weight)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:not (cl:zerop (cl:read-byte istream)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetSupportingLegs-request>)))
  "Returns string type for a service object of type '<SetSupportingLegs-request>"
  "robostilt_common/SetSupportingLegsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetSupportingLegs-request)))
  "Returns string type for a service object of type 'SetSupportingLegs-request"
  "robostilt_common/SetSupportingLegsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetSupportingLegs-request>)))
  "Returns md5sum for a message object of type '<SetSupportingLegs-request>"
  "7f54c2f8a83517db50c6f0cbd59094f8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetSupportingLegs-request)))
  "Returns md5sum for a message object of type 'SetSupportingLegs-request"
  "7f54c2f8a83517db50c6f0cbd59094f8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetSupportingLegs-request>)))
  "Returns full string definition for message of type '<SetSupportingLegs-request>"
  (cl:format cl:nil "int32[] indexes~%bool[] is_supporting_weight~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetSupportingLegs-request)))
  "Returns full string definition for message of type 'SetSupportingLegs-request"
  (cl:format cl:nil "int32[] indexes~%bool[] is_supporting_weight~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetSupportingLegs-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'indexes) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'is_supporting_weight) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetSupportingLegs-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetSupportingLegs-request
    (cl:cons ':indexes (indexes msg))
    (cl:cons ':is_supporting_weight (is_supporting_weight msg))
))
;//! \htmlinclude SetSupportingLegs-response.msg.html

(cl:defclass <SetSupportingLegs-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SetSupportingLegs-response (<SetSupportingLegs-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetSupportingLegs-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetSupportingLegs-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robostilt_common-srv:<SetSupportingLegs-response> is deprecated: use robostilt_common-srv:SetSupportingLegs-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetSupportingLegs-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-srv:success-val is deprecated.  Use robostilt_common-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetSupportingLegs-response>) ostream)
  "Serializes a message object of type '<SetSupportingLegs-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetSupportingLegs-response>) istream)
  "Deserializes a message object of type '<SetSupportingLegs-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetSupportingLegs-response>)))
  "Returns string type for a service object of type '<SetSupportingLegs-response>"
  "robostilt_common/SetSupportingLegsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetSupportingLegs-response)))
  "Returns string type for a service object of type 'SetSupportingLegs-response"
  "robostilt_common/SetSupportingLegsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetSupportingLegs-response>)))
  "Returns md5sum for a message object of type '<SetSupportingLegs-response>"
  "7f54c2f8a83517db50c6f0cbd59094f8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetSupportingLegs-response)))
  "Returns md5sum for a message object of type 'SetSupportingLegs-response"
  "7f54c2f8a83517db50c6f0cbd59094f8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetSupportingLegs-response>)))
  "Returns full string definition for message of type '<SetSupportingLegs-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetSupportingLegs-response)))
  "Returns full string definition for message of type 'SetSupportingLegs-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetSupportingLegs-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetSupportingLegs-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetSupportingLegs-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetSupportingLegs)))
  'SetSupportingLegs-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetSupportingLegs)))
  'SetSupportingLegs-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetSupportingLegs)))
  "Returns string type for a service object of type '<SetSupportingLegs>"
  "robostilt_common/SetSupportingLegs")