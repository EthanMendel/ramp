; Auto-generated. Do not edit!


(cl:in-package ramp_planner_new-msg)


;//! \htmlinclude TrajectoryRequest.msg.html

(cl:defclass <TrajectoryRequest> (roslisp-msg-protocol:ros-message)
  ((timeNeeded
    :reader timeNeeded
    :initarg :timeNeeded
    :type cl:fixnum
    :initform 0)
   (type
    :reader type
    :initarg :type
    :type cl:string
    :initform ""))
)

(cl:defclass TrajectoryRequest (<TrajectoryRequest>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TrajectoryRequest>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TrajectoryRequest)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ramp_planner_new-msg:<TrajectoryRequest> is deprecated: use ramp_planner_new-msg:TrajectoryRequest instead.")))

(cl:ensure-generic-function 'timeNeeded-val :lambda-list '(m))
(cl:defmethod timeNeeded-val ((m <TrajectoryRequest>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_planner_new-msg:timeNeeded-val is deprecated.  Use ramp_planner_new-msg:timeNeeded instead.")
  (timeNeeded m))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <TrajectoryRequest>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_planner_new-msg:type-val is deprecated.  Use ramp_planner_new-msg:type instead.")
  (type m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TrajectoryRequest>) ostream)
  "Serializes a message object of type '<TrajectoryRequest>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'timeNeeded)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'type))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'type))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TrajectoryRequest>) istream)
  "Deserializes a message object of type '<TrajectoryRequest>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'timeNeeded)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'type) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'type) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TrajectoryRequest>)))
  "Returns string type for a message object of type '<TrajectoryRequest>"
  "ramp_planner_new/TrajectoryRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrajectoryRequest)))
  "Returns string type for a message object of type 'TrajectoryRequest"
  "ramp_planner_new/TrajectoryRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TrajectoryRequest>)))
  "Returns md5sum for a message object of type '<TrajectoryRequest>"
  "3e58e2f39ce06e72daff4a24c5879f25")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TrajectoryRequest)))
  "Returns md5sum for a message object of type 'TrajectoryRequest"
  "3e58e2f39ce06e72daff4a24c5879f25")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TrajectoryRequest>)))
  "Returns full string definition for message of type '<TrajectoryRequest>"
  (cl:format cl:nil "uint8 timeNeeded~%string type~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TrajectoryRequest)))
  "Returns full string definition for message of type 'TrajectoryRequest"
  (cl:format cl:nil "uint8 timeNeeded~%string type~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TrajectoryRequest>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'type))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TrajectoryRequest>))
  "Converts a ROS message object to a list"
  (cl:list 'TrajectoryRequest
    (cl:cons ':timeNeeded (timeNeeded msg))
    (cl:cons ':type (type msg))
))
