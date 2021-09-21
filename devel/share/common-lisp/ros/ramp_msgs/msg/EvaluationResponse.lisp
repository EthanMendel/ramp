; Auto-generated. Do not edit!


(cl:in-package ramp_msgs-msg)


;//! \htmlinclude EvaluationResponse.msg.html

(cl:defclass <EvaluationResponse> (roslisp-msg-protocol:ros-message)
  ((fitness
    :reader fitness
    :initarg :fitness
    :type cl:float
    :initform 0.0)
   (feasible
    :reader feasible
    :initarg :feasible
    :type cl:boolean
    :initform cl:nil)
   (t_firstCollision
    :reader t_firstCollision
    :initarg :t_firstCollision
    :type cl:real
    :initform 0))
)

(cl:defclass EvaluationResponse (<EvaluationResponse>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EvaluationResponse>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EvaluationResponse)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ramp_msgs-msg:<EvaluationResponse> is deprecated: use ramp_msgs-msg:EvaluationResponse instead.")))

(cl:ensure-generic-function 'fitness-val :lambda-list '(m))
(cl:defmethod fitness-val ((m <EvaluationResponse>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-msg:fitness-val is deprecated.  Use ramp_msgs-msg:fitness instead.")
  (fitness m))

(cl:ensure-generic-function 'feasible-val :lambda-list '(m))
(cl:defmethod feasible-val ((m <EvaluationResponse>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-msg:feasible-val is deprecated.  Use ramp_msgs-msg:feasible instead.")
  (feasible m))

(cl:ensure-generic-function 't_firstCollision-val :lambda-list '(m))
(cl:defmethod t_firstCollision-val ((m <EvaluationResponse>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-msg:t_firstCollision-val is deprecated.  Use ramp_msgs-msg:t_firstCollision instead.")
  (t_firstCollision m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EvaluationResponse>) ostream)
  "Serializes a message object of type '<EvaluationResponse>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'fitness))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'feasible) 1 0)) ostream)
  (cl:let ((__sec (cl:floor (cl:slot-value msg 't_firstCollision)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 't_firstCollision) (cl:floor (cl:slot-value msg 't_firstCollision)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EvaluationResponse>) istream)
  "Deserializes a message object of type '<EvaluationResponse>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'fitness) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:slot-value msg 'feasible) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 't_firstCollision) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EvaluationResponse>)))
  "Returns string type for a message object of type '<EvaluationResponse>"
  "ramp_msgs/EvaluationResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EvaluationResponse)))
  "Returns string type for a message object of type 'EvaluationResponse"
  "ramp_msgs/EvaluationResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EvaluationResponse>)))
  "Returns md5sum for a message object of type '<EvaluationResponse>"
  "f964edf11b680c3f41b2a601ea124cac")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EvaluationResponse)))
  "Returns md5sum for a message object of type 'EvaluationResponse"
  "f964edf11b680c3f41b2a601ea124cac")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EvaluationResponse>)))
  "Returns full string definition for message of type '<EvaluationResponse>"
  (cl:format cl:nil "float64 fitness~%bool feasible~%duration t_firstCollision~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EvaluationResponse)))
  "Returns full string definition for message of type 'EvaluationResponse"
  (cl:format cl:nil "float64 fitness~%bool feasible~%duration t_firstCollision~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EvaluationResponse>))
  (cl:+ 0
     8
     1
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EvaluationResponse>))
  "Converts a ROS message object to a list"
  (cl:list 'EvaluationResponse
    (cl:cons ':fitness (fitness msg))
    (cl:cons ':feasible (feasible msg))
    (cl:cons ':t_firstCollision (t_firstCollision msg))
))
