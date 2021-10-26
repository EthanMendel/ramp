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
  :slots (_paths _op _repair_dist _repair_dir _repair_ob_r ))

(defmethod ramp_msgs::ModificationRequestRequest
  (:init
   (&key
    ((:paths __paths) ())
    ((:op __op) "")
    ((:repair_dist __repair_dist) 0.0)
    ((:repair_dir __repair_dir) 0.0)
    ((:repair_ob_r __repair_ob_r) 0.0)
    )
   (send-super :init)
   (setq _paths __paths)
   (setq _op (string __op))
   (setq _repair_dist (float __repair_dist))
   (setq _repair_dir (float __repair_dir))
   (setq _repair_ob_r (float __repair_ob_r))
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
  (:repair_dist
   (&optional __repair_dist)
   (if __repair_dist (setq _repair_dist __repair_dist)) _repair_dist)
  (:repair_dir
   (&optional __repair_dir)
   (if __repair_dir (setq _repair_dir __repair_dir)) _repair_dir)
  (:repair_ob_r
   (&optional __repair_ob_r)
   (if __repair_ob_r (setq _repair_ob_r __repair_ob_r)) _repair_ob_r)
  (:serialization-length
   ()
   (+
    ;; ramp_msgs/Path[] _paths
    (apply #'+ (send-all _paths :serialization-length)) 4
    ;; string _op
    4 (length _op)
    ;; float64 _repair_dist
    8
    ;; float64 _repair_dir
    8
    ;; float64 _repair_ob_r
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
     ;; float64 _repair_dist
       (sys::poke _repair_dist (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _repair_dir
       (sys::poke _repair_dir (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _repair_ob_r
       (sys::poke _repair_ob_r (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
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
   ;; float64 _repair_dist
     (setq _repair_dist (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _repair_dir
     (setq _repair_dir (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _repair_ob_r
     (setq _repair_ob_r (sys::peek buf ptr- :double)) (incf ptr- 8)
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

(setf (get ramp_msgs::ModificationRequest :md5sum-) "e2f4c66b0fd63d5e71b5be50fa7c661e")
(setf (get ramp_msgs::ModificationRequest :datatype-) "ramp_msgs/ModificationRequest")
(setf (get ramp_msgs::ModificationRequest :request) ramp_msgs::ModificationRequestRequest)
(setf (get ramp_msgs::ModificationRequest :response) ramp_msgs::ModificationRequestResponse)

(defmethod ramp_msgs::ModificationRequestRequest
  (:response () (instance ramp_msgs::ModificationRequestResponse :init)))

(setf (get ramp_msgs::ModificationRequestRequest :md5sum-) "e2f4c66b0fd63d5e71b5be50fa7c661e")
(setf (get ramp_msgs::ModificationRequestRequest :datatype-) "ramp_msgs/ModificationRequestRequest")
(setf (get ramp_msgs::ModificationRequestRequest :definition-)
      "Path[] paths
string op
float64 repair_dist
float64 repair_dir
float64 repair_ob_r


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

(setf (get ramp_msgs::ModificationRequestResponse :md5sum-) "e2f4c66b0fd63d5e71b5be50fa7c661e")
(setf (get ramp_msgs::ModificationRequestResponse :datatype-) "ramp_msgs/ModificationRequestResponse")
(setf (get ramp_msgs::ModificationRequestResponse :definition-)
      "Path[] paths
string op
float64 repair_dist
float64 repair_dir
float64 repair_ob_r


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



(provide :ramp_msgs/ModificationRequest "e2f4c66b0fd63d5e71b5be50fa7c661e")


