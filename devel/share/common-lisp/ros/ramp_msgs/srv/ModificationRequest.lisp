; Auto-generated. Do not edit!


(cl:in-package ramp_msgs-srv)


;//! \htmlinclude ModificationRequest-request.msg.html

(cl:defclass <ModificationRequest-request> (roslisp-msg-protocol:ros-message)
  ((paths
    :reader paths
    :initarg :paths
    :type (cl:vector ramp_msgs-msg:Path)
   :initform (cl:make-array 0 :element-type 'ramp_msgs-msg:Path :initial-element (cl:make-instance 'ramp_msgs-msg:Path)))
   (op
    :reader op
    :initarg :op
    :type cl:string
    :initform "")
   (move_dist
    :reader move_dist
    :initarg :move_dist
    :type cl:float
    :initform 0.0)
   (move_dir
    :reader move_dir
    :initarg :move_dir
    :type cl:float
    :initform 0.0))
)

(cl:defclass ModificationRequest-request (<ModificationRequest-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ModificationRequest-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ModificationRequest-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ramp_msgs-srv:<ModificationRequest-request> is deprecated: use ramp_msgs-srv:ModificationRequest-request instead.")))

(cl:ensure-generic-function 'paths-val :lambda-list '(m))
(cl:defmethod paths-val ((m <ModificationRequest-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-srv:paths-val is deprecated.  Use ramp_msgs-srv:paths instead.")
  (paths m))

(cl:ensure-generic-function 'op-val :lambda-list '(m))
(cl:defmethod op-val ((m <ModificationRequest-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-srv:op-val is deprecated.  Use ramp_msgs-srv:op instead.")
  (op m))

(cl:ensure-generic-function 'move_dist-val :lambda-list '(m))
(cl:defmethod move_dist-val ((m <ModificationRequest-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-srv:move_dist-val is deprecated.  Use ramp_msgs-srv:move_dist instead.")
  (move_dist m))

(cl:ensure-generic-function 'move_dir-val :lambda-list '(m))
(cl:defmethod move_dir-val ((m <ModificationRequest-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-srv:move_dir-val is deprecated.  Use ramp_msgs-srv:move_dir instead.")
  (move_dir m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ModificationRequest-request>) ostream)
  "Serializes a message object of type '<ModificationRequest-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'paths))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'paths))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'op))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'op))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'move_dist))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'move_dir))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ModificationRequest-request>) istream)
  "Deserializes a message object of type '<ModificationRequest-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'paths) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'paths)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'ramp_msgs-msg:Path))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'op) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'op) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'move_dist) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'move_dir) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ModificationRequest-request>)))
  "Returns string type for a service object of type '<ModificationRequest-request>"
  "ramp_msgs/ModificationRequestRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ModificationRequest-request)))
  "Returns string type for a service object of type 'ModificationRequest-request"
  "ramp_msgs/ModificationRequestRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ModificationRequest-request>)))
  "Returns md5sum for a message object of type '<ModificationRequest-request>"
  "81d0e2ec37dd2f917b71cfdf955b990d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ModificationRequest-request)))
  "Returns md5sum for a message object of type 'ModificationRequest-request"
  "81d0e2ec37dd2f917b71cfdf955b990d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ModificationRequest-request>)))
  "Returns full string definition for message of type '<ModificationRequest-request>"
  (cl:format cl:nil "Path[] paths~%string op~%float64 move_dist~%float64 move_dir~%~%~%================================================================================~%MSG: ramp_msgs/Path~%ramp_msgs/KnotPoint[] points~%~%================================================================================~%MSG: ramp_msgs/KnotPoint~%ramp_msgs/MotionState motionState~%uint32 stopTime~%~%================================================================================~%MSG: ramp_msgs/MotionState~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] jerks~%~%# change to duration~%float64 time~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ModificationRequest-request)))
  "Returns full string definition for message of type 'ModificationRequest-request"
  (cl:format cl:nil "Path[] paths~%string op~%float64 move_dist~%float64 move_dir~%~%~%================================================================================~%MSG: ramp_msgs/Path~%ramp_msgs/KnotPoint[] points~%~%================================================================================~%MSG: ramp_msgs/KnotPoint~%ramp_msgs/MotionState motionState~%uint32 stopTime~%~%================================================================================~%MSG: ramp_msgs/MotionState~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] jerks~%~%# change to duration~%float64 time~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ModificationRequest-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'paths) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:length (cl:slot-value msg 'op))
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ModificationRequest-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ModificationRequest-request
    (cl:cons ':paths (paths msg))
    (cl:cons ':op (op msg))
    (cl:cons ':move_dist (move_dist msg))
    (cl:cons ':move_dir (move_dir msg))
))
;//! \htmlinclude ModificationRequest-response.msg.html

(cl:defclass <ModificationRequest-response> (roslisp-msg-protocol:ros-message)
  ((mod_paths
    :reader mod_paths
    :initarg :mod_paths
    :type (cl:vector ramp_msgs-msg:Path)
   :initform (cl:make-array 0 :element-type 'ramp_msgs-msg:Path :initial-element (cl:make-instance 'ramp_msgs-msg:Path))))
)

(cl:defclass ModificationRequest-response (<ModificationRequest-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ModificationRequest-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ModificationRequest-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ramp_msgs-srv:<ModificationRequest-response> is deprecated: use ramp_msgs-srv:ModificationRequest-response instead.")))

(cl:ensure-generic-function 'mod_paths-val :lambda-list '(m))
(cl:defmethod mod_paths-val ((m <ModificationRequest-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_msgs-srv:mod_paths-val is deprecated.  Use ramp_msgs-srv:mod_paths instead.")
  (mod_paths m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ModificationRequest-response>) ostream)
  "Serializes a message object of type '<ModificationRequest-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'mod_paths))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'mod_paths))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ModificationRequest-response>) istream)
  "Deserializes a message object of type '<ModificationRequest-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'mod_paths) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'mod_paths)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'ramp_msgs-msg:Path))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ModificationRequest-response>)))
  "Returns string type for a service object of type '<ModificationRequest-response>"
  "ramp_msgs/ModificationRequestResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ModificationRequest-response)))
  "Returns string type for a service object of type 'ModificationRequest-response"
  "ramp_msgs/ModificationRequestResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ModificationRequest-response>)))
  "Returns md5sum for a message object of type '<ModificationRequest-response>"
  "81d0e2ec37dd2f917b71cfdf955b990d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ModificationRequest-response)))
  "Returns md5sum for a message object of type 'ModificationRequest-response"
  "81d0e2ec37dd2f917b71cfdf955b990d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ModificationRequest-response>)))
  "Returns full string definition for message of type '<ModificationRequest-response>"
  (cl:format cl:nil "~%Path[]  mod_paths~%~%~%================================================================================~%MSG: ramp_msgs/Path~%ramp_msgs/KnotPoint[] points~%~%================================================================================~%MSG: ramp_msgs/KnotPoint~%ramp_msgs/MotionState motionState~%uint32 stopTime~%~%================================================================================~%MSG: ramp_msgs/MotionState~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] jerks~%~%# change to duration~%float64 time~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ModificationRequest-response)))
  "Returns full string definition for message of type 'ModificationRequest-response"
  (cl:format cl:nil "~%Path[]  mod_paths~%~%~%================================================================================~%MSG: ramp_msgs/Path~%ramp_msgs/KnotPoint[] points~%~%================================================================================~%MSG: ramp_msgs/KnotPoint~%ramp_msgs/MotionState motionState~%uint32 stopTime~%~%================================================================================~%MSG: ramp_msgs/MotionState~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] jerks~%~%# change to duration~%float64 time~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ModificationRequest-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'mod_paths) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ModificationRequest-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ModificationRequest-response
    (cl:cons ':mod_paths (mod_paths msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ModificationRequest)))
  'ModificationRequest-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ModificationRequest)))
  'ModificationRequest-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ModificationRequest)))
  "Returns string type for a service object of type '<ModificationRequest>"
  "ramp_msgs/ModificationRequest")