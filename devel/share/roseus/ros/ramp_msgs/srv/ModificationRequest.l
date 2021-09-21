;; Auto-generated. Do not edit!


(when (boundp 'ramp_msgs::ModificationRequest)
  (if (not (find-package "RAMP_MSGS"))
    (make-package "RAMP_MSGS"))
  (shadow 'ModificationRequest (find-package "RAMP_MSGS")))
(unless (find-package "RAMP_MSGS::MODIFICATIONREQUEST")
  (make-package "RAMP_MSGS::MODIFICATIONREQUEST"))
(unless (find-package "RAMP_MSGS::MODIFICATIONREQUESTREQUEST")
  (make-package "RAMP_MSGS::MODIFICATIONREQUESTREQUEST"))
(unless (find-package "RAMP_MSGS::MODIFICATIONREQUESTRESPONSE")
  (make-package "RAMP_MSGS::MODIFICATIONREQUESTRESPONSE"))

(in-package "ROS")





(defclass ramp_msgs::ModificationRequestRequest
  :super ros::object
  :slots (_paths _op _move_dist _move_dir ))

(defmethod ramp_msgs::ModificationRequestRequest
  (:init
   (&key
    ((:paths __paths) ())
    ((:op __op) "")
    ((:move_dist __move_dist) 0.0)
    ((:move_dir __move_dir) 0.0)
    )
   (send-super :init)
   (setq _paths __paths)
   (setq _op (string __op))
   (setq _move_dist (float __move_dist))
   (setq _move_dir (float __move_dir))
   self)
  (:paths
   (&rest __paths)
   (if (keywordp (car __paths))
       (send* _paths __paths)
     (progn
       (if __paths (setq _paths (car __paths)))
       _paths)))
  (:op
   (&optional __op)
   (if __op (setq _op __op)) _op)
  (:move_dist
   (&optional __move_dist)
   (if __move_dist (setq _move_dist __move_dist)) _move_dist)
  (:move_dir
   (&optional __move_dir)
   (if __move_dir (setq _move_dir __move_dir)) _move_dir)
  (:serialization-length
   ()
   (+
    ;; ramp_msgs/Path[] _paths
    (apply #'+ (send-all _paths :serialization-length)) 4
    ;; string _op
    4 (length _op)
    ;; float64 _move_dist
    8
    ;; float64 _move_dir
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; ramp_msgs/Path[] _paths
     (write-long (length _paths) s)
     (dolist (elem _paths)
       (send elem :serialize s)
       )
     ;; string _op
       (write-long (length _op) s) (princ _op s)
     ;; float64 _move_dist
       (sys::poke _move_dist (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _move_dir
       (sys::poke _move_dir (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; ramp_msgs/Path[] _paths
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _paths (let (r) (dotimes (i n) (push (instance ramp_msgs::Path :init) r)) r))
     (dolist (elem- _paths)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; string _op
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _op (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _move_dist
     (setq _move_dist (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _move_dir
     (setq _move_dir (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass ramp_msgs::ModificationRequestResponse
  :super ros::object
  :slots (_mod_paths ))

(defmethod ramp_msgs::ModificationRequestResponse
  (:init
   (&key
    ((:mod_paths __mod_paths) ())
    )
   (send-super :init)
   (setq _mod_paths __mod_paths)
   self)
  (:mod_paths
   (&rest __mod_paths)
   (if (keywordp (car __mod_paths))
       (send* _mod_paths __mod_paths)
     (progn
       (if __mod_paths (setq _mod_paths (car __mod_paths)))
       _mod_paths)))
  (:serialization-length
   ()
   (+
    ;; ramp_msgs/Path[] _mod_paths
    (apply #'+ (send-all _mod_paths :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; ramp_msgs/Path[] _mod_paths
     (write-long (length _mod_paths) s)
     (dolist (elem _mod_paths)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; ramp_msgs/Path[] _mod_paths
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _mod_paths (let (r) (dotimes (i n) (push (instance ramp_msgs::Path :init) r)) r))
     (dolist (elem- _mod_paths)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass ramp_msgs::ModificationRequest
  :super ros::object
  :slots ())

(setf (get ramp_msgs::ModificationRequest :md5sum-) "81d0e2ec37dd2f917b71cfdf955b990d")
(setf (get ramp_msgs::ModificationRequest :datatype-) "ramp_msgs/ModificationRequest")
(setf (get ramp_msgs::ModificationRequest :request) ramp_msgs::ModificationRequestRequest)
(setf (get ramp_msgs::ModificationRequest :response) ramp_msgs::ModificationRequestResponse)

(defmethod ramp_msgs::ModificationRequestRequest
  (:response () (instance ramp_msgs::ModificationRequestResponse :init)))

(setf (get ramp_msgs::ModificationRequestRequest :md5sum-) "81d0e2ec37dd2f917b71cfdf955b990d")
(setf (get ramp_msgs::ModificationRequestRequest :datatype-) "ramp_msgs/ModificationRequestRequest")
(setf (get ramp_msgs::ModificationRequestRequest :definition-)
      "Path[] paths
string op
float64 move_dist
float64 move_dir


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
---

Path[]  mod_paths


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
")

(setf (get ramp_msgs::ModificationRequestResponse :md5sum-) "81d0e2ec37dd2f917b71cfdf955b990d")
(setf (get ramp_msgs::ModificationRequestResponse :datatype-) "ramp_msgs/ModificationRequestResponse")
(setf (get ramp_msgs::ModificationRequestResponse :definition-)
      "Path[] paths
string op
float64 move_dist
float64 move_dir


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
---

Path[]  mod_paths


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
")



(provide :ramp_msgs/ModificationRequest "81d0e2ec37dd2f917b71cfdf955b990d")


