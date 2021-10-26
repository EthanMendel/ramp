; Auto-generated. Do not edit!


(cl:in-package ramp_msgs-msg)


;//! \htmlinclude HilbertMap.msg.html

(cl:defclass <HilbertMap> (roslisp-msg-protocol:ros-message)
  ((map
    :reader map
    :initarg :map
    :type nav_msgs-msg:OccupancyGrid
    :initform (cl:make-instance 'nav_msgs-msg:OccupancyGrid))
   (gamma
    :reader gamma
    :initarg :gamma
    :type cl:float
    :initform 0.0))
)

(cl:defclass HilbertMap (<HilbertMap>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <HilbertMap>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'HilbertMap)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ramp_msgs-msg:<HilbertMap> is deprecated: use ramp_msgs-msg:HilbertMap instead.")))

(cl:ensure-generic-function 'map-val :lambda-list '(m))
(cl:defmethod map-val ((m <HilbertMap>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-msg:map-val is deprecated.  Use ramp_msgs-msg:map instead.")
  (map m))

(cl:ensure-generic-function 'gamma-val :lambda-list '(m))
(cl:defmethod gamma-val ((m <HilbertMap>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-msg:gamma-val is deprecated.  Use ramp_msgs-msg:gamma instead.")
  (gamma m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <HilbertMap>) ostream)
  "Serializes a message object of type '<HilbertMap>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'map) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'gamma))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <HilbertMap>) istream)
  "Deserializes a message object of type '<HilbertMap>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'map) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'gamma) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<HilbertMap>)))
  "Returns string type for a message object of type '<HilbertMap>"
  "ramp_msgs/HilbertMap")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'HilbertMap)))
  "Returns string type for a message object of type 'HilbertMap"
  "ramp_msgs/HilbertMap")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<HilbertMap>)))
  "Returns md5sum for a message object of type '<HilbertMap>"
  "b6a8a2af53f4c3c36388c3b8ae08732f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'HilbertMap)))
  "Returns md5sum for a message object of type 'HilbertMap"
  "b6a8a2af53f4c3c36388c3b8ae08732f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<HilbertMap>)))
  "Returns full string definition for message of type '<HilbertMap>"
  (cl:format cl:nil "nav_msgs/OccupancyGrid map~%float64 gamma~%~%================================================================================~%MSG: nav_msgs/OccupancyGrid~%# This represents a 2-D grid map, in which each cell represents the probability of~%# occupancy.~%~%Header header ~%~%#MetaData for the map~%MapMetaData info~%~%# The map data, in row-major order, starting with (0,0).  Occupancy~%# probabilities are in the range [0,100].  Unknown is -1.~%int8[] data~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: nav_msgs/MapMetaData~%# This hold basic information about the characterists of the OccupancyGrid~%~%# The time at which the map was loaded~%time map_load_time~%# The map resolution [m/cell]~%float32 resolution~%# Map width [cells]~%uint32 width~%# Map height [cells]~%uint32 height~%# The origin of the map [m, m, rad].  This is the real-world pose of the~%# cell (0,0) in the map.~%geometry_msgs/Pose origin~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'HilbertMap)))
  "Returns full string definition for message of type 'HilbertMap"
  (cl:format cl:nil "nav_msgs/OccupancyGrid map~%float64 gamma~%~%================================================================================~%MSG: nav_msgs/OccupancyGrid~%# This represents a 2-D grid map, in which each cell represents the probability of~%# occupancy.~%~%Header header ~%~%#MetaData for the map~%MapMetaData info~%~%# The map data, in row-major order, starting with (0,0).  Occupancy~%# probabilities are in the range [0,100].  Unknown is -1.~%int8[] data~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: nav_msgs/MapMetaData~%# This hold basic information about the characterists of the OccupancyGrid~%~%# The time at which the map was loaded~%time map_load_time~%# The map resolution [m/cell]~%float32 resolution~%# Map width [cells]~%uint32 width~%# Map height [cells]~%uint32 height~%# The origin of the map [m, m, rad].  This is the real-world pose of the~%# cell (0,0) in the map.~%geometry_msgs/Pose origin~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <HilbertMap>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'map))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <HilbertMap>))
  "Converts a ROS message object to a list"
  (cl:list 'HilbertMap
    (cl:cons ':map (map msg))
    (cl:cons ':gamma (gamma msg))
))
