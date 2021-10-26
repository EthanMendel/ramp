; Auto-generated. Do not edit!


(cl:in-package ramp_msgs-msg)


;//! \htmlinclude TrajectoryResponse.msg.html

(cl:defclass <TrajectoryResponse> (roslisp-msg-protocol:ros-message)
  ((trajectory
    :reader trajectory
    :initarg :trajectory
    :type ramp_msgs-msg:RampTrajectory
    :initform (cl:make-instance 'ramp_msgs-msg:RampTrajectory))
   (error
    :reader error
    :initarg :error
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass TrajectoryResponse (<TrajectoryResponse>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TrajectoryResponse>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TrajectoryResponse)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ramp_msgs-msg:<TrajectoryResponse> is deprecated: use ramp_msgs-msg:TrajectoryResponse instead.")))

(cl:ensure-generic-function 'trajectory-val :lambda-list '(m))
(cl:defmethod trajectory-val ((m <TrajectoryResponse>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-msg:trajectory-val is deprecated.  Use ramp_msgs-msg:trajectory instead.")
  (trajectory m))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <TrajectoryResponse>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-msg:error-val is deprecated.  Use ramp_msgs-msg:error instead.")
  (error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TrajectoryResponse>) ostream)
  "Serializes a message object of type '<TrajectoryResponse>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'trajectory) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'error) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TrajectoryResponse>) istream)
  "Deserializes a message object of type '<TrajectoryResponse>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'trajectory) istream)
    (cl:setf (cl:slot-value msg 'error) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TrajectoryResponse>)))
  "Returns string type for a message object of type '<TrajectoryResponse>"
  "ramp_msgs/TrajectoryResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrajectoryResponse)))
  "Returns string type for a message object of type 'TrajectoryResponse"
  "ramp_msgs/TrajectoryResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TrajectoryResponse>)))
  "Returns md5sum for a message object of type '<TrajectoryResponse>"
  "7f0e434125bc636478341ddb1c7831e7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TrajectoryResponse)))
  "Returns md5sum for a message object of type 'TrajectoryResponse"
  "7f0e434125bc636478341ddb1c7831e7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TrajectoryResponse>)))
  "Returns full string definition for message of type '<TrajectoryResponse>"
  (cl:format cl:nil "RampTrajectory trajectory~%bool error~%~%================================================================================~%MSG: ramp_msgs/RampTrajectory~%Header header~%uint16 id~%trajectory_msgs/JointTrajectory trajectory~%uint16[] i_knotPoints~%ramp_msgs/BezierCurve[] curves~%ramp_msgs/Path holonomic_path~%~%bool feasible~%float64 fitness~%~%duration t_firstCollision~%int8 i_subPopulation~%~%duration t_start~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectory~%Header header~%string[] joint_names~%JointTrajectoryPoint[] points~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%# Each trajectory point specifies either positions[, velocities[, accelerations]]~%# or positions[, effort] for the trajectory to be executed.~%# All specified values are in the same order as the joint names in JointTrajectory.msg~%~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] effort~%duration time_from_start~%~%================================================================================~%MSG: ramp_msgs/BezierCurve~%Header header~%~%ramp_msgs/MotionState[] points~%float64[] u_values~%~%ramp_msgs/MotionState[] segmentPoints~%ramp_msgs/MotionState[] controlPoints~%~%float64 l~%ramp_msgs/MotionState ms_maxVA~%ramp_msgs/MotionState ms_initialVA~%ramp_msgs/MotionState ms_begin~%float64 u_0~%float64 u_dot_0~%float64 u_dot_max~%float64 u_target~%~%================================================================================~%MSG: ramp_msgs/MotionState~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] jerks~%~%# change to duration~%float64 time~%~%================================================================================~%MSG: ramp_msgs/Path~%ramp_msgs/KnotPoint[] points~%~%================================================================================~%MSG: ramp_msgs/KnotPoint~%ramp_msgs/MotionState motionState~%uint32 stopTime~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TrajectoryResponse)))
  "Returns full string definition for message of type 'TrajectoryResponse"
  (cl:format cl:nil "RampTrajectory trajectory~%bool error~%~%================================================================================~%MSG: ramp_msgs/RampTrajectory~%Header header~%uint16 id~%trajectory_msgs/JointTrajectory trajectory~%uint16[] i_knotPoints~%ramp_msgs/BezierCurve[] curves~%ramp_msgs/Path holonomic_path~%~%bool feasible~%float64 fitness~%~%duration t_firstCollision~%int8 i_subPopulation~%~%duration t_start~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectory~%Header header~%string[] joint_names~%JointTrajectoryPoint[] points~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%# Each trajectory point specifies either positions[, velocities[, accelerations]]~%# or positions[, effort] for the trajectory to be executed.~%# All specified values are in the same order as the joint names in JointTrajectory.msg~%~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] effort~%duration time_from_start~%~%================================================================================~%MSG: ramp_msgs/BezierCurve~%Header header~%~%ramp_msgs/MotionState[] points~%float64[] u_values~%~%ramp_msgs/MotionState[] segmentPoints~%ramp_msgs/MotionState[] controlPoints~%~%float64 l~%ramp_msgs/MotionState ms_maxVA~%ramp_msgs/MotionState ms_initialVA~%ramp_msgs/MotionState ms_begin~%float64 u_0~%float64 u_dot_0~%float64 u_dot_max~%float64 u_target~%~%================================================================================~%MSG: ramp_msgs/MotionState~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] jerks~%~%# change to duration~%float64 time~%~%================================================================================~%MSG: ramp_msgs/Path~%ramp_msgs/KnotPoint[] points~%~%================================================================================~%MSG: ramp_msgs/KnotPoint~%ramp_msgs/MotionState motionState~%uint32 stopTime~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TrajectoryResponse>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'trajectory))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TrajectoryResponse>))
  "Converts a ROS message object to a list"
  (cl:list 'TrajectoryResponse
    (cl:cons ':trajectory (trajectory msg))
    (cl:cons ':error (error msg))
))
