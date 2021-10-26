; Auto-generated. Do not edit!


(cl:in-package ramp_msgs-msg)


;//! \htmlinclude RampTrajectory.msg.html

(cl:defclass <RampTrajectory> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0)
   (trajectory
    :reader trajectory
    :initarg :trajectory
    :type trajectory_msgs-msg:JointTrajectory
    :initform (cl:make-instance 'trajectory_msgs-msg:JointTrajectory))
   (i_knotPoints
    :reader i_knotPoints
    :initarg :i_knotPoints
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0))
   (curves
    :reader curves
    :initarg :curves
    :type (cl:vector ramp_msgs-msg:BezierCurve)
   :initform (cl:make-array 0 :element-type 'ramp_msgs-msg:BezierCurve :initial-element (cl:make-instance 'ramp_msgs-msg:BezierCurve)))
   (holonomic_path
    :reader holonomic_path
    :initarg :holonomic_path
    :type ramp_msgs-msg:Path
    :initform (cl:make-instance 'ramp_msgs-msg:Path))
   (feasible
    :reader feasible
    :initarg :feasible
    :type cl:boolean
    :initform cl:nil)
   (fitness
    :reader fitness
    :initarg :fitness
    :type cl:float
    :initform 0.0)
   (t_firstCollision
    :reader t_firstCollision
    :initarg :t_firstCollision
    :type cl:real
    :initform 0)
   (i_subPopulation
    :reader i_subPopulation
    :initarg :i_subPopulation
    :type cl:fixnum
    :initform 0)
   (t_start
    :reader t_start
    :initarg :t_start
    :type cl:real
    :initform 0))
)

