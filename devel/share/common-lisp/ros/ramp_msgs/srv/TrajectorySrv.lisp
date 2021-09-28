; Auto-generated. Do not edit!


(cl:in-package ramp_msgs-srv)


;//! \htmlinclude TrajectorySrv-request.msg.html

(cl:defclass <TrajectorySrv-request> (roslisp-msg-protocol:ros-message)
  ((reqs
    :reader reqs
    :initarg :reqs
    :type (cl:vector ramp_msgs-msg:TrajectoryRequest)
   :initform (cl:make-array 0 :element-type 'ramp_msgs-msg:TrajectoryRequest :initial-element (cl:make-instance 'ramp_msgs-msg:TrajectoryRequest))))
)

(cl:defclass TrajectorySrv-request (<TrajectorySrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TrajectorySrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TrajectorySrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ramp_msgs-srv:<TrajectorySrv-request> is deprecated: use ramp_msgs-srv:TrajectorySrv-request instead.")))

(cl:ensure-generic-function 'reqs-val :lambda-list '(m))
(cl:defmethod reqs-val ((m <TrajectorySrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-srv:reqs-val is deprecated.  Use ramp_msgs-srv:reqs instead.")
  (reqs m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TrajectorySrv-request>) ostream)
  "Serializes a message object of type '<TrajectorySrv-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'reqs))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'reqs))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TrajectorySrv-request>) istream)
  "Deserializes a message object of type '<TrajectorySrv-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'reqs) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'reqs)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'ramp_msgs-msg:TrajectoryRequest))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TrajectorySrv-request>)))
  "Returns string type for a service object of type '<TrajectorySrv-request>"
  "ramp_msgs/TrajectorySrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrajectorySrv-request)))
  "Returns string type for a service object of type 'TrajectorySrv-request"
  "ramp_msgs/TrajectorySrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TrajectorySrv-request>)))
  "Returns md5sum for a message object of type '<TrajectorySrv-request>"
  "8ccd59d329076db69674b9c52d4134e4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TrajectorySrv-request)))
  "Returns md5sum for a message object of type 'TrajectorySrv-request"
  "8ccd59d329076db69674b9c52d4134e4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TrajectorySrv-request>)))
  "Returns full string definition for message of type '<TrajectorySrv-request>"
  (cl:format cl:nil "TrajectoryRequest[] reqs~%~%~%================================================================================~%MSG: ramp_msgs/TrajectoryRequest~%ramp_msgs/Path path~%uint8 type ~%bool print~%ramp_msgs/BezierCurve[] bezierCurves~%int8 segments~%float64 max_speed_linear~%float64 max_speed_angular~%~%# For system-level test generation...~%bool sl_traj~%float64 sl_final_speed~%duration sl_init_dur~%duration sl_final_dur~%~%================================================================================~%MSG: ramp_msgs/Path~%ramp_msgs/KnotPoint[] points~%~%================================================================================~%MSG: ramp_msgs/KnotPoint~%ramp_msgs/MotionState motionState~%uint32 stopTime~%~%================================================================================~%MSG: ramp_msgs/MotionState~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] jerks~%~%# change to duration~%float64 time~%~%================================================================================~%MSG: ramp_msgs/BezierCurve~%Header header~%~%ramp_msgs/MotionState[] points~%float64[] u_values~%~%ramp_msgs/MotionState[] segmentPoints~%ramp_msgs/MotionState[] controlPoints~%~%float64 l~%ramp_msgs/MotionState ms_maxVA~%ramp_msgs/MotionState ms_initialVA~%ramp_msgs/MotionState ms_begin~%float64 u_0~%float64 u_dot_0~%float64 u_dot_max~%float64 u_target~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TrajectorySrv-request)))
  "Returns full string definition for message of type 'TrajectorySrv-request"
  (cl:format cl:nil "TrajectoryRequest[] reqs~%~%~%================================================================================~%MSG: ramp_msgs/TrajectoryRequest~%ramp_msgs/Path path~%uint8 type ~%bool print~%ramp_msgs/BezierCurve[] bezierCurves~%int8 segments~%float64 max_speed_linear~%float64 max_speed_angular~%~%# For system-level test generation...~%bool sl_traj~%float64 sl_final_speed~%duration sl_init_dur~%duration sl_final_dur~%~%================================================================================~%MSG: ramp_msgs/Path~%ramp_msgs/KnotPoint[] points~%~%================================================================================~%MSG: ramp_msgs/KnotPoint~%ramp_msgs/MotionState motionState~%uint32 stopTime~%~%================================================================================~%MSG: ramp_msgs/MotionState~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] jerks~%~%# change to duration~%float64 time~%~%================================================================================~%MSG: ramp_msgs/BezierCurve~%Header header~%~%ramp_msgs/MotionState[] points~%float64[] u_values~%~%ramp_msgs/MotionState[] segmentPoints~%ramp_msgs/MotionState[] controlPoints~%~%float64 l~%ramp_msgs/MotionState ms_maxVA~%ramp_msgs/MotionState ms_initialVA~%ramp_msgs/MotionState ms_begin~%float64 u_0~%float64 u_dot_0~%float64 u_dot_max~%float64 u_target~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TrajectorySrv-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'reqs) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TrajectorySrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'TrajectorySrv-request
    (cl:cons ':reqs (reqs msg))
))
;//! \htmlinclude TrajectorySrv-response.msg.html

(cl:defclass <TrajectorySrv-response> (roslisp-msg-protocol:ros-message)
  ((resps
    :reader resps
    :initarg :resps
    :type (cl:vector ramp_msgs-msg:TrajectoryResponse)
   :initform (cl:make-array 0 :element-type 'ramp_msgs-msg:TrajectoryResponse :initial-element (cl:make-instance 'ramp_msgs-msg:TrajectoryResponse))))
)

(cl:defclass TrajectorySrv-response (<TrajectorySrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TrajectorySrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TrajectorySrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ramp_msgs-srv:<TrajectorySrv-response> is deprecated: use ramp_msgs-srv:TrajectorySrv-response instead.")))

(cl:ensure-generic-function 'resps-val :lambda-list '(m))
(cl:defmethod resps-val ((m <TrajectorySrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-srv:resps-val is deprecated.  Use ramp_msgs-srv:resps instead.")
  (resps m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TrajectorySrv-response>) ostream)
  "Serializes a message object of type '<TrajectorySrv-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'resps))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'resps))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TrajectorySrv-response>) istream)
  "Deserializes a message object of type '<TrajectorySrv-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'resps) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'resps)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'ramp_msgs-msg:TrajectoryResponse))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TrajectorySrv-response>)))
  "Returns string type for a service object of type '<TrajectorySrv-response>"
  "ramp_msgs/TrajectorySrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrajectorySrv-response)))
  "Returns string type for a service object of type 'TrajectorySrv-response"
  "ramp_msgs/TrajectorySrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TrajectorySrv-response>)))
  "Returns md5sum for a message object of type '<TrajectorySrv-response>"
  "8ccd59d329076db69674b9c52d4134e4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TrajectorySrv-response)))
  "Returns md5sum for a message object of type 'TrajectorySrv-response"
  "8ccd59d329076db69674b9c52d4134e4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TrajectorySrv-response>)))
  "Returns full string definition for message of type '<TrajectorySrv-response>"
  (cl:format cl:nil "~%TrajectoryResponse[] resps~%~%~%================================================================================~%MSG: ramp_msgs/TrajectoryResponse~%RampTrajectory trajectory~%bool error~%~%================================================================================~%MSG: ramp_msgs/RampTrajectory~%Header header~%uint16 id~%trajectory_msgs/JointTrajectory trajectory~%uint16[] i_knotPoints~%ramp_msgs/BezierCurve[] curves~%ramp_msgs/Path holonomic_path~%~%bool feasible~%float64 fitness~%~%duration t_firstCollision~%int8 i_subPopulation~%~%duration t_start~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectory~%Header header~%string[] joint_names~%JointTrajectoryPoint[] points~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%# Each trajectory point specifies either positions[, velocities[, accelerations]]~%# or positions[, effort] for the trajectory to be executed.~%# All specified values are in the same order as the joint names in JointTrajectory.msg~%~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] effort~%duration time_from_start~%~%================================================================================~%MSG: ramp_msgs/BezierCurve~%Header header~%~%ramp_msgs/MotionState[] points~%float64[] u_values~%~%ramp_msgs/MotionState[] segmentPoints~%ramp_msgs/MotionState[] controlPoints~%~%float64 l~%ramp_msgs/MotionState ms_maxVA~%ramp_msgs/MotionState ms_initialVA~%ramp_msgs/MotionState ms_begin~%float64 u_0~%float64 u_dot_0~%float64 u_dot_max~%float64 u_target~%~%================================================================================~%MSG: ramp_msgs/MotionState~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] jerks~%~%# change to duration~%float64 time~%~%================================================================================~%MSG: ramp_msgs/Path~%ramp_msgs/KnotPoint[] points~%~%================================================================================~%MSG: ramp_msgs/KnotPoint~%ramp_msgs/MotionState motionState~%uint32 stopTime~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TrajectorySrv-response)))
  "Returns full string definition for message of type 'TrajectorySrv-response"
  (cl:format cl:nil "~%TrajectoryResponse[] resps~%~%~%================================================================================~%MSG: ramp_msgs/TrajectoryResponse~%RampTrajectory trajectory~%bool error~%~%================================================================================~%MSG: ramp_msgs/RampTrajectory~%Header header~%uint16 id~%trajectory_msgs/JointTrajectory trajectory~%uint16[] i_knotPoints~%ramp_msgs/BezierCurve[] curves~%ramp_msgs/Path holonomic_path~%~%bool feasible~%float64 fitness~%~%duration t_firstCollision~%int8 i_subPopulation~%~%duration t_start~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectory~%Header header~%string[] joint_names~%JointTrajectoryPoint[] points~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%# Each trajectory point specifies either positions[, velocities[, accelerations]]~%# or positions[, effort] for the trajectory to be executed.~%# All specified values are in the same order as the joint names in JointTrajectory.msg~%~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] effort~%duration time_from_start~%~%================================================================================~%MSG: ramp_msgs/BezierCurve~%Header header~%~%ramp_msgs/MotionState[] points~%float64[] u_values~%~%ramp_msgs/MotionState[] segmentPoints~%ramp_msgs/MotionState[] controlPoints~%~%float64 l~%ramp_msgs/MotionState ms_maxVA~%ramp_msgs/MotionState ms_initialVA~%ramp_msgs/MotionState ms_begin~%float64 u_0~%float64 u_dot_0~%float64 u_dot_max~%float64 u_target~%~%================================================================================~%MSG: ramp_msgs/MotionState~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] jerks~%~%# change to duration~%float64 time~%~%================================================================================~%MSG: ramp_msgs/Path~%ramp_msgs/KnotPoint[] points~%~%================================================================================~%MSG: ramp_msgs/KnotPoint~%ramp_msgs/MotionState motionState~%uint32 stopTime~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TrajectorySrv-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'resps) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TrajectorySrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'TrajectorySrv-response
    (cl:cons ':resps (resps msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'TrajectorySrv)))
  'TrajectorySrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'TrajectorySrv)))
  'TrajectorySrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrajectorySrv)))
  "Returns string type for a service object of type '<TrajectorySrv>"
  "ramp_msgs/TrajectorySrv")