;; Auto-generated. Do not edit!


(when (boundp 'vn300::ins)
  (if (not (find-package "VN300"))
    (make-package "VN300"))
  (shadow 'ins (find-package "VN300")))
(unless (find-package "VN300::INS")
  (make-package "VN300::INS"))

(in-package "ROS")
;;//! \htmlinclude ins.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*STATUS_INSUFFICIENT_MOTION*" (find-package "VN300::INS"))
(shadow '*STATUS_INSUFFICIENT_MOTION* (find-package "VN300::INS"))
(defconstant vn300::ins::*STATUS_INSUFFICIENT_MOTION* 1)
(intern "*STATUS_INS_OK*" (find-package "VN300::INS"))
(shadow '*STATUS_INS_OK* (find-package "VN300::INS"))
(defconstant vn300::ins::*STATUS_INS_OK* 2)
(intern "*STATUS_GPS_FIX_OK*" (find-package "VN300::INS"))
(shadow '*STATUS_GPS_FIX_OK* (find-package "VN300::INS"))
(defconstant vn300::ins::*STATUS_GPS_FIX_OK* 4)
(intern "*STATUS_SENSOR_ERROR_TIME*" (find-package "VN300::INS"))
(shadow '*STATUS_SENSOR_ERROR_TIME* (find-package "VN300::INS"))
(defconstant vn300::ins::*STATUS_SENSOR_ERROR_TIME* 8)
(intern "*STATUS_SENSOR_ERROR_IMU*" (find-package "VN300::INS"))
(shadow '*STATUS_SENSOR_ERROR_IMU* (find-package "VN300::INS"))
(defconstant vn300::ins::*STATUS_SENSOR_ERROR_IMU* 16)
(intern "*STATUS_SENSOR_ERROR_MAG*" (find-package "VN300::INS"))
(shadow '*STATUS_SENSOR_ERROR_MAG* (find-package "VN300::INS"))
(defconstant vn300::ins::*STATUS_SENSOR_ERROR_MAG* 32)
(intern "*STATUS_SENSOR_ERROR_GPS*" (find-package "VN300::INS"))
(shadow '*STATUS_SENSOR_ERROR_GPS* (find-package "VN300::INS"))
(defconstant vn300::ins::*STATUS_SENSOR_ERROR_GPS* 64)
(defclass vn300::ins
  :super ros::object
  :slots (_header _Time _Week _Status _RPY _LLA _NedVel _YawUncertainty _PitchUncertainty _RollUncertainty _PosUncertainty _VelUncertainty _SyncInTime _SyncInCount ))

(defmethod vn300::ins
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:Time __Time) 0.0)
    ((:Week __Week) 0)
    ((:Status __Status) 0)
    ((:RPY __RPY) (instance geometry_msgs::Vector3 :init))
    ((:LLA __LLA) (instance geometry_msgs::Vector3 :init))
    ((:NedVel __NedVel) (instance geometry_msgs::Vector3 :init))
    ((:YawUncertainty __YawUncertainty) 0.0)
    ((:PitchUncertainty __PitchUncertainty) 0.0)
    ((:RollUncertainty __RollUncertainty) 0.0)
    ((:PosUncertainty __PosUncertainty) 0.0)
    ((:VelUncertainty __VelUncertainty) 0.0)
    ((:SyncInTime __SyncInTime) 0.0)
    ((:SyncInCount __SyncInCount) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _Time (float __Time))
   (setq _Week (round __Week))
   (setq _Status (round __Status))
   (setq _RPY __RPY)
   (setq _LLA __LLA)
   (setq _NedVel __NedVel)
   (setq _YawUncertainty (float __YawUncertainty))
   (setq _PitchUncertainty (float __PitchUncertainty))
   (setq _RollUncertainty (float __RollUncertainty))
   (setq _PosUncertainty (float __PosUncertainty))
   (setq _VelUncertainty (float __VelUncertainty))
   (setq _SyncInTime (float __SyncInTime))
   (setq _SyncInCount (round __SyncInCount))
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
  (:Week
   (&optional __Week)
   (if __Week (setq _Week __Week)) _Week)
  (:Status
   (&optional __Status)
   (if __Status (setq _Status __Status)) _Status)
  (:RPY
   (&rest __RPY)
   (if (keywordp (car __RPY))
       (send* _RPY __RPY)
     (progn
       (if __RPY (setq _RPY (car __RPY)))
       _RPY)))
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
  (:YawUncertainty
   (&optional __YawUncertainty)
   (if __YawUncertainty (setq _YawUncertainty __YawUncertainty)) _YawUncertainty)
  (:PitchUncertainty
   (&optional __PitchUncertainty)
   (if __PitchUncertainty (setq _PitchUncertainty __PitchUncertainty)) _PitchUncertainty)
  (:RollUncertainty
   (&optional __RollUncertainty)
   (if __RollUncertainty (setq _RollUncertainty __RollUncertainty)) _RollUncertainty)
  (:PosUncertainty
   (&optional __PosUncertainty)
   (if __PosUncertainty (setq _PosUncertainty __PosUncertainty)) _PosUncertainty)
  (:VelUncertainty
   (&optional __VelUncertainty)
   (if __VelUncertainty (setq _VelUncertainty __VelUncertainty)) _VelUncertainty)
  (:SyncInTime
   (&optional __SyncInTime)
   (if __SyncInTime (setq _SyncInTime __SyncInTime)) _SyncInTime)
  (:SyncInCount
   (&optional __SyncInCount)
   (if __SyncInCount (setq _SyncInCount __SyncInCount)) _SyncInCount)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _Time
    8
    ;; uint16 _Week
    2
    ;; uint16 _Status
    2
    ;; geometry_msgs/Vector3 _RPY
    (send _RPY :serialization-length)
    ;; geometry_msgs/Vector3 _LLA
    (send _LLA :serialization-length)
    ;; geometry_msgs/Vector3 _NedVel
    (send _NedVel :serialization-length)
    ;; float32 _YawUncertainty
    4
    ;; float32 _PitchUncertainty
    4
    ;; float32 _RollUncertainty
    4
    ;; float32 _PosUncertainty
    4
    ;; float32 _VelUncertainty
    4
    ;; float64 _SyncInTime
    8
    ;; uint32 _SyncInCount
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
     ;; uint16 _Week
       (write-word _Week s)
     ;; uint16 _Status
       (write-word _Status s)
     ;; geometry_msgs/Vector3 _RPY
       (send _RPY :serialize s)
     ;; geometry_msgs/Vector3 _LLA
       (send _LLA :serialize s)
     ;; geometry_msgs/Vector3 _NedVel
       (send _NedVel :serialize s)
     ;; float32 _YawUncertainty
       (sys::poke _YawUncertainty (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _PitchUncertainty
       (sys::poke _PitchUncertainty (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _RollUncertainty
       (sys::poke _RollUncertainty (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _PosUncertainty
       (sys::poke _PosUncertainty (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _VelUncertainty
       (sys::poke _VelUncertainty (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float64 _SyncInTime
       (sys::poke _SyncInTime (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; uint32 _SyncInCount
       (write-long _SyncInCount s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _Time
     (setq _Time (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint16 _Week
     (setq _Week (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _Status
     (setq _Status (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; geometry_msgs/Vector3 _RPY
     (send _RPY :deserialize buf ptr-) (incf ptr- (send _RPY :serialization-length))
   ;; geometry_msgs/Vector3 _LLA
     (send _LLA :deserialize buf ptr-) (incf ptr- (send _LLA :serialization-length))
   ;; geometry_msgs/Vector3 _NedVel
     (send _NedVel :deserialize buf ptr-) (incf ptr- (send _NedVel :serialization-length))
   ;; float32 _YawUncertainty
     (setq _YawUncertainty (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _PitchUncertainty
     (setq _PitchUncertainty (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _RollUncertainty
     (setq _RollUncertainty (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _PosUncertainty
     (setq _PosUncertainty (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _VelUncertainty
     (setq _VelUncertainty (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float64 _SyncInTime
     (setq _SyncInTime (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint32 _SyncInCount
     (setq _SyncInCount (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get vn300::ins :md5sum-) "6d73535fac7fc35ecd07989081b4b4e6")
(setf (get vn300::ins :datatype-) "vn300/ins")
(setf (get vn300::ins :definition-)
      "std_msgs/Header       header
float64               Time
uint16                Week
uint16                Status
geometry_msgs/Vector3 RPY
geometry_msgs/Vector3 LLA
geometry_msgs/Vector3 NedVel
float32               YawUncertainty
float32               PitchUncertainty
float32               RollUncertainty
float32               PosUncertainty
float32               VelUncertainty
float64               SyncInTime
uint32                SyncInCount

uint16 STATUS_INSUFFICIENT_MOTION=1
uint16 STATUS_INS_OK=2
uint16 STATUS_GPS_FIX_OK=4
uint16 STATUS_SENSOR_ERROR_TIME=8
uint16 STATUS_SENSOR_ERROR_IMU=16
uint16 STATUS_SENSOR_ERROR_MAG=32
uint16 STATUS_SENSOR_ERROR_GPS=64



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



(provide :vn300/ins "6d73535fac7fc35ecd07989081b4b4e6")


