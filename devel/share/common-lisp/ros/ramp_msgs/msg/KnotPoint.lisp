; Auto-generated. Do not edit!


(cl:in-package ramp_msgs-msg)


;//! \htmlinclude KnotPoint.msg.html

(cl:defclass <KnotPoint> (roslisp-msg-protocol:ros-message)
  ((motionState
    :reader motionState
    :initarg :motionState
    :type ramp_msgs-msg:MotionState
    :initform (cl:make-instance 'ramp_msgs-msg:MotionState))
   (stopTime
    :reader stopTime
    :initarg :stopTime
    :type cl:integer
    :initform 0))
)

(cl:defclass KnotPoint (<KnotPoint>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <KnotPoint>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'KnotPoint)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ramp_msgs-msg:<KnotPoint> is deprecated: use ramp_msgs-msg:KnotPoint instead.")))

(cl:ensure-generic-function 'motionState-val :lambda-list '(m))
(cl:defmethod motionState-val ((m <KnotPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-msg:motionState-val is deprecated.  Use ramp_msgs-msg:motionState instead.")
  (motionState m))

(cl:ensure-generic-function 'stopTime-val :lambda-list '(m))
(cl:defmethod stopTime-val ((m <KnotPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-msg:stopTime-val is deprecated.  Use ramp_msgs-msg:stopTime instead.")
  (stopTime m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <KnotPoint>) ostream)
  "Serializes a message object of type '<KnotPoint>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'motionState) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'stopTime)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'stopTime)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'stopTime)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'stopTime)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <KnotPoint>) istream)
  "Deserializes a message object of type '<KnotPoint>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'motionState) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'stopTime)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'stopTime)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'stopTime)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'stopTime)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<KnotPoint>)))
  "Returns string type for a message object of type '<KnotPoint>"
  "ramp_msgs/KnotPoint")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'KnotPoint)))
  "Returns string type for a message object of type 'KnotPoint"
  "ramp_msgs/KnotPoint")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<KnotPoint>)))
  "Returns md5sum for a message object of type '<KnotPoint>"
  "003814a67ae1dae25c6ac938e801efe5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'KnotPoint)))
  "Returns md5sum for a message object of type 'KnotPoint"
  "003814a67ae1dae25c6ac938e801efe5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<KnotPoint>)))
  "Returns full string definition for message of type '<KnotPoint>"
  (cl:format cl:nil "ramp_msgs/MotionState motionState~%uint32 stopTime~%~%================================================================================~%MSG: ramp_msgs/MotionState~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] jerks~%~%# change to duration~%float64 time~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'KnotPoint)))
  "Returns full string definition for message of type 'KnotPoint"
  (cl:format cl:nil "ramp_msgs/MotionState motionState~%uint32 stopTime~%~%================================================================================~%MSG: ramp_msgs/MotionState~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] jerks~%~%# change to duration~%float64 time~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <KnotPoint>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'motionState))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <KnotPoint>))
  "Converts a ROS message object to a list"
  (cl:list 'KnotPoint
    (cl:cons ':motionState (motionState msg))
    (cl:cons ':stopTime (stopTime msg))
))
