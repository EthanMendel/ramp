;; Auto-generated. Do not edit!


(when (boundp 'ramp_msgs::TrajectorySrv)
  (if (not (find-package "RAMP_MSGS"))
    (make-package "RAMP_MSGS"))
  (shadow 'TrajectorySrv (find-package "RAMP_MSGS")))
(unless (find-package "RAMP_MSGS::TRAJECTORYSRV")
  (make-package "RAMP_MSGS::TRAJECTORYSRV"))
(unless (find-package "RAMP_MSGS::TRAJECTORYSRVREQUEST")
  (make-package "RAMP_MSGS::TRAJECTORYSRVREQUEST"))
(unless (find-package "RAMP_MSGS::TRAJECTORYSRVRESPONSE")
  (make-package "RAMP_MSGS::TRAJECTORYSRVRESPONSE"))

(in-package "ROS")





(defclass ramp_msgs::TrajectorySrvRequest
  :super ros::object
  :slots (_reqs ))

(defmethod ramp_msgs::TrajectorySrvRequest
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
    ;; ramp_msgs/TrajectoryRequest[] _reqs
    (apply #'+ (send-all _reqs :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; ramp_msgs/TrajectoryRequest[] _reqs
     (write-long (length _reqs) s)
     (dolist (elem _reqs)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; ramp_msgs/TrajectoryRequest[] _reqs
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _reqs (let (r) (dotimes (i n) (push (instance ramp_msgs::TrajectoryRequest :init) r)) r))
     (dolist (elem- _reqs)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass ramp_msgs::TrajectorySrvResponse
  :super ros::object
  :slots (_resps ))

(defmethod ramp_msgs::TrajectorySrvResponse
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
    ;; ramp_msgs/TrajectoryResponse[] _resps
    (apply #'+ (send-all _resps :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; ramp_msgs/TrajectoryResponse[] _resps
     (write-long (length _resps) s)
     (dolist (elem _resps)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; ramp_msgs/TrajectoryResponse[] _resps
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _resps (let (r) (dotimes (i n) (push (instance ramp_msgs::TrajectoryResponse :init) r)) r))
     (dolist (elem- _resps)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass ramp_msgs::TrajectorySrv
  :super ros::object
  :slots ())

(setf (get ramp_msgs::TrajectorySrv :md5sum-) "8ccd59d329076db69674b9c52d4134e4")
(setf (get ramp_msgs::TrajectorySrv :datatype-) "ramp_msgs/TrajectorySrv")
(setf (get ramp_msgs::TrajectorySrv :request) ramp_msgs::TrajectorySrvRequest)
(setf (get ramp_msgs::TrajectorySrv :response) ramp_msgs::TrajectorySrvResponse)

(defmethod ramp_msgs::TrajectorySrvRequest
  (:response () (instance ramp_msgs::TrajectorySrvResponse :init)))

(setf (get ramp_msgs::TrajectorySrvRequest :md5sum-) "8ccd59d329076db69674b9c52d4134e4")
(setf (get ramp_msgs::TrajectorySrvRequest :datatype-) "ramp_msgs/TrajectorySrvRequest")
(setf (get ramp_msgs::TrajectorySrvRequest :definition-)
      "TrajectoryRequest[] reqs


================================================================================
MSG: ramp_msgs/TrajectoryRequest
ramp_msgs/Path path
uint8 type 
bool print
ramp_msgs/BezierCurve[] bezierCurves
int8 segments
float64 max_speed_linear
float64 max_speed_angular

# For system-level test generation...
bool sl_traj
float64 sl_final_speed
duration sl_init_dur
duration sl_final_dur

================================================================================
MSG: ramp_msgs/Path
ramp_msgs/KnotPoint[] points

================================================================================
MSG: ramp_msgs/KnotPoint
ramp_msgs/MotionState motionState
uint32 stopTime

================================================================================
MSG: ramp_msgs/MotionState
float64[] positions
float64[] velocities
float64[] accelerations
float64[] jerks

# change to duration
float64 time

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
---

TrajectoryResponse[] resps


================================================================================
MSG: ramp_msgs/TrajectoryResponse
RampTrajectory trajectory
bool error

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
")

(setf (get ramp_msgs::TrajectorySrvResponse :md5sum-) "8ccd59d329076db69674b9c52d4134e4")
(setf (get ramp_msgs::TrajectorySrvResponse :datatype-) "ramp_msgs/TrajectorySrvResponse")
(setf (get ramp_msgs::TrajectorySrvResponse :definition-)
      "TrajectoryRequest[] reqs


================================================================================
MSG: ramp_msgs/TrajectoryRequest
ramp_msgs/Path path
uint8 type 
bool print
ramp_msgs/BezierCurve[] bezierCurves
int8 segments
float64 max_speed_linear
float64 max_speed_angular

# For system-level test generation...
bool sl_traj
float64 sl_final_speed
duration sl_init_dur
duration sl_final_dur

================================================================================
MSG: ramp_msgs/Path
ramp_msgs/KnotPoint[] points

================================================================================
MSG: ramp_msgs/KnotPoint
ramp_msgs/MotionState motionState
uint32 stopTime

================================================================================
MSG: ramp_msgs/MotionState
float64[] positions
float64[] velocities
float64[] accelerations
float64[] jerks

# change to duration
float64 time

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
---

TrajectoryResponse[] resps


================================================================================
MSG: ramp_msgs/TrajectoryResponse
RampTrajectory trajectory
bool error

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
")



(provide :ramp_msgs/TrajectorySrv "8ccd59d329076db69674b9c52d4134e4")


