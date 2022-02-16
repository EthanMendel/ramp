; Auto-generated. Do not edit!


(cl:in-package ramp_planner_new-msg)


;//! \htmlinclude TrajectorySwap.msg.html

(cl:defclass <TrajectorySwap> (roslisp-msg-protocol:ros-message)
  ((points
    :reader points
    :initarg :points
    :type (cl:vector geometry_msgs-msg:Point)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Point :initial-element (cl:make-instance 'geometry_msgs-msg:Point))))
)

(cl:defclass TrajectorySwap (<TrajectorySwap>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TrajectorySwap>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TrajectorySwap)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ramp_planner_new-msg:<TrajectorySwap> is deprecated: use ramp_planner_new-msg:TrajectorySwap instead.")))

(cl:ensure-generic-function 'points-val :lambda-list '(m))
(cl:defmethod points-val ((m <TrajectorySwap>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ramp_planner_new-msg:points-val is deprecated.  Use ramp_planner_new-msg:points instead.")
  (points m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TrajectorySwap>) ostream)
  "Serializes a message object of type '<TrajectorySwap>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'points))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'points))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TrajectorySwap>) istream)
  "Deserializes a message object of type '<TrajectorySwap>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'points) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'points)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Point))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TrajectorySwap>)))
  "Returns string type for a message object of type '<TrajectorySwap>"
  "ramp_planner_new/TrajectorySwap")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrajectorySwap)))
  "Returns string type for a message object of type 'TrajectorySwap"
  "ramp_planner_new/TrajectorySwap")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TrajectorySwap>)))
  "Returns md5sum for a message object of type '<TrajectorySwap>"
  "3fb3f9dacc279b964c4c8341122c34df")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TrajectorySwap)))
  "Returns md5sum for a message object of type 'TrajectorySwap"
  "3fb3f9dacc279b964c4c8341122c34df")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TrajectorySwap>)))
  "Returns full string definition for message of type '<TrajectorySwap>"
  (cl:format cl:nil "geometry_msgs/Point[] points~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TrajectorySwap)))
  "Returns full string definition for message of type 'TrajectorySwap"
  (cl:format cl:nil "geometry_msgs/Point[] points~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TrajectorySwap>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'points) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TrajectorySwap>))
  "Converts a ROS message object to a list"
  (cl:list 'TrajectorySwap
    (cl:cons ':points (points msg))
))
