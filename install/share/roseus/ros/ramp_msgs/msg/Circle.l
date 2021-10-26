;; Auto-generated. Do not edit!


(when (boundp 'ramp_msgs::Circle)
  (if (not (find-package "RAMP_MSGS"))
    (make-package "RAMP_MSGS"))
  (shadow 'Circle (find-package "RAMP_MSGS")))
(unless (find-package "RAMP_MSGS::CIRCLE")
  (make-package "RAMP_MSGS::CIRCLE"))

(in-package "ROS")
;;//! \htmlinclude Circle.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass ramp_msgs::Circle
  :super ros::object
  :slots (_center _radius ))

(defmethod ramp_msgs::Circle
  (:init
   (&key
    ((:center __center) (instance geometry_msgs::Vector3 :init))
    ((:radius __radius) 0.0)
    )
   (send-super :init)
   (setq _center __center)
   (setq _radius (float __radius))
   self)
  (:center
   (&rest __center)
   (if (keywordp (car __center))
       (send* _center __center)
     (progn
       (if __center (setq _center (car __center)))
       _center)))
  (:radius
   (&optional __radius)
   (if __radius (setq _radius __radius)) _radius)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Vector3 _center
    (send _center :serialization-length)
    ;; float64 _radius
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Vector3 _center
       (send _center :serialize s)
     ;; float64 _radius
       (sys::poke _radius (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Vector3 _center
     (send _center :deserialize buf ptr-) (incf ptr- (send _center :serialization-length))
   ;; float64 _radius
     (setq _radius (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get ramp_msgs::Circle :md5sum-) "ab296cd39c1a1fa7dd67209d6a4767e1")
(setf (get ramp_msgs::Circle :datatype-) "ramp_msgs/Circle")
(setf (get ramp_msgs::Circle :definition-)
      "geometry_msgs/Vector3 center
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



(provide :ramp_msgs/Circle "ab296cd39c1a1fa7dd67209d6a4767e1")


