;; Auto-generated. Do not edit!


(when (boundp 'ramp_msgs::EvaluationSrv)
  (if (not (find-package "RAMP_MSGS"))
    (make-package "RAMP_MSGS"))
  (shadow 'EvaluationSrv (find-package "RAMP_MSGS")))
(unless (find-package "RAMP_MSGS::EVALUATIONSRV")
  (make-package "RAMP_MSGS::EVALUATIONSRV"))
(unless (find-package "RAMP_MSGS::EVALUATIONSRVREQUEST")
  (make-package "RAMP_MSGS::EVALUATIONSRVREQUEST"))
(unless (find-package "RAMP_MSGS::EVALUATIONSRVRESPONSE")
  (make-package "RAMP_MSGS::EVALUATIONSRVRESPONSE"))

(in-package "ROS")





(defclass ramp_msgs::EvaluationSrvRequest
  :super ros::object
  :slots (_reqs ))

(defmethod ramp_msgs::EvaluationSrvRequest
  (:init
   (&key
    ((:reqs __reqs) ())
    )
   (send-super :init)
   (setq _reqs __reqs)
   self)
  (:reqs
   (&rest __reqs)
   (if (keywordp (car __reqs))
       (send* _reqs __reqs)
     (progn
       (if __reqs (setq _reqs (car __reqs)))
       _reqs)))
  (:serialization-length
   ()
   (+
    ;; ramp_msgs/EvaluationRequest[] _reqs
    (apply #'+ (send-all _reqs :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; ramp_msgs/EvaluationRequest[] _reqs
     (write-long (length _reqs) s)
     (dolist (elem _reqs)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; ramp_msgs/EvaluationRequest[] _reqs
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _reqs (let (r) (dotimes (i n) (push (instance ramp_msgs::EvaluationRequest :init) r)) r))
     (dolist (elem- _reqs)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass ramp_msgs::EvaluationSrvResponse
  :super ros::object
  :slots (_resps ))

(defmethod ramp_msgs::EvaluationSrvResponse
  (:init
   (&key
    ((:resps __resps) ())
    )
   (send-super :init)
   (setq _resps __resps)
   self)
  (:resps
   (&rest __resps)
   (if (keywordp (car __resps))
       (send* _resps __resps)
     (progn
       (if __resps (setq _resps (car __resps)))
       _resps)))
  (:serialization-length
   ()
   (+
    ;; ramp_msgs/EvaluationResponse[] _resps
    (apply #'+ (send-all _resps :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; ramp_msgs/EvaluationResponse[] _resps
     (write-long (length _resps) s)
     (dolist (elem _resps)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; ramp_msgs/EvaluationResponse[] _resps
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _resps (let (r) (dotimes (i n) (push (instance ramp_msgs::EvaluationResponse :init) r)) r))
     (dolist (elem- _resps)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass ramp_msgs::EvaluationSrv
  :super ros::object
  :slots ())

(setf (get ramp_msgs::EvaluationSrv :md5sum-) "bb14ee9ba2b91774273c2644f7a15381")
(setf (get ramp_msgs::EvaluationSrv :datatype-) "ramp_msgs/EvaluationSrv")
(setf (get ramp_msgs::EvaluationSrv :request) ramp_msgs::EvaluationSrvRequest)
(setf (get ramp_msgs::EvaluationSrv :response) ramp_msgs::EvaluationSrvResponse)

(defmethod ramp_msgs::EvaluationSrvRequest
  (:response () (instance ramp_msgs::EvaluationSrvResponse :init)))

(setf (get ramp_msgs::EvaluationSrvRequest :md5sum-) "bb14ee9ba2b91774273c2644f7a15381")
(setf (get ramp_msgs::EvaluationSrvRequest :datatype-) "ramp_msgs/EvaluationSrvRequest")
(setf (get ramp_msgs::EvaluationSrvRequest :definition-)
      "EvaluationRequest[] reqs


================================================================================
MSG: ramp_msgs/EvaluationRequest
RampTrajectory trajectory
float64 robot_radius
float64 currentTheta
float64 theta_cc
RampTrajectory[] obstacle_trjs
CircleGroup[] obstacle_cir_groups
bool imminent_collision
float64 offset
bool full_eval

bool consider_trans
bool trans_possible
bool hmap_eval

================================================================================
MSG: ramp_msgs/RampTrajectory
Header header
uint16 id
trajectory_msgs/JointTrajectory trajectory
uint16[] i_knotPoints
ramp_msgs/BezierCurve[] curves
ramp_msgs/Path holonomic_path

bool feasible
float64 fitness

duration t_firstCollision
int8 i_subPopulation

duration t_start

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: trajectory_msgs/JointTrajectory
Header header
string[] joint_names
JointTrajectoryPoint[] points

================================================================================
MSG: trajectory_msgs/JointTrajectoryPoint
# Each trajectory point specifies either positions[, velocities[, accelerations]]
# or positions[, effort] for the trajectory to be executed.
# All specified values are in the same order as the joint names in JointTrajectory.msg

float64[] positions
float64[] velocities
float64[] accelerations
float64[] effort
duration time_from_start

================================================================================
MSG: ramp_msgs/BezierCurve
Header header

ramp_msgs/MotionState[] points
float64[] u_values

ramp_msgs/MotionState[] segmentPoints
ramp_msgs/MotionState[] controlPoints

float64 l
ramp_msgs/MotionState ms_maxVA
ramp_msgs/MotionState ms_initialVA
ramp_msgs/MotionState ms_begin
float64 u_0
float64 u_dot_0
float64 u_dot_max
float64 u_target

================================================================================
MSG: ramp_msgs/MotionState
float64[] positions
float64[] velocities
float64[] accelerations
float64[] jerks

# change to duration
float64 time

================================================================================
MSG: ramp_msgs/Path
ramp_msgs/KnotPoint[] points

================================================================================
MSG: ramp_msgs/KnotPoint
ramp_msgs/MotionState motionState
uint32 stopTime

================================================================================
MSG: ramp_msgs/CircleGroup
ramp_msgs/Circle fitCir
ramp_msgs/Circle[] packedCirs

================================================================================
MSG: ramp_msgs/Circle
geometry_msgs/Vector3 center
float64 radius

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
---

EvaluationResponse[] resps


================================================================================
MSG: ramp_msgs/EvaluationResponse
float64 fitness
bool feasible
duration t_firstCollision
")

(setf (get ramp_msgs::EvaluationSrvResponse :md5sum-) "bb14ee9ba2b91774273c2644f7a15381")
(setf (get ramp_msgs::EvaluationSrvResponse :datatype-) "ramp_msgs/EvaluationSrvResponse")
(setf (get ramp_msgs::EvaluationSrvResponse :definition-)
      "EvaluationRequest[] reqs


================================================================================
MSG: ramp_msgs/EvaluationRequest
RampTrajectory trajectory
float64 robot_radius
float64 currentTheta
float64 theta_cc
RampTrajectory[] obstacle_trjs
CircleGroup[] obstacle_cir_groups
bool imminent_collision
float64 offset
bool full_eval

bool consider_trans
bool trans_possible
bool hmap_eval

================================================================================
MSG: ramp_msgs/RampTrajectory
Header header
uint16 id
trajectory_msgs/JointTrajectory trajectory
uint16[] i_knotPoints
ramp_msgs/BezierCurve[] curves
ramp_msgs/Path holonomic_path

bool feasible
float64 fitness

duration t_firstCollision
int8 i_subPopulation

duration t_start

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: trajectory_msgs/JointTrajectory
Header header
string[] joint_names
JointTrajectoryPoint[] points

================================================================================
MSG: trajectory_msgs/JointTrajectoryPoint
# Each trajectory point specifies either positions[, velocities[, accelerations]]
# or positions[, effort] for the trajectory to be executed.
# All specified values are in the same order as the joint names in JointTrajectory.msg

float64[] positions
float64[] velocities
float64[] accelerations
float64[] effort
duration time_from_start

================================================================================
MSG: ramp_msgs/BezierCurve
Header header

ramp_msgs/MotionState[] points
float64[] u_values

ramp_msgs/MotionState[] segmentPoints
ramp_msgs/MotionState[] controlPoints

float64 l
ramp_msgs/MotionState ms_maxVA
ramp_msgs/MotionState ms_initialVA
ramp_msgs/MotionState ms_begin
float64 u_0
float64 u_dot_0
float64 u_dot_max
float64 u_target

================================================================================
MSG: ramp_msgs/MotionState
float64[] positions
float64[] velocities
float64[] accelerations
float64[] jerks

# change to duration
float64 time

================================================================================
MSG: ramp_msgs/Path
ramp_msgs/KnotPoint[] points

================================================================================
MSG: ramp_msgs/KnotPoint
ramp_msgs/MotionState motionState
uint32 stopTime

================================================================================
MSG: ramp_msgs/CircleGroup
ramp_msgs/Circle fitCir
ramp_msgs/Circle[] packedCirs

================================================================================
MSG: ramp_msgs/Circle
geometry_msgs/Vector3 center
float64 radius

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
---

EvaluationResponse[] resps


================================================================================
MSG: ramp_msgs/EvaluationResponse
float64 fitness
bool feasible
duration t_firstCollision
")



(provide :ramp_msgs/EvaluationSrv "bb14ee9ba2b91774273c2644f7a15381")


