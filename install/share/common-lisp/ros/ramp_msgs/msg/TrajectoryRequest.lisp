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
    :initform 0)
   (max_speed_linear
    :reader max_speed_linear
    :initarg :max_speed_linear
    :type cl:float
    :initform 0.0)
   (max_speed_angular
    :reader max_speed_angular
    :initarg :max_speed_angular
    :type cl:float
    :initform 0.0)
   (sl_traj
    :reader sl_traj
    :initarg :sl_traj
    :type cl:boolean
    :initform cl:nil)
   (sl_final_speed
    :reader sl_final_speed
    :initarg :sl_final_speed
    :type cl:float
    :initform 0.0)
   (sl_init_dur
    :reader sl_init_dur
    :initarg :sl_init_dur
    :type cl:real
    :initform 0)
   (sl_final_dur
    :reader sl_final_dur
    :initarg :sl_final_dur
    :type cl:real
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

(cl:ensure-generic-function 'max_speed_linear-val :lambda-list '(m))
(cl:defmethod max_speed_linear-val ((m <TrajectoryRequest>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-msg:max_speed_linear-val is deprecated.  Use ramp_msgs-msg:max_speed_linear instead.")
  (max_speed_linear m))

(cl:ensure-generic-function 'max_speed_angular-val :lambda-list '(m))
(cl:defmethod max_speed_angular-val ((m <TrajectoryRequest>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-msg:max_speed_angular-val is deprecated.  Use ramp_msgs-msg:max_speed_angular instead.")
  (max_speed_angular m))

(cl:ensure-generic-function 'sl_traj-val :lambda-list '(m))
(cl:defmethod sl_traj-val ((m <TrajectoryRequest>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-msg:sl_traj-val is deprecated.  Use ramp_msgs-msg:sl_traj instead.")
  (sl_traj m))

(cl:ensure-generic-function 'sl_final_speed-val :lambda-list '(m))
(cl:defmethod sl_final_speed-val ((m <TrajectoryRequest>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-msg:sl_final_speed-val is deprecated.  Use ramp_msgs-msg:sl_final_speed instead.")
  (sl_final_speed m))

(cl:ensure-generic-function 'sl_init_dur-val :lambda-list '(m))
(cl:defmethod sl_init_dur-val ((m <TrajectoryRequest>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-msg:sl_init_dur-val is deprecated.  Use ramp_msgs-msg:sl_init_dur instead.")
  (sl_init_dur m))

(cl:ensure-generic-function 'sl_final_dur-val :lambda-list '(m))
(cl:defmethod sl_final_dur-val ((m <TrajectoryRequest>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-msg:sl_final_dur-val is deprecated.  Use ramp_msgs-msg:sl_final_dur instead.")
  (sl_final_dur m))
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
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'max_speed_linear))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'max_speed_angular))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'sl_traj) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'sl_final_speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'sl_init_dur)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'sl_init_dur) (cl:floor (cl:slot-value msg 'sl_init_dur)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'sl_final_dur)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'sl_final_dur) (cl:floor (cl:slot-value msg 'sl_final_dur)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
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
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_speed_linear) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_speed_angular) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:slot-value msg 'sl_traj) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'sl_final_speed) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sl_init_dur) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sl_final_dur) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
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
  "ad9619205ac6cad901fa5450a41bd191")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TrajectoryRequest)))
  "Returns md5sum for a message object of type 'TrajectoryRequest"
  "ad9619205ac6cad901fa5450a41bd191")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TrajectoryRequest>)))
  "Returns full string definition for message of type '<TrajectoryRequest>"
  (cl:format cl:nil "ramp_msgs/Path path~%uint8 type ~%bool print~%ramp_msgs/BezierCurve[] bezierCurves~%int8 segments~%float64 max_speed_linear~%float64 max_speed_angular~%~%# For system-level test generation...~%bool sl_traj~%float64 sl_final_speed~%duration sl_init_dur~%duration sl_final_dur~%~%================================================================================~%MSG: ramp_msgs/Path~%ramp_msgs/KnotPoint[] points~%~%================================================================================~%MSG: ramp_msgs/KnotPoint~%ramp_msgs/MotionState motionState~%uint32 stopTime~%~%================================================================================~%MSG: ramp_msgs/MotionState~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] jerks~%~%# change to duration~%float64 time~%~%================================================================================~%MSG: ramp_msgs/BezierCurve~%Header header~%~%ramp_msgs/MotionState[] points~%float64[] u_values~%~%ramp_msgs/MotionState[] segmentPoints~%ramp_msgs/MotionState[] controlPoints~%~%float64 l~%ramp_msgs/MotionState ms_maxVA~%ramp_msgs/MotionState ms_initialVA~%ramp_msgs/MotionState ms_begin~%float64 u_0~%float64 u_dot_0~%float64 u_dot_max~%float64 u_target~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TrajectoryRequest)))
  "Returns full string definition for message of type 'TrajectoryRequest"
  (cl:format cl:nil "ramp_msgs/Path path~%uint8 type ~%bool print~%ramp_msgs/BezierCurve[] bezierCurves~%int8 segments~%float64 max_speed_linear~%float64 max_speed_angular~%~%# For system-level test generation...~%bool sl_traj~%float64 sl_final_speed~%duration sl_init_dur~%duration sl_final_dur~%~%================================================================================~%MSG: ramp_msgs/Path~%ramp_msgs/KnotPoint[] points~%~%================================================================================~%MSG: ramp_msgs/KnotPoint~%ramp_msgs/MotionState motionState~%uint32 stopTime~%~%================================================================================~%MSG: ramp_msgs/MotionState~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] jerks~%~%# change to duration~%float64 time~%~%================================================================================~%MSG: ramp_msgs/BezierCurve~%Header header~%~%ramp_msgs/MotionState[] points~%float64[] u_values~%~%ramp_msgs/MotionState[] segmentPoints~%ramp_msgs/MotionState[] controlPoints~%~%float64 l~%ramp_msgs/MotionState ms_maxVA~%ramp_msgs/MotionState ms_initialVA~%ramp_msgs/MotionState ms_begin~%float64 u_0~%float64 u_dot_0~%float64 u_dot_max~%float64 u_target~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TrajectoryRequest>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'path))
     1
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'bezierCurves) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     1
     8
     8
     1
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TrajectoryRequest>))
  "Converts a ROS message object to a list"
  (cl:list 'TrajectoryRequest
    (cl:cons ':path (path msg))
    (cl:cons ':type (type msg))
    (cl:cons ':print (print msg))
    (cl:cons ':bezierCurves (bezierCurves msg))
    (cl:cons ':segments (segments msg))
    (cl:cons ':max_speed_linear (max_speed_linear msg))
    (cl:cons ':max_speed_angular (max_speed_angular msg))
    (cl:cons ':sl_traj (sl_traj msg))
    (cl:cons ':sl_final_speed (sl_final_speed msg))
    (cl:cons ':sl_init_dur (sl_init_dur msg))
    (cl:cons ':sl_final_dur (sl_final_dur msg))
))
