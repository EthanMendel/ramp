; Auto-generated. Do not edit!


(cl:in-package ramp_msgs-srv)


;//! \htmlinclude EvaluationSrv-request.msg.html

(cl:defclass <EvaluationSrv-request> (roslisp-msg-protocol:ros-message)
  ((reqs
    :reader reqs
    :initarg :reqs
    :type (cl:vector ramp_msgs-msg:EvaluationRequest)
   :initform (cl:make-array 0 :element-type 'ramp_msgs-msg:EvaluationRequest :initial-element (cl:make-instance 'ramp_msgs-msg:EvaluationRequest))))
)

(cl:defclass EvaluationSrv-request (<EvaluationSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EvaluationSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EvaluationSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ramp_msgs-srv:<EvaluationSrv-request> is deprecated: use ramp_msgs-srv:EvaluationSrv-request instead.")))

(cl:ensure-generic-function 'reqs-val :lambda-list '(m))
(cl:defmethod reqs-val ((m <EvaluationSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-srv:reqs-val is deprecated.  Use ramp_msgs-srv:reqs instead.")
  (reqs m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EvaluationSrv-request>) ostream)
  "Serializes a message object of type '<EvaluationSrv-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'reqs))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'reqs))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EvaluationSrv-request>) istream)
  "Deserializes a message object of type '<EvaluationSrv-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'reqs) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'reqs)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'ramp_msgs-msg:EvaluationRequest))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EvaluationSrv-request>)))
  "Returns string type for a service object of type '<EvaluationSrv-request>"
  "ramp_msgs/EvaluationSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EvaluationSrv-request)))
  "Returns string type for a service object of type 'EvaluationSrv-request"
  "ramp_msgs/EvaluationSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EvaluationSrv-request>)))
  "Returns md5sum for a message object of type '<EvaluationSrv-request>"
  "bb14ee9ba2b91774273c2644f7a15381")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EvaluationSrv-request)))
  "Returns md5sum for a message object of type 'EvaluationSrv-request"
  "bb14ee9ba2b91774273c2644f7a15381")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EvaluationSrv-request>)))
  "Returns full string definition for message of type '<EvaluationSrv-request>"
  (cl:format cl:nil "EvaluationRequest[] reqs~%~%~%================================================================================~%MSG: ramp_msgs/EvaluationRequest~%RampTrajectory trajectory~%float64 robot_radius~%float64 currentTheta~%float64 theta_cc~%RampTrajectory[] obstacle_trjs~%CircleGroup[] obstacle_cir_groups~%bool imminent_collision~%float64 offset~%bool full_eval~%~%bool consider_trans~%bool trans_possible~%bool hmap_eval~%~%================================================================================~%MSG: ramp_msgs/RampTrajectory~%Header header~%uint16 id~%trajectory_msgs/JointTrajectory trajectory~%uint16[] i_knotPoints~%ramp_msgs/BezierCurve[] curves~%ramp_msgs/Path holonomic_path~%~%bool feasible~%float64 fitness~%~%duration t_firstCollision~%int8 i_subPopulation~%~%duration t_start~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectory~%Header header~%string[] joint_names~%JointTrajectoryPoint[] points~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%# Each trajectory point specifies either positions[, velocities[, accelerations]]~%# or positions[, effort] for the trajectory to be executed.~%# All specified values are in the same order as the joint names in JointTrajectory.msg~%~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] effort~%duration time_from_start~%~%================================================================================~%MSG: ramp_msgs/BezierCurve~%Header header~%~%ramp_msgs/MotionState[] points~%float64[] u_values~%~%ramp_msgs/MotionState[] segmentPoints~%ramp_msgs/MotionState[] controlPoints~%~%float64 l~%ramp_msgs/MotionState ms_maxVA~%ramp_msgs/MotionState ms_initialVA~%ramp_msgs/MotionState ms_begin~%float64 u_0~%float64 u_dot_0~%float64 u_dot_max~%float64 u_target~%~%================================================================================~%MSG: ramp_msgs/MotionState~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] jerks~%~%# change to duration~%float64 time~%~%================================================================================~%MSG: ramp_msgs/Path~%ramp_msgs/KnotPoint[] points~%~%================================================================================~%MSG: ramp_msgs/KnotPoint~%ramp_msgs/MotionState motionState~%uint32 stopTime~%~%================================================================================~%MSG: ramp_msgs/CircleGroup~%ramp_msgs/Circle fitCir~%ramp_msgs/Circle[] packedCirs~%~%================================================================================~%MSG: ramp_msgs/Circle~%geometry_msgs/Vector3 center~%float64 radius~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EvaluationSrv-request)))
  "Returns full string definition for message of type 'EvaluationSrv-request"
  (cl:format cl:nil "EvaluationRequest[] reqs~%~%~%================================================================================~%MSG: ramp_msgs/EvaluationRequest~%RampTrajectory trajectory~%float64 robot_radius~%float64 currentTheta~%float64 theta_cc~%RampTrajectory[] obstacle_trjs~%CircleGroup[] obstacle_cir_groups~%bool imminent_collision~%float64 offset~%bool full_eval~%~%bool consider_trans~%bool trans_possible~%bool hmap_eval~%~%================================================================================~%MSG: ramp_msgs/RampTrajectory~%Header header~%uint16 id~%trajectory_msgs/JointTrajectory trajectory~%uint16[] i_knotPoints~%ramp_msgs/BezierCurve[] curves~%ramp_msgs/Path holonomic_path~%~%bool feasible~%float64 fitness~%~%duration t_firstCollision~%int8 i_subPopulation~%~%duration t_start~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectory~%Header header~%string[] joint_names~%JointTrajectoryPoint[] points~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%# Each trajectory point specifies either positions[, velocities[, accelerations]]~%# or positions[, effort] for the trajectory to be executed.~%# All specified values are in the same order as the joint names in JointTrajectory.msg~%~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] effort~%duration time_from_start~%~%================================================================================~%MSG: ramp_msgs/BezierCurve~%Header header~%~%ramp_msgs/MotionState[] points~%float64[] u_values~%~%ramp_msgs/MotionState[] segmentPoints~%ramp_msgs/MotionState[] controlPoints~%~%float64 l~%ramp_msgs/MotionState ms_maxVA~%ramp_msgs/MotionState ms_initialVA~%ramp_msgs/MotionState ms_begin~%float64 u_0~%float64 u_dot_0~%float64 u_dot_max~%float64 u_target~%~%================================================================================~%MSG: ramp_msgs/MotionState~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] jerks~%~%# change to duration~%float64 time~%~%================================================================================~%MSG: ramp_msgs/Path~%ramp_msgs/KnotPoint[] points~%~%================================================================================~%MSG: ramp_msgs/KnotPoint~%ramp_msgs/MotionState motionState~%uint32 stopTime~%~%================================================================================~%MSG: ramp_msgs/CircleGroup~%ramp_msgs/Circle fitCir~%ramp_msgs/Circle[] packedCirs~%~%================================================================================~%MSG: ramp_msgs/Circle~%geometry_msgs/Vector3 center~%float64 radius~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EvaluationSrv-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'reqs) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EvaluationSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'EvaluationSrv-request
    (cl:cons ':reqs (reqs msg))
))
;//! \htmlinclude EvaluationSrv-response.msg.html

(cl:defclass <EvaluationSrv-response> (roslisp-msg-protocol:ros-message)
  ((resps
    :reader resps
    :initarg :resps
    :type (cl:vector ramp_msgs-msg:EvaluationResponse)
   :initform (cl:make-array 0 :element-type 'ramp_msgs-msg:EvaluationResponse :initial-element (cl:make-instance 'ramp_msgs-msg:EvaluationResponse))))
)

