; Auto-generated. Do not edit!


(cl:in-package ramp_msgs-msg)


;//! \htmlinclude CircleGroup.msg.html

(cl:defclass <CircleGroup> (roslisp-msg-protocol:ros-message)
  ((fitCir
    :reader fitCir
    :initarg :fitCir
    :type ramp_msgs-msg:Circle
    :initform (cl:make-instance 'ramp_msgs-msg:Circle))
   (packedCirs
    :reader packedCirs
    :initarg :packedCirs
    :type (cl:vector ramp_msgs-msg:Circle)
   :initform (cl:make-array 0 :element-type 'ramp_msgs-msg:Circle :initial-element (cl:make-instance 'ramp_msgs-msg:Circle))))
)

(cl:defclass CircleGroup (<CircleGroup>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CircleGroup>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CircleGroup)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ramp_msgs-msg:<CircleGroup> is deprecated: use ramp_msgs-msg:CircleGroup instead.")))

(cl:ensure-generic-function 'fitCir-val :lambda-list '(m))
(cl:defmethod fitCir-val ((m <CircleGroup>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-msg:fitCir-val is deprecated.  Use ramp_msgs-msg:fitCir instead.")
  (fitCir m))

(cl:ensure-generic-function 'packedCirs-val :lambda-list '(m))
(cl:defmethod packedCirs-val ((m <CircleGroup>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-msg:packedCirs-val is deprecated.  Use ramp_msgs-msg:packedCirs instead.")
  (packedCirs m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CircleGroup>) ostream)
  "Serializes a message object of type '<CircleGroup>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'fitCir) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'packedCirs))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'packedCirs))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CircleGroup>) istream)
  "Deserializes a message object of type '<CircleGroup>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'fitCir) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'packedCirs) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'packedCirs)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'ramp_msgs-msg:Circle))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CircleGroup>)))
  "Returns string type for a message object of type '<CircleGroup>"
  "ramp_msgs/CircleGroup")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CircleGroup)))
  "Returns string type for a message object of type 'CircleGroup"
  "ramp_msgs/CircleGroup")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CircleGroup>)))
  "Returns md5sum for a message object of type '<CircleGroup>"
  "9a0c5849cc79a80224d0f73cc03d9dab")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CircleGroup)))
  "Returns md5sum for a message object of type 'CircleGroup"
  "9a0c5849cc79a80224d0f73cc03d9dab")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CircleGroup>)))
  "Returns full string definition for message of type '<CircleGroup>"
  (cl:format cl:nil "ramp_msgs/Circle fitCir~%ramp_msgs/Circle[] packedCirs~%~%================================================================================~%MSG: ramp_msgs/Circle~%geometry_msgs/Vector3 center~%float64 radius~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CircleGroup)))
  "Returns full string definition for message of type 'CircleGroup"
  (cl:format cl:nil "ramp_msgs/Circle fitCir~%ramp_msgs/Circle[] packedCirs~%~%================================================================================~%MSG: ramp_msgs/Circle~%geometry_msgs/Vector3 center~%float64 radius~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CircleGroup>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'fitCir))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'packedCirs) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CircleGroup>))
  "Converts a ROS message object to a list"
  (cl:list 'CircleGroup
    (cl:cons ':fitCir (fitCir msg))
    (cl:cons ':packedCirs (packedCirs msg))
))
