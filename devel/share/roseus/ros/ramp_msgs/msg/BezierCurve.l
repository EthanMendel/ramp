;; Auto-generated. Do not edit!


(when (boundp 'ramp_msgs::BezierCurve)
  (if (not (find-package "RAMP_MSGS"))
    (make-package "RAMP_MSGS"))
  (shadow 'BezierCurve (find-package "RAMP_MSGS")))
(unless (find-package "RAMP_MSGS::BEZIERCURVE")
  (make-package "RAMP_MSGS::BEZIERCURVE"))

(in-package "ROS")
;;//! \htmlinclude BezierCurve.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ramp_msgs::BezierCurve
  :super ros::object
  :slots (_header _points _u_values _segmentPoints _controlPoints _l _ms_maxVA _ms_initialVA _ms_begin _u_0 _u_dot_0 _u_dot_max _u_target ))

(defmethod ramp_msgs::BezierCurve
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:points __points) ())
    ((:u_values __u_values) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:segmentPoints __segmentPoints) ())
    ((:controlPoints __controlPoints) ())
    ((:l __l) 0.0)
    ((:ms_maxVA __ms_maxVA) (instance ramp_msgs::MotionState :init))
    ((:ms_initialVA __ms_initialVA) (instance ramp_msgs::MotionState :init))
    ((:ms_begin __ms_begin) (instance ramp_msgs::MotionState :init))
    ((:u_0 __u_0) 0.0)
    ((:u_dot_0 __u_dot_0) 0.0)
    ((:u_dot_max __u_dot_max) 0.0)
    ((:u_target __u_target) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _points __points)
   (setq _u_values __u_values)
   (setq _segmentPoints __segmentPoints)
   (setq _controlPoints __controlPoints)
   (setq _l (float __l))
   (setq _ms_maxVA __ms_maxVA)
   (setq _ms_initialVA __ms_initialVA)
   (setq _ms_begin __ms_begin)
   (setq _u_0 (float __u_0))
   (setq _u_dot_0 (float __u_dot_0))
   (setq _u_dot_max (float __u_dot_max))
   (setq _u_target (float __u_target))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:points
   (&rest __points)
   (if (keywordp (car __points))
       (send* _points __points)
     (progn
       (if __points (setq _points (car __points)))
       _points)))
  (:u_values
   (&optional __u_values)
   (if __u_values (setq _u_values __u_values)) _u_values)
  (:segmentPoints
   (&rest __segmentPoints)
   (if (keywordp (car __segmentPoints))
       (send* _segmentPoints __segmentPoints)
     (progn
       (if __segmentPoints (setq _segmentPoints (car __segmentPoints)))
       _segmentPoints)))
  (:controlPoints
   (&rest __controlPoints)
   (if (keywordp (car __controlPoints))
       (send* _controlPoints __controlPoints)
     (progn
       (if __controlPoints (setq _controlPoints (car __controlPoints)))
       _controlPoints)))
  (:l
   (&optional __l)
   (if __l (setq _l __l)) _l)
  (:ms_maxVA
   (&rest __ms_maxVA)
   (if (keywordp (car __ms_maxVA))
       (send* _ms_maxVA __ms_maxVA)
     (progn
       (if __ms_maxVA (setq _ms_maxVA (car __ms_maxVA)))
       _ms_maxVA)))
  (:ms_initialVA
   (&rest __ms_initialVA)
   (if (keywordp (car __ms_initialVA))
       (send* _ms_initialVA __ms_initialVA)
     (progn
       (if __ms_initialVA (setq _ms_initialVA (car __ms_initialVA)))
       _ms_initialVA)))
  (:ms_begin
   (&rest __ms_begin)
   (if (keywordp (car __ms_begin))
       (send* _ms_begin __ms_begin)
     (progn
       (if __ms_begin (setq _ms_begin (car __ms_begin)))
       _ms_begin)))
  (:u_0
   (&optional __u_0)
   (if __u_0 (setq _u_0 __u_0)) _u_0)
  (:u_dot_0
   (&optional __u_dot_0)
   (if __u_dot_0 (setq _u_dot_0 __u_dot_0)) _u_dot_0)
  (:u_dot_max
   (&optional __u_dot_max)
   (if __u_dot_max (setq _u_dot_max __u_dot_max)) _u_dot_max)
  (:u_target
   (&optional __u_target)
   (if __u_target (setq _u_target __u_target)) _u_target)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; ramp_msgs/MotionState[] _points
    (apply #'+ (send-all _points :serialization-length)) 4
    ;; float64[] _u_values
    (* 8    (length _u_values)) 4
    ;; ramp_msgs/MotionState[] _segmentPoints
    (apply #'+ (send-all _segmentPoints :serialization-length)) 4
    ;; ramp_msgs/MotionState[] _controlPoints
    (apply #'+ (send-all _controlPoints :serialization-length)) 4
    ;; float64 _l
    8
    ;; ramp_msgs/MotionState _ms_maxVA
    (send _ms_maxVA :serialization-length)
    ;; ramp_msgs/MotionState _ms_initialVA
    (send _ms_initialVA :serialization-length)
    ;; ramp_msgs/MotionState _ms_begin
    (send _ms_begin :serialization-length)
    ;; float64 _u_0
    8
    ;; float64 _u_dot_0
    8
    ;; float64 _u_dot_max
    8
    ;; float64 _u_target
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; ramp_msgs/MotionState[] _points
     (write-long (length _points) s)
     (dolist (elem _points)
       (send elem :serialize s)
       )
     ;; float64[] _u_values
     (write-long (length _u_values) s)
     (dotimes (i (length _u_values))
       (sys::poke (elt _u_values i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; ramp_msgs/MotionState[] _segmentPoints
     (write-long (length _segmentPoints) s)
     (dolist (elem _segmentPoints)
       (send elem :serialize s)
       )
     ;; ramp_msgs/MotionState[] _controlPoints
     (write-long (length _controlPoints) s)
     (dolist (elem _controlPoints)
       (send elem :serialize s)
       )
     ;; float64 _l
       (sys::poke _l (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; ramp_msgs/MotionState _ms_maxVA
       (send _ms_maxVA :serialize s)
     ;; ramp_msgs/MotionState _ms_initialVA
       (send _ms_initialVA :serialize s)
     ;; ramp_msgs/MotionState _ms_begin
       (send _ms_begin :serialize s)
     ;; float64 _u_0
       (sys::poke _u_0 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _u_dot_0
       (sys::poke _u_dot_0 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _u_dot_max
       (sys::poke _u_dot_max (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _u_target
       (sys::poke _u_target (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; ramp_msgs/MotionState[] _points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _points (let (r) (dotimes (i n) (push (instance ramp_msgs::MotionState :init) r)) r))
     (dolist (elem- _points)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; float64[] _u_values
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _u_values (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _u_values i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; ramp_msgs/MotionState[] _segmentPoints
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _segmentPoints (let (r) (dotimes (i n) (push (instance ramp_msgs::MotionState :init) r)) r))
     (dolist (elem- _segmentPoints)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; ramp_msgs/MotionState[] _controlPoints
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _controlPoints (let (r) (dotimes (i n) (push (instance ramp_msgs::MotionState :init) r)) r))
     (dolist (elem- _controlPoints)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; float64 _l
     (setq _l (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; ramp_msgs/MotionState _ms_maxVA
     (send _ms_maxVA :deserialize buf ptr-) (incf ptr- (send _ms_maxVA :serialization-length))
   ;; ramp_msgs/MotionState _ms_initialVA
     (send _ms_initialVA :deserialize buf ptr-) (incf ptr- (send _ms_initialVA :serialization-length))
   ;; ramp_msgs/MotionState _ms_begin
     (send _ms_begin :deserialize buf ptr-) (incf ptr- (send _ms_begin :serialization-length))
   ;; float64 _u_0
     (setq _u_0 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _u_dot_0
     (setq _u_dot_0 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _u_dot_max
     (setq _u_dot_max (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _u_target
     (setq _u_target (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get ramp_msgs::BezierCurve :md5sum-) "ce5eeb9cbad0aaaf351cc381d13ee193")
(setf (get ramp_msgs::BezierCurve :datatype-) "ramp_msgs/BezierCurve")
(setf (get ramp_msgs::BezierCurve :definition-)
      "Header header

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

================================================================================
MSG: ramp_msgs/MotionState
float64[] positions
float64[] velocities
float64[] accelerations
float64[] jerks

# change to duration
float64 time

")



(provide :ramp_msgs/BezierCurve "ce5eeb9cbad0aaaf351cc381d13ee193")