(cl:defclass EvaluationSrv-response (<EvaluationSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EvaluationSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EvaluationSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ramp_msgs-srv:<EvaluationSrv-response> is deprecated: use ramp_msgs-srv:EvaluationSrv-response instead.")))

(cl:ensure-generic-function 'resps-val :lambda-list '(m))
(cl:defmethod resps-val ((m <EvaluationSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-srv:resps-val is deprecated.  Use ramp_msgs-srv:resps instead.")
  (resps m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EvaluationSrv-response>) ostream)
  "Serializes a message object of type '<EvaluationSrv-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'resps))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'resps))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EvaluationSrv-response>) istream)
  "Deserializes a message object of type '<EvaluationSrv-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'resps) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'resps)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'ramp_msgs-msg:EvaluationResponse))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EvaluationSrv-response>)))
  "Returns string type for a service object of type '<EvaluationSrv-response>"
  "ramp_msgs/EvaluationSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EvaluationSrv-response)))
  "Returns string type for a service object of type 'EvaluationSrv-response"
  "ramp_msgs/EvaluationSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EvaluationSrv-response>)))
  "Returns md5sum for a message object of type '<EvaluationSrv-response>"
  "bb14ee9ba2b91774273c2644f7a15381")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EvaluationSrv-response)))
  "Returns md5sum for a message object of type 'EvaluationSrv-response"
  "bb14ee9ba2b91774273c2644f7a15381")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EvaluationSrv-response>)))
  "Returns full string definition for message of type '<EvaluationSrv-response>"
  (cl:format cl:nil "~%EvaluationResponse[] resps~%~%~%================================================================================~%MSG: ramp_msgs/EvaluationResponse~%float64 fitness~%bool feasible~%duration t_firstCollision~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EvaluationSrv-response)))
  "Returns full string definition for message of type 'EvaluationSrv-response"
  (cl:format cl:nil "~%EvaluationResponse[] resps~%~%~%================================================================================~%MSG: ramp_msgs/EvaluationResponse~%float64 fitness~%bool feasible~%duration t_firstCollision~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EvaluationSrv-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'resps) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EvaluationSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'EvaluationSrv-response
    (cl:cons ':resps (resps msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'EvaluationSrv)))
  'EvaluationSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'EvaluationSrv)))
  'EvaluationSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EvaluationSrv)))
  "Returns string type for a service object of type '<EvaluationSrv>"
  "ramp_msgs/EvaluationSrv")