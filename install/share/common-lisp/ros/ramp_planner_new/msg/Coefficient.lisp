; Auto-generated. Do not edit!


(cl:in-package ramp_planner_new-msg)


;//! \htmlinclude Coefficient.msg.html

(cl:defclass <Coefficient> (roslisp-msg-protocol:ros-message)
  ((values
    :reader values
    :initarg :values
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass Coefficient (<Coefficient>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Coefficient>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Coefficient)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ramp_planner_new-msg:<Coefficient> is deprecated: use ramp_planner_new-msg:Coefficient instead.")))

(cl:ensure-generic-function 'values-val :lambda-list '(m))
(cl:defmethod values-val ((m <Coefficient>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_planner_new-msg:values-val is deprecated.  Use ramp_planner_new-msg:values instead.")
  (values m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Coefficient>) ostream)
  "Serializes a message object of type '<Coefficient>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'values))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'values))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Coefficient>) istream)
  "Deserializes a message object of type '<Coefficient>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'values) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'values)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Coefficient>)))
  "Returns string type for a message object of type '<Coefficient>"
  "ramp_planner_new/Coefficient")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Coefficient)))
  "Returns string type for a message object of type 'Coefficient"
  "ramp_planner_new/Coefficient")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Coefficient>)))
  "Returns md5sum for a message object of type '<Coefficient>"
  "b9163d7c678dcd669317e43e46b63d96")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Coefficient)))
  "Returns md5sum for a message object of type 'Coefficient"
  "b9163d7c678dcd669317e43e46b63d96")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Coefficient>)))
  "Returns full string definition for message of type '<Coefficient>"
  (cl:format cl:nil "float64[] values~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Coefficient)))
  "Returns full string definition for message of type 'Coefficient"
  (cl:format cl:nil "float64[] values~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Coefficient>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'values) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Coefficient>))
  "Converts a ROS message object to a list"
  (cl:list 'Coefficient
    (cl:cons ':values (values msg))
))
