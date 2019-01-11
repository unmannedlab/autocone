;; Auto-generated. Do not edit!


(when (boundp 'vn300::gps)
  (if (not (find-package "VN300"))
    (make-package "VN300"))
  (shadow 'gps (find-package "VN300")))
(unless (find-package "VN300::GPS")
  (make-package "VN300::GPS"))

(in-package "ROS")
;;//! \htmlinclude gps.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*GPSFIX_NO_FIX*" (find-package "VN300::GPS"))
(shadow '*GPSFIX_NO_FIX* (find-package "VN300::GPS"))
(defconstant vn300::gps::*GPSFIX_NO_FIX* 0)
(intern "*GPSFIX_TIME_ONLY*" (find-package "VN300::GPS"))
(shadow '*GPSFIX_TIME_ONLY* (find-package "VN300::GPS"))
(defconstant vn300::gps::*GPSFIX_TIME_ONLY* 1)
(intern "*GPSFIX_2D_FIX*" (find-package "VN300::GPS"))
(shadow '*GPSFIX_2D_FIX* (find-package "VN300::GPS"))
(defconstant vn300::gps::*GPSFIX_2D_FIX* 3)
(intern "*GPSFIX_3D_FIX*" (find-package "VN300::GPS"))
(shadow '*GPSFIX_3D_FIX* (find-package "VN300::GPS"))
(defconstant vn300::gps::*GPSFIX_3D_FIX* 4)
(defclass vn300::gps
  :super ros::object
  :slots (_header _Time _UtcTime _Week _GpsFix _NumSats _LLA _NedVel _NedAcc _SpeedAcc _TimeAcc ))

(defmethod vn300::gps
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:Time __Time) 0.0)
    ((:UtcTime __UtcTime) (instance vn300::utc_time :init))
    ((:Week __Week) 0)
    ((:GpsFix __GpsFix) 0)
    ((:NumSats __NumSats) 0)
    ((:LLA __LLA) (instance geometry_msgs::Vector3 :init))
    ((:NedVel __NedVel) (instance geometry_msgs::Vector3 :init))
    ((:NedAcc __NedAcc) (instance geometry_msgs::Vector3 :init))
    ((:SpeedAcc __SpeedAcc) 0.0)
    ((:TimeAcc __TimeAcc) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _Time (float __Time))
   (setq _UtcTime __UtcTime)
   (setq _Week (round __Week))
   (setq _GpsFix (round __GpsFix))
   (setq _NumSats (round __NumSats))
   (setq _LLA __LLA)
   (setq _NedVel __NedVel)
   (setq _NedAcc __NedAcc)
   (setq _SpeedAcc (float __SpeedAcc))
   (setq _TimeAcc (float __TimeAcc))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:Time
   (&optional __Time)
   (if __Time (setq _Time __Time)) _Time)
  (:UtcTime
   (&rest __UtcTime)
   (if (keywordp (car __UtcTime))
       (send* _UtcTime __UtcTime)
     (progn
       (if __UtcTime (setq _UtcTime (car __UtcTime)))
       _UtcTime)))
  (:Week
   (&optional __Week)
   (if __Week (setq _Week __Week)) _Week)
  (:GpsFix
   (&optional __GpsFix)
   (if __GpsFix (setq _GpsFix __GpsFix)) _GpsFix)
  (:NumSats
   (&optional __NumSats)
   (if __NumSats (setq _NumSats __NumSats)) _NumSats)
  (:LLA
   (&rest __LLA)
   (if (keywordp (car __LLA))
       (send* _LLA __LLA)
     (progn
       (if __LLA (setq _LLA (car __LLA)))
       _LLA)))
  (:NedVel
   (&rest __NedVel)
   (if (keywordp (car __NedVel))
       (send* _NedVel __NedVel)
     (progn
       (if __NedVel (setq _NedVel (car __NedVel)))
       _NedVel)))
  (:NedAcc
   (&rest __NedAcc)
   (if (keywordp (car __NedAcc))
       (send* _NedAcc __NedAcc)
     (progn
       (if __NedAcc (setq _NedAcc (car __NedAcc)))
       _NedAcc)))
  (:SpeedAcc
   (&optional __SpeedAcc)
   (if __SpeedAcc (setq _SpeedAcc __SpeedAcc)) _SpeedAcc)
  (:TimeAcc
   (&optional __TimeAcc)
   (if __TimeAcc (setq _TimeAcc __TimeAcc)) _TimeAcc)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _Time
    8
    ;; vn300/utc_time _UtcTime
    (send _UtcTime :serialization-length)
    ;; uint16 _Week
    2
    ;; uint8 _GpsFix
    1
    ;; uint8 _NumSats
    1
    ;; geometry_msgs/Vector3 _LLA
    (send _LLA :serialization-length)
    ;; geometry_msgs/Vector3 _NedVel
    (send _NedVel :serialization-length)
    ;; geometry_msgs/Vector3 _NedAcc
    (send _NedAcc :serialization-length)
    ;; float32 _SpeedAcc
    4
    ;; float32 _TimeAcc
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _Time
       (sys::poke _Time (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; vn300/utc_time _UtcTime
       (send _UtcTime :serialize s)
     ;; uint16 _Week
       (write-word _Week s)
     ;; uint8 _GpsFix
       (write-byte _GpsFix s)
     ;; uint8 _NumSats
       (write-byte _NumSats s)
     ;; geometry_msgs/Vector3 _LLA
       (send _LLA :serialize s)
     ;; geometry_msgs/Vector3 _NedVel
       (send _NedVel :serialize s)
     ;; geometry_msgs/Vector3 _NedAcc
       (send _NedAcc :serialize s)
     ;; float32 _SpeedAcc
       (sys::poke _SpeedAcc (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _TimeAcc
       (sys::poke _TimeAcc (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _Time
     (setq _Time (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; vn300/utc_time _UtcTime
     (send _UtcTime :deserialize buf ptr-) (incf ptr- (send _UtcTime :serialization-length))
   ;; uint16 _Week
     (setq _Week (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _GpsFix
     (setq _GpsFix (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _NumSats
     (setq _NumSats (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; geometry_msgs/Vector3 _LLA
     (send _LLA :deserialize buf ptr-) (incf ptr- (send _LLA :serialization-length))
   ;; geometry_msgs/Vector3 _NedVel
     (send _NedVel :deserialize buf ptr-) (incf ptr- (send _NedVel :serialization-length))
   ;; geometry_msgs/Vector3 _NedAcc
     (send _NedAcc :deserialize buf ptr-) (incf ptr- (send _NedAcc :serialization-length))
   ;; float32 _SpeedAcc
     (setq _SpeedAcc (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _TimeAcc
     (setq _TimeAcc (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get vn300::gps :md5sum-) "e00674819c464d1fc718e59b64d93387")
(setf (get vn300::gps :datatype-) "vn300/gps")
(setf (get vn300::gps :definition-)
      "std_msgs/Header       header
float64               Time
utc_time	          UtcTime
uint16                Week
uint8                 GpsFix
uint8                 NumSats
geometry_msgs/Vector3 LLA
geometry_msgs/Vector3 NedVel
geometry_msgs/Vector3 NedAcc
float32               SpeedAcc
float32               TimeAcc


uint8 GPSFIX_NO_FIX=0
uint8 GPSFIX_TIME_ONLY=1
uint8 GPSFIX_2D_FIX=3
uint8 GPSFIX_3D_FIX=4

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
MSG: vn300/utc_time
uint8 year
uint8 month
uint8 day
uint8 hour
uint8 minute
uint8 second
uint16 millisecond

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



(provide :vn300/gps "e00674819c464d1fc718e59b64d93387")


