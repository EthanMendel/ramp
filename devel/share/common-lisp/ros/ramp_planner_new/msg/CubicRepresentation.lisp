; Auto-generated. Do not edit!


(cl:in-package ramp_planner_new-msg)


;//! \htmlinclude CubicRepresentation.msg.html

(cl:defclass <CubicRepresentation> (roslisp-msg-protocol:ros-message)
  ((order
    :reader order
    :initarg :order
    :type cl:integer
    :initform 0)
   (numDOF
    :reader numDOF
    :initarg :numDOF
    :type cl:integer
    :initform 0)
   (coefficients
    :reader coefficients
    :initarg :coefficients
    :type (cl:vector ramp_planner_new-msg:Coefficient)
   :initform (cl:make-array 0 :element-type 'ramp_planner_new-msg:Coefficient :initial-element (cl:make-instance 'ramp_planner_new-msg:Coefficient)))
   (resolution
    :reader resolution
    :initarg :resolution
    :type cl:float
    :initform 0.0)
   (active
    :reader active
    :initarg :active
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass CubicRepresentation (<CubicRepresentation>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CubicRepresentation>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CubicRepresentation)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ramp_planner_new-msg:<CubicRepresentation> is deprecated: use ramp_planner_new-msg:CubicRepresentation instead.")))

(cl:ensure-generic-function 'order-val :lambda-list '(m))
(cl:defmethod order-val ((m <CubicRepresentation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_planner_new-msg:order-val is deprecated.  Use ramp_planner_new-msg:order instead.")
  (order m))

(cl:ensure-generic-function 'numDOF-val :lambda-list '(m))
(cl:defmethod numDOF-val ((m <CubicRepresentation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_planner_new-msg:numDOF-val is deprecated.  Use ramp_planner_new-msg:numDOF instead.")
  (numDOF m))

(cl:ensure-generic-function 'coefficients-val :lambda-list '(m))
(cl:defmethod coefficients-val ((m <CubicRepresentation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_planner_new-msg:coefficients-val is deprecated.  Use ramp_planner_new-msg:coefficients instead.")
  (coefficients m))

(cl:ensure-generic-function 'resolution-val :lambda-list '(m))
(cl:defmethod resolution-val ((m <CubicRepresentation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_planner_new-msg:resolution-val is deprecated.  Use ramp_planner_new-msg:resolution instead.")
  (resolution m))

(cl:ensure-generic-function 'active-val :lambda-list '(m))
(cl:defmethod active-val ((m <CubicRepresentation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_planner_new-msg:active-val is deprecated.  Use ramp_planner_new-msg:active instead.")
  (active m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CubicRepresentation>) ostream)
  "Serializes a message object of type '<CubicRepresentation>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'order)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'order)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'order)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'order)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'numDOF)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'numDOF)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'numDOF)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'numDOF)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'coefficients))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'coefficients))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'resolution))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'active) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CubicRepresentation>) istream)
  "Deserializes a message object of type '<CubicRepresentation>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'order)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'order)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'order)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'order)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'numDOF)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'numDOF)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'numDOF)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'numDOF)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'coefficients) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'coefficients)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'ramp_planner_new-msg:Coefficient))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'resolution) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:slot-value msg 'active) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CubicRepresentation>)))
  "Returns string type for a message object of type '<CubicRepresentation>"
  "ramp_planner_new/CubicRepresentation")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CubicRepresentation)))
  "Returns string type for a message object of type 'CubicRepresentation"
  "ramp_planner_new/CubicRepresentation")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CubicRepresentation>)))
  "Returns md5sum for a message object of type '<CubicRepresentation>"
  "c2d1d9a1b08eb916588f476cba8feed3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CubicRepresentation)))
  "Returns md5sum for a message object of type 'CubicRepresentation"
  "c2d1d9a1b08eb916588f476cba8feed3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CubicRepresentation>)))
  "Returns full string definition for message of type '<CubicRepresentation>"
  (cl:format cl:nil "uint32 order~%uint32 numDOF~%ramp_planner_new/Coefficient[] coefficients~%float64 resolution~%bool active~%================================================================================~%MSG: ramp_planner_new/Coefficient~%float64[] values~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CubicRepresentation)))
  "Returns full string definition for message of type 'CubicRepresentation"
  (cl:format cl:nil "uint32 order~%uint32 numDOF~%ramp_planner_new/Coefficient[] coefficients~%float64 resolution~%bool active~%================================================================================~%MSG: ramp_planner_new/Coefficient~%float64[] values~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CubicRepresentation>))
  (cl:+ 0
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'coefficients) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     8
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CubicRepresentation>))
  "Converts a ROS message object to a list"
  (cl:list 'CubicRepresentation
    (cl:cons ':order (order msg))
    (cl:cons ':numDOF (numDOF msg))
    (cl:cons ':coefficients (coefficients msg))
    (cl:cons ':resolution (resolution msg))
    (cl:cons ':active (active msg))
))
