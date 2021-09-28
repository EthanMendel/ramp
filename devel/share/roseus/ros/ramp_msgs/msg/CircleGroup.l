;; Auto-generated. Do not edit!


(when (boundp 'ramp_msgs::CircleGroup)
  (if (not (find-package "RAMP_MSGS"))
    (make-package "RAMP_MSGS"))
  (shadow 'CircleGroup (find-package "RAMP_MSGS")))
(unless (find-package "RAMP_MSGS::CIRCLEGROUP")
  (make-package "RAMP_MSGS::CIRCLEGROUP"))

(in-package "ROS")
;;//! \htmlinclude CircleGroup.msg.html


(defclass ramp_msgs::CircleGroup
  :super ros::object
  :slots (_fitCir _packedCirs ))

(defmethod ramp_msgs::CircleGroup
  (:init
   (&key
    ((:fitCir __fitCir) (instance ramp_msgs::Circle :init))
    ((:packedCirs __packedCirs) ())
    )
   (send-super :init)
   (setq _fitCir __fitCir)
   (setq _packedCirs __packedCirs)
   self)
  (:fitCir
   (&rest __fitCir)
   (if (keywordp (car __fitCir))
       (send* _fitCir __fitCir)
     (progn
       (if __fitCir (setq _fitCir (car __fitCir)))
       _fitCir)))
  (:packedCirs
   (&rest __packedCirs)
   (if (keywordp (car __packedCirs))
       (send* _packedCirs __packedCirs)
     (progn
       (if __packedCirs (setq _packedCirs (car __packedCirs)))
       _packedCirs)))
  (:serialization-length
   ()
   (+
    ;; ramp_msgs/Circle _fitCir
    (send _fitCir :serialization-length)
    ;; ramp_msgs/Circle[] _packedCirs
    (apply #'+ (send-all _packedCirs :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; ramp_msgs/Circle _fitCir
       (send _fitCir :serialize s)
     ;; ramp_msgs/Circle[] _packedCirs
     (write-long (length _packedCirs) s)
     (dolist (elem _packedCirs)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; ramp_msgs/Circle _fitCir
     (send _fitCir :deserialize buf ptr-) (incf ptr- (send _fitCir :serialization-length))
   ;; ramp_msgs/Circle[] _packedCirs
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _packedCirs (let (r) (dotimes (i n) (push (instance ramp_msgs::Circle :init) r)) r))
     (dolist (elem- _packedCirs)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get ramp_msgs::CircleGroup :md5sum-) "9a0c5849cc79a80224d0f73cc03d9dab")
(setf (get ramp_msgs::CircleGroup :datatype-) "ramp_msgs/CircleGroup")
(setf (get ramp_msgs::CircleGroup :definition-)
      "ramp_msgs/Circle fitCir
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
float64 z
")



(provide :ramp_msgs/CircleGroup "9a0c5849cc79a80224d0f73cc03d9dab")


