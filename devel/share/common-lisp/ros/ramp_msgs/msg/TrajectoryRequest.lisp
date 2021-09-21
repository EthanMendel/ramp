; Auto-generated. Do not edit!


(cl:in-package ramp_msgs-msg)


;//! \htmlinclude TrajectoryRequest.msg.html

(cl:defclass <TrajectoryRequest> (roslisp-msg-protocol:ros-message)
  ((path
    :reader path
    :initarg :path
    :type ramp_msgs-msg:Path
    :initform (cl:make-instance 'ramp_msgs-msg:Path))
   (type
    :reader type
    :initarg :type
    :type cl:fixnum
    :initform 0)
   (print
    :reader print
    :initarg :print
    :type cl:boolean
    :initform cl:nil)
   (bezierCurves
    :reader bezierCurves
    :initarg :bezierCurves
    :type (cl:vector ramp_msgs-msg:BezierCurve)
   :initform (cl:make-array 0 :element-type 'ramp_msgs-msg:BezierCurve :initial-element (cl:make-instance 'ramp_msgs-msg:BezierCurve)))
   (segments
    :reader segments
    :initarg :segments
    :type cl:fixnum
    :initform 0))
)

(cl:defclass TrajectoryRequest (<TrajectoryRequest>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TrajectoryRequest>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TrajectoryRequest)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ramp_msgs-msg:<TrajectoryRequest> is deprecated: use ramp_msgs-msg:TrajectoryRequest instead.")))

(cl:ensure-generic-function 'path-val :lambda-list '(m))
(cl:defmethod path-val ((m <TrajectoryRequest>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-msg:path-val is deprecated.  Use ramp_msgs-msg:path instead.")
  (path m))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <TrajectoryRequest>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-msg:type-val is deprecated.  Use ramp_msgs-msg:type instead.")
  (type m))

(cl:ensure-generic-function 'print-val :lambda-list '(m))
(cl:defmethod print-val ((m <TrajectoryRequest>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-msg:print-val is deprecated.  Use ramp_msgs-msg:print instead.")
  (print m))

(cl:ensure-generic-function 'bezierCurves-val :lambda-list '(m))
(cl:defmethod bezierCurves-val ((m <TrajectoryRequest>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-msg:bezierCurves-val is deprecated.  Use ramp_msgs-msg:bezierCurves instead.")
  (bezierCurves m))

(cl:ensure-generic-function 'segments-val :lambda-list '(m))
(cl:defmethod segments-val ((m <TrajectoryRequest>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-msg:segments-val is deprecated.  Use ramp_msgs-msg:segments instead.")
  (segments m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TrajectoryRequest>) ostream)
  "Serializes a message object of type '<TrajectoryRequest>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'path) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'print) 1 0)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'bezierCurves))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'bezierCurves))
  (cl:let* ((signed (cl:slot-value msg 'segments)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TrajectoryRequest>) istream)
  "Deserializes a message object of type '<TrajectoryRequest>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'path) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'print) (cl:not (cl:zerop (cl:read-byte istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'bezierCurves) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'bezierCurves)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'ramp_msgs-msg:BezierCurve))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'segments) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TrajectoryRequest>)))
  "Returns string type for a message object of type '<TrajectoryRequest>"
  "ramp_msgs/TrajectoryRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrajectoryRequest)))
  "Returns string type for a message object of type 'TrajectoryRequest"
  "ramp_msgs/TrajectoryRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TrajectoryRequest>)))
  "Returns md5sum for a message object of type '<TrajectoryRequest>"
  "90b320ee1b26415bfc5a720e57c91cb0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TrajectoryRequest)))
  "Returns md5sum for a message object of type 'TrajectoryRequest"
  "90b320ee1b26415bfc5a720e57c91cb0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TrajectoryRequest>)))
  "Returns full string definition for message of type '<TrajectoryRequest>"
  (cl:format cl:nil "ramp_msgs/Path path~%uint8 type ~%bool print~%ramp_msgs/BezierCurve[] bezierCurves~%int8 segments~%~%================================================================================~%MSG: ramp_msgs/Path~%ramp_msgs/KnotPoint[] points~%~%================================================================================~%MSG: ramp_msgs/KnotPoint~%ramp_msgs/MotionState motionState~%uint32 stopTime~%~%================================================================================~%MSG: ramp_msgs/MotionState~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] jerks~%~%# change to duration~%float64 time~%~%================================================================================~%MSG: ramp_msgs/BezierCurve~%Header header~%~%ramp_msgs/MotionState[] points~%float64[] u_values~%~%ramp_msgs/MotionState[] segmentPoints~%ramp_msgs/MotionState[] controlPoints~%~%float64 l~%ramp_msgs/MotionState ms_maxVA~%ramp_msgs/MotionState ms_initialVA~%ramp_msgs/MotionState ms_begin~%float64 u_0~%float64 u_dot_0~%float64 u_dot_max~%float64 u_target~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TrajectoryRequest)))
  "Returns full string definition for message of type 'TrajectoryRequest"
  (cl:format cl:nil "ramp_msgs/Path path~%uint8 type ~%bool print~%ramp_msgs/BezierCurve[] bezierCurves~%int8 segments~%~%================================================================================~%MSG: ramp_msgs/Path~%ramp_msgs/KnotPoint[] points~%~%================================================================================~%MSG: ramp_msgs/KnotPoint~%ramp_msgs/MotionState motionState~%uint32 stopTime~%~%================================================================================~%MSG: ramp_msgs/MotionState~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] jerks~%~%# change to duration~%float64 time~%~%================================================================================~%MSG: ramp_msgs/BezierCurve~%Header header~%~%ramp_msgs/MotionState[] points~%float64[] u_values~%~%ramp_msgs/MotionState[] segmentPoints~%ramp_msgs/MotionState[] controlPoints~%~%float64 l~%ramp_msgs/MotionState ms_maxVA~%ramp_msgs/MotionState ms_initialVA~%ramp_msgs/MotionState ms_begin~%float64 u_0~%float64 u_dot_0~%float64 u_dot_max~%float64 u_target~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TrajectoryRequest>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'path))
     1
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'bezierCurves) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TrajectoryRequest>))
  "Converts a ROS message object to a list"
  (cl:list 'TrajectoryRequest
    (cl:cons ':path (path msg))
    (cl:cons ':type (type msg))
    (cl:cons ':print (print msg))
    (cl:cons ':bezierCurves (bezierCurves msg))
    (cl:cons ':segments (segments msg))
))