(cl:defclass RampTrajectory (<RampTrajectory>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RampTrajectory>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RampTrajectory)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ramp_msgs-msg:<RampTrajectory> is deprecated: use ramp_msgs-msg:RampTrajectory instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <RampTrajectory>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-msg:header-val is deprecated.  Use ramp_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <RampTrajectory>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-msg:id-val is deprecated.  Use ramp_msgs-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'trajectory-val :lambda-list '(m))
(cl:defmethod trajectory-val ((m <RampTrajectory>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-msg:trajectory-val is deprecated.  Use ramp_msgs-msg:trajectory instead.")
  (trajectory m))

(cl:ensure-generic-function 'i_knotPoints-val :lambda-list '(m))
(cl:defmethod i_knotPoints-val ((m <RampTrajectory>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-msg:i_knotPoints-val is deprecated.  Use ramp_msgs-msg:i_knotPoints instead.")
  (i_knotPoints m))

(cl:ensure-generic-function 'curves-val :lambda-list '(m))
(cl:defmethod curves-val ((m <RampTrajectory>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-msg:curves-val is deprecated.  Use ramp_msgs-msg:curves instead.")
  (curves m))

(cl:ensure-generic-function 'holonomic_path-val :lambda-list '(m))
(cl:defmethod holonomic_path-val ((m <RampTrajectory>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-msg:holonomic_path-val is deprecated.  Use ramp_msgs-msg:holonomic_path instead.")
  (holonomic_path m))

(cl:ensure-generic-function 'feasible-val :lambda-list '(m))
(cl:defmethod feasible-val ((m <RampTrajectory>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-msg:feasible-val is deprecated.  Use ramp_msgs-msg:feasible instead.")
  (feasible m))

(cl:ensure-generic-function 'fitness-val :lambda-list '(m))
(cl:defmethod fitness-val ((m <RampTrajectory>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-msg:fitness-val is deprecated.  Use ramp_msgs-msg:fitness instead.")
  (fitness m))

(cl:ensure-generic-function 't_firstCollision-val :lambda-list '(m))
(cl:defmethod t_firstCollision-val ((m <RampTrajectory>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-msg:t_firstCollision-val is deprecated.  Use ramp_msgs-msg:t_firstCollision instead.")
  (t_firstCollision m))

(cl:ensure-generic-function 'i_subPopulation-val :lambda-list '(m))
(cl:defmethod i_subPopulation-val ((m <RampTrajectory>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-msg:i_subPopulation-val is deprecated.  Use ramp_msgs-msg:i_subPopulation instead.")
  (i_subPopulation m))

(cl:ensure-generic-function 't_start-val :lambda-list '(m))
(cl:defmethod t_start-val ((m <RampTrajectory>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-msg:t_start-val is deprecated.  Use ramp_msgs-msg:t_start instead.")
  (t_start m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RampTrajectory>) ostream)
  "Serializes a message object of type '<RampTrajectory>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'id)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'trajectory) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'i_knotPoints))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream))
   (cl:slot-value msg 'i_knotPoints))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'curves))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'curves))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'holonomic_path) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'feasible) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'fitness))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
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
  (cl:let* ((signed (cl:slot-value msg 'i_subPopulation)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((__sec (cl:floor (cl:slot-value msg 't_start)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 't_start) (cl:floor (cl:slot-value msg 't_start)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RampTrajectory>) istream)
  "Deserializes a message object of type '<RampTrajectory>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'id)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'trajectory) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'i_knotPoints) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'i_knotPoints)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'curves) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'curves)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'ramp_msgs-msg:BezierCurve))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'holonomic_path) istream)
    (cl:setf (cl:slot-value msg 'feasible) (cl:not (cl:zerop (cl:read-byte istream))))
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
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'i_subPopulation) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 't_start) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RampTrajectory>)))
  "Returns string type for a message object of type '<RampTrajectory>"
  "ramp_msgs/RampTrajectory")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RampTrajectory)))
  "Returns string type for a message object of type 'RampTrajectory"
  "ramp_msgs/RampTrajectory")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RampTrajectory>)))
  "Returns md5sum for a message object of type '<RampTrajectory>"
  "13d45cd502292765a8d2b315f6b3795c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RampTrajectory)))
  "Returns md5sum for a message object of type 'RampTrajectory"
  "13d45cd502292765a8d2b315f6b3795c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RampTrajectory>)))
  "Returns full string definition for message of type '<RampTrajectory>"
  (cl:format cl:nil "Header header~%uint16 id~%trajectory_msgs/JointTrajectory trajectory~%uint16[] i_knotPoints~%ramp_msgs/BezierCurve[] curves~%ramp_msgs/Path holonomic_path~%~%bool feasible~%float64 fitness~%~%duration t_firstCollision~%int8 i_subPopulation~%~%duration t_start~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectory~%Header header~%string[] joint_names~%JointTrajectoryPoint[] points~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%# Each trajectory point specifies either positions[, velocities[, accelerations]]~%# or positions[, effort] for the trajectory to be executed.~%# All specified values are in the same order as the joint names in JointTrajectory.msg~%~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] effort~%duration time_from_start~%~%================================================================================~%MSG: ramp_msgs/BezierCurve~%Header header~%~%ramp_msgs/MotionState[] points~%float64[] u_values~%~%ramp_msgs/MotionState[] segmentPoints~%ramp_msgs/MotionState[] controlPoints~%~%float64 l~%ramp_msgs/MotionState ms_maxVA~%ramp_msgs/MotionState ms_initialVA~%ramp_msgs/MotionState ms_begin~%float64 u_0~%float64 u_dot_0~%float64 u_dot_max~%float64 u_target~%~%================================================================================~%MSG: ramp_msgs/MotionState~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] jerks~%~%# change to duration~%float64 time~%~%================================================================================~%MSG: ramp_msgs/Path~%ramp_msgs/KnotPoint[] points~%~%================================================================================~%MSG: ramp_msgs/KnotPoint~%ramp_msgs/MotionState motionState~%uint32 stopTime~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RampTrajectory)))
  "Returns full string definition for message of type 'RampTrajectory"
  (cl:format cl:nil "Header header~%uint16 id~%trajectory_msgs/JointTrajectory trajectory~%uint16[] i_knotPoints~%ramp_msgs/BezierCurve[] curves~%ramp_msgs/Path holonomic_path~%~%bool feasible~%float64 fitness~%~%duration t_firstCollision~%int8 i_subPopulation~%~%duration t_start~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectory~%Header header~%string[] joint_names~%JointTrajectoryPoint[] points~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%# Each trajectory point specifies either positions[, velocities[, accelerations]]~%# or positions[, effort] for the trajectory to be executed.~%# All specified values are in the same order as the joint names in JointTrajectory.msg~%~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] effort~%duration time_from_start~%~%================================================================================~%MSG: ramp_msgs/BezierCurve~%Header header~%~%ramp_msgs/MotionState[] points~%float64[] u_values~%~%ramp_msgs/MotionState[] segmentPoints~%ramp_msgs/MotionState[] controlPoints~%~%float64 l~%ramp_msgs/MotionState ms_maxVA~%ramp_msgs/MotionState ms_initialVA~%ramp_msgs/MotionState ms_begin~%float64 u_0~%float64 u_dot_0~%float64 u_dot_max~%float64 u_target~%~%================================================================================~%MSG: ramp_msgs/MotionState~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] jerks~%~%# change to duration~%float64 time~%~%================================================================================~%MSG: ramp_msgs/Path~%ramp_msgs/KnotPoint[] points~%~%================================================================================~%MSG: ramp_msgs/KnotPoint~%ramp_msgs/MotionState motionState~%uint32 stopTime~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RampTrajectory>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     2
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'trajectory))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'i_knotPoints) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'curves) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'holonomic_path))
     1
     8
     8
     1
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RampTrajectory>))
  "Converts a ROS message object to a list"
  (cl:list 'RampTrajectory
    (cl:cons ':header (header msg))
    (cl:cons ':id (id msg))
    (cl:cons ':trajectory (trajectory msg))
    (cl:cons ':i_knotPoints (i_knotPoints msg))
    (cl:cons ':curves (curves msg))
    (cl:cons ':holonomic_path (holonomic_path msg))
    (cl:cons ':feasible (feasible msg))
    (cl:cons ':fitness (fitness msg))
    (cl:cons ':t_firstCollision (t_firstCollision msg))
    (cl:cons ':i_subPopulation (i_subPopulation msg))
    (cl:cons ':t_start (t_start msg))
))
