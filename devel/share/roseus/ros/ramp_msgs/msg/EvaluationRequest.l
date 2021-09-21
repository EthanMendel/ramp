;; Auto-generated. Do not edit!


(when (boundp 'ramp_msgs::EvaluationRequest)
  (if (not (find-package "RAMP_MSGS"))
    (make-package "RAMP_MSGS"))
  (shadow 'EvaluationRequest (find-package "RAMP_MSGS")))
(unless (find-package "RAMP_MSGS::EVALUATIONREQUEST")
  (make-package "RAMP_MSGS::EVALUATIONREQUEST"))

(in-package "ROS")
;;//! \htmlinclude EvaluationRequest.msg.html


(defclass ramp_msgs::EvaluationRequest
  :super ros::object
  :slots (_trajectory _currentTheta _theta_cc _obstacle_trjs _imminent_collision _coll_dist _offset _full_eval _consider_trans _trans_possible ))

(defmethod ramp_msgs::EvaluationRequest
  (:init
   (&key
    ((:trajectory __trajectory) (instance ramp_msgs::RampTrajectory :init))
    ((:currentTheta __currentTheta) 0.0)
    ((:theta_cc __theta_cc) 0.0)
    ((:obstacle_trjs __obstacle_trjs) ())
    ((:imminent_collision __imminent_collision) nil)
    ((:coll_dist __coll_dist) 0.0)
    ((:offset __offset) 0.0)
    ((:full_eval __full_eval) nil)
    ((:consider_trans __consider_trans) nil)
    ((:trans_possible __trans_possible) nil)
    )
   (send-super :init)
   (setq _trajectory __trajectory)
   (setq _currentTheta (float __currentTheta))
   (setq _theta_cc (float __theta_cc))
   (setq _obstacle_trjs __obstacle_trjs)
   (setq _imminent_collision __imminent_collision)
   (setq _coll_dist (float __coll_dist))
   (setq _offset (float __offset))
   (setq _full_eval __full_eval)
   (setq _consider_trans __consider_trans)
   (setq _trans_possible __trans_possible)
   self)
  (:trajectory
   (&rest __trajectory)
   (if (keywordp (car __trajectory))
       (send* _trajectory __trajectory)
     (progn
       (if __trajectory (setq _trajectory (car __trajectory)))
       _trajectory)))
  (:currentTheta
   (&optional __currentTheta)
   (if __currentTheta (setq _currentTheta __currentTheta)) _currentTheta)
  (:theta_cc
   (&optional __theta_cc)
   (if __theta_cc (setq _theta_cc __theta_cc)) _theta_cc)
  (:obstacle_trjs
   (&rest __obstacle_trjs)
   (if (keywordp (car __obstacle_trjs))
       (send* _obstacle_trjs __obstacle_trjs)
     (progn
       (if __obstacle_trjs (setq _obstacle_trjs (car __obstacle_trjs)))
       _obstacle_trjs)))
  (:imminent_collision
   (&optional (__imminent_collision :null))
   (if (not (eq __imminent_collision :null)) (setq _imminent_collision __imminent_collision)) _imminent_collision)
  (:coll_dist
   (&optional __coll_dist)
   (if __coll_dist (setq _coll_dist __coll_dist)) _coll_dist)
  (:offset
   (&optional __offset)
   (if __offset (setq _offset __offset)) _offset)
  (:full_eval
   (&optional (__full_eval :null))
   (if (not (eq __full_eval :null)) (setq _full_eval __full_eval)) _full_eval)
  (:consider_trans
   (&optional (__consider_trans :null))
   (if (not (eq __consider_trans :null)) (setq _consider_trans __consider_trans)) _consider_trans)
  (:trans_possible
   (&optional (__trans_possible :null))
   (if (not (eq __trans_possible :null)) (setq _trans_possible __trans_possible)) _trans_possible)
  (:serialization-length
   ()
   (+
    ;; ramp_msgs/RampTrajectory _trajectory
    (send _trajectory :serialization-length)
    ;; float64 _currentTheta
    8
    ;; float64 _theta_cc
    8
    ;; ramp_msgs/RampTrajectory[] _obstacle_trjs
    (apply #'+ (send-all _obstacle_trjs :serialization-length)) 4
    ;; bool _imminent_collision
    1
    ;; float64 _coll_dist
    8
    ;; float64 _offset
    8
    ;; bool _full_eval
    1
    ;; bool _consider_trans
    1
    ;; bool _trans_possible
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; ramp_msgs/RampTrajectory _trajectory
       (send _trajectory :serialize s)
     ;; float64 _currentTheta
       (sys::poke _currentTheta (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _theta_cc
       (sys::poke _theta_cc (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; ramp_msgs/RampTrajectory[] _obstacle_trjs
     (write-long (length _obstacle_trjs) s)
     (dolist (elem _obstacle_trjs)
       (send elem :serialize s)
       )
     ;; bool _imminent_collision
       (if _imminent_collision (write-byte -1 s) (write-byte 0 s))
     ;; float64 _coll_dist
       (sys::poke _coll_dist (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _offset
       (sys::poke _offset (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _full_eval
       (if _full_eval (write-byte -1 s) (write-byte 0 s))
     ;; bool _consider_trans
       (if _consider_trans (write-byte -1 s) (write-byte 0 s))
     ;; bool _trans_possible
       (if _trans_possible (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; ramp_msgs/RampTrajectory _trajectory
     (send _trajectory :deserialize buf ptr-) (incf ptr- (send _trajectory :serialization-length))
   ;; float64 _currentTheta
     (setq _currentTheta (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _theta_cc
     (setq _theta_cc (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; ramp_msgs/RampTrajectory[] _obstacle_trjs
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _obstacle_trjs (let (r) (dotimes (i n) (push (instance ramp_msgs::RampTrajectory :init) r)) r))
     (dolist (elem- _obstacle_trjs)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; bool _imminent_collision
     (setq _imminent_collision (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float64 _coll_dist
     (setq _coll_dist (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _offset
     (setq _offset (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _full_eval
     (setq _full_eval (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _consider_trans
     (setq _consider_trans (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _trans_possible
     (setq _trans_possible (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get ramp_msgs::EvaluationRequest :md5sum-) "8964e17c705f63c522df77b43636a204")
(setf (get ramp_msgs::EvaluationRequest :datatype-) "ramp_msgs/EvaluationRequest")
(setf (get ramp_msgs::EvaluationRequest :definition-)
      "RampTrajectory trajectory
float64 currentTheta
float64 theta_cc
RampTrajectory[] obstacle_trjs
bool imminent_collision
float64 coll_dist
float64 offset
bool full_eval

bool consider_trans
bool trans_possible

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



(provide :ramp_msgs/EvaluationRequest "8964e17c705f63c522df77b43636a204")


