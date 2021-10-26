; Auto-generated. Do not edit!


(cl:in-package ramp_msgs-msg)


;//! \htmlinclude Population.msg.html

(cl:defclass <Population> (roslisp-msg-protocol:ros-message)
  ((population
    :reader population
    :initarg :population
    :type (cl:vector ramp_msgs-msg:RampTrajectory)
   :initform (cl:make-array 0 :element-type 'ramp_msgs-msg:RampTrajectory :initial-element (cl:make-instance 'ramp_msgs-msg:RampTrajectory)))
   (best_id
    :reader best_id
    :initarg :best_id
    :type cl:integer
    :initform 0)
   (robot_id
    :reader robot_id
    :initarg :robot_id
    :type cl:integer
    :initform 0))
)

(cl:defclass Population (<Population>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Population>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Population)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ramp_msgs-msg:<Population> is deprecated: use ramp_msgs-msg:Population instead.")))

(cl:ensure-generic-function 'population-val :lambda-list '(m))
(cl:defmethod population-val ((m <Population>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-msg:population-val is deprecated.  Use ramp_msgs-msg:population instead.")
  (population m))

(cl:ensure-generic-function 'best_id-val :lambda-list '(m))
(cl:defmethod best_id-val ((m <Population>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-msg:best_id-val is deprecated.  Use ramp_msgs-msg:best_id instead.")
  (best_id m))

(cl:ensure-generic-function 'robot_id-val :lambda-list '(m))
(cl:defmethod robot_id-val ((m <Population>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-msg:robot_id-val is deprecated.  Use ramp_msgs-msg:robot_id instead.")
  (robot_id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Population>) ostream)
  "Serializes a message object of type '<Population>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'population))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'population))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'best_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'best_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'best_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'best_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'robot_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'robot_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'robot_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'robot_id)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Population>) istream)
  "Deserializes a message object of type '<Population>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'population) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'population)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'ramp_msgs-msg:RampTrajectory))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'best_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'best_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'best_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'best_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'robot_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'robot_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'robot_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'robot_id)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Population>)))
  "Returns string type for a message object of type '<Population>"
  "ramp_msgs/Population")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Population)))
  "Returns string type for a message object of type 'Population"
  "ramp_msgs/Population")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Population>)))
  "Returns md5sum for a message object of type '<Population>"
  "8c341abc608a5ae75ad01c78647a2f4d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Population)))
  "Returns md5sum for a message object of type 'Population"
  "8c341abc608a5ae75ad01c78647a2f4d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Population>)))
  "Returns full string definition for message of type '<Population>"
  (cl:format cl:nil "ramp_msgs/RampTrajectory[] population~%uint32 best_id~%uint32 robot_id~%~%================================================================================~%MSG: ramp_msgs/RampTrajectory~%Header header~%uint16 id~%trajectory_msgs/JointTrajectory trajectory~%uint16[] i_knotPoints~%ramp_msgs/BezierCurve[] curves~%ramp_msgs/Path holonomic_path~%~%bool feasible~%float64 fitness~%~%duration t_firstCollision~%int8 i_subPopulation~%~%duration t_start~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectory~%Header header~%string[] joint_names~%JointTrajectoryPoint[] points~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%# Each trajectory point specifies either positions[, velocities[, accelerations]]~%# or positions[, effort] for the trajectory to be executed.~%# All specified values are in the same order as the joint names in JointTrajectory.msg~%~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] effort~%duration time_from_start~%~%================================================================================~%MSG: ramp_msgs/BezierCurve~%Header header~%~%ramp_msgs/MotionState[] points~%float64[] u_values~%~%ramp_msgs/MotionState[] segmentPoints~%ramp_msgs/MotionState[] controlPoints~%~%float64 l~%ramp_msgs/MotionState ms_maxVA~%ramp_msgs/MotionState ms_initialVA~%ramp_msgs/MotionState ms_begin~%float64 u_0~%float64 u_dot_0~%float64 u_dot_max~%float64 u_target~%~%================================================================================~%MSG: ramp_msgs/MotionState~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] jerks~%~%# change to duration~%float64 time~%~%================================================================================~%MSG: ramp_msgs/Path~%ramp_msgs/KnotPoint[] points~%~%================================================================================~%MSG: ramp_msgs/KnotPoint~%ramp_msgs/MotionState motionState~%uint32 stopTime~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Population)))
  "Returns full string definition for message of type 'Population"
  (cl:format cl:nil "ramp_msgs/RampTrajectory[] population~%uint32 best_id~%uint32 robot_id~%~%================================================================================~%MSG: ramp_msgs/RampTrajectory~%Header header~%uint16 id~%trajectory_msgs/JointTrajectory trajectory~%uint16[] i_knotPoints~%ramp_msgs/BezierCurve[] curves~%ramp_msgs/Path holonomic_path~%~%bool feasible~%float64 fitness~%~%duration t_firstCollision~%int8 i_subPopulation~%~%duration t_start~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectory~%Header header~%string[] joint_names~%JointTrajectoryPoint[] points~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%# Each trajectory point specifies either positions[, velocities[, accelerations]]~%# or positions[, effort] for the trajectory to be executed.~%# All specified values are in the same order as the joint names in JointTrajectory.msg~%~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] effort~%duration time_from_start~%~%================================================================================~%MSG: ramp_msgs/BezierCurve~%Header header~%~%ramp_msgs/MotionState[] points~%float64[] u_values~%~%ramp_msgs/MotionState[] segmentPoints~%ramp_msgs/MotionState[] controlPoints~%~%float64 l~%ramp_msgs/MotionState ms_maxVA~%ramp_msgs/MotionState ms_initialVA~%ramp_msgs/MotionState ms_begin~%float64 u_0~%float64 u_dot_0~%float64 u_dot_max~%float64 u_target~%~%================================================================================~%MSG: ramp_msgs/MotionState~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] jerks~%~%# change to duration~%float64 time~%~%================================================================================~%MSG: ramp_msgs/Path~%ramp_msgs/KnotPoint[] points~%~%================================================================================~%MSG: ramp_msgs/KnotPoint~%ramp_msgs/MotionState motionState~%uint32 stopTime~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Population>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'population) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Population>))
  "Converts a ROS message object to a list"
  (cl:list 'Population
    (cl:cons ':population (population msg))
    (cl:cons ':best_id (best_id msg))
    (cl:cons ':robot_id (robot_id msg))
))
