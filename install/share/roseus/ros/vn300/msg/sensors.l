;; Auto-generated. Do not edit!


(when (boundp 'vn300::sensors)
  (if (not (find-package "VN300"))
    (make-package "VN300"))
  (shadow 'sensors (find-package "VN300")))
(unless (find-package "VN300::SENSORS")
  (make-package "VN300::SENSORS"))

(in-package "ROS")
;;//! \htmlinclude sensors.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass vn300::sensors
  :super ros::object
  :slots (_header _gps_time _Mag _Accel _Gyro _Temp _Pressure ))

(defmethod vn300::sensors
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:gps_time __gps_time) 0.0)
    ((:Mag __Mag) (instance geometry_msgs::Vector3 :init))
    ((:Accel __Accel) (instance geometry_msgs::Vector3 :init))
    ((:Gyro __Gyro) (instance geometry_msgs::Vector3 :init))
    ((:Temp __Temp) 0.0)
    ((:Pressure __Pressure) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _gps_time (float __gps_time))
   (setq _Mag __Mag)
   (setq _Accel __Accel)
   (setq _Gyro __Gyro)
   (setq _Temp (float __Temp))
   (setq _Pressure (float __Pressure))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:gps_time
   (&optional __gps_time)
   (if __gps_time (setq _gps_time __gps_time)) _gps_time)
  (:Mag
   (&rest __Mag)
   (if (keywordp (car __Mag))
       (send* _Mag __Mag)
     (progn
       (if __Mag (setq _Mag (car __Mag)))
       _Mag)))
  (:Accel
   (&rest __Accel)
   (if (keywordp (car __Accel))
       (send* _Accel __Accel)
     (progn
       (if __Accel (setq _Accel (car __Accel)))
       _Accel)))
  (:Gyro
   (&rest __Gyro)
   (if (keywordp (car __Gyro))
       (send* _Gyro __Gyro)
     (progn
       (if __Gyro (setq _Gyro (car __Gyro)))
       _Gyro)))
  (:Temp
   (&optional __Temp)
   (if __Temp (setq _Temp __Temp)) _Temp)
  (:Pressure
   (&optional __Pressure)
   (if __Pressure (setq _Pressure __Pressure)) _Pressure)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _gps_time
    8
    ;; geometry_msgs/Vector3 _Mag
    (send _Mag :serialization-length)
    ;; geometry_msgs/Vector3 _Accel
    (send _Accel :serialization-length)
    ;; geometry_msgs/Vector3 _Gyro
    (send _Gyro :serialization-length)
    ;; float32 _Temp
    4
    ;; float32 _Pressure
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _gps_time
       (sys::poke _gps_time (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; geometry_msgs/Vector3 _Mag
       (send _Mag :serialize s)
     ;; geometry_msgs/Vector3 _Accel
       (send _Accel :serialize s)
     ;; geometry_msgs/Vector3 _Gyro
       (send _Gyro :serialize s)
     ;; float32 _Temp
       (sys::poke _Temp (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Pressure
       (sys::poke _Pressure (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _gps_time
     (setq _gps_time (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; geometry_msgs/Vector3 _Mag
     (send _Mag :deserialize buf ptr-) (incf ptr- (send _Mag :serialization-length))
   ;; geometry_msgs/Vector3 _Accel
     (send _Accel :deserialize buf ptr-) (incf ptr- (send _Accel :serialization-length))
   ;; geometry_msgs/Vector3 _Gyro
     (send _Gyro :deserialize buf ptr-) (incf ptr- (send _Gyro :serialization-length))
   ;; float32 _Temp
     (setq _Temp (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Pressure
     (setq _Pressure (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get vn300::sensors :md5sum-) "39b3da64afd92d016eb0b8e07688fc15")
(setf (get vn300::sensors :datatype-) "vn300/sensors")
(setf (get vn300::sensors :definition-)
      "std_msgs/Header       header
float64		      gps_time
geometry_msgs/Vector3 Mag 
geometry_msgs/Vector3 Accel
geometry_msgs/Vector3 Gyro
float32               Temp
float32               Pressure



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
# 0: no frame
# 1: global frame
string frame_id

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



(provide :vn300/sensors "39b3da64afd92d016eb0b8e07688fc15")


