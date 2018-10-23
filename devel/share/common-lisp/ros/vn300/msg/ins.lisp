; Auto-generated. Do not edit!


(cl:in-package vn300-msg)


;//! \htmlinclude ins.msg.html

(cl:defclass <ins> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (Time
    :reader Time
    :initarg :Time
    :type cl:float
    :initform 0.0)
   (Week
    :reader Week
    :initarg :Week
    :type cl:fixnum
    :initform 0)
   (Status
    :reader Status
    :initarg :Status
    :type cl:fixnum
    :initform 0)
   (RPY
    :reader RPY
    :initarg :RPY
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (LLA
    :reader LLA
    :initarg :LLA
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (NedVel
    :reader NedVel
    :initarg :NedVel
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (YawUncertainty
    :reader YawUncertainty
    :initarg :YawUncertainty
    :type cl:float
    :initform 0.0)
   (PitchUncertainty
    :reader PitchUncertainty
    :initarg :PitchUncertainty
    :type cl:float
    :initform 0.0)
   (RollUncertainty
    :reader RollUncertainty
    :initarg :RollUncertainty
    :type cl:float
    :initform 0.0)
   (PosUncertainty
    :reader PosUncertainty
    :initarg :PosUncertainty
    :type cl:float
    :initform 0.0)
   (VelUncertainty
    :reader VelUncertainty
    :initarg :VelUncertainty
    :type cl:float
    :initform 0.0)
   (SyncInTime
    :reader SyncInTime
    :initarg :SyncInTime
    :type cl:float
    :initform 0.0)
   (SyncInCount
    :reader SyncInCount
    :initarg :SyncInCount
    :type cl:integer
    :initform 0))
)

(cl:defclass ins (<ins>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ins>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ins)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name vn300-msg:<ins> is deprecated: use vn300-msg:ins instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ins>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vn300-msg:header-val is deprecated.  Use vn300-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'Time-val :lambda-list '(m))
(cl:defmethod Time-val ((m <ins>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vn300-msg:Time-val is deprecated.  Use vn300-msg:Time instead.")
  (Time m))

(cl:ensure-generic-function 'Week-val :lambda-list '(m))
(cl:defmethod Week-val ((m <ins>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vn300-msg:Week-val is deprecated.  Use vn300-msg:Week instead.")
  (Week m))

(cl:ensure-generic-function 'Status-val :lambda-list '(m))
(cl:defmethod Status-val ((m <ins>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vn300-msg:Status-val is deprecated.  Use vn300-msg:Status instead.")
  (Status m))

(cl:ensure-generic-function 'RPY-val :lambda-list '(m))
(cl:defmethod RPY-val ((m <ins>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vn300-msg:RPY-val is deprecated.  Use vn300-msg:RPY instead.")
  (RPY m))

(cl:ensure-generic-function 'LLA-val :lambda-list '(m))
(cl:defmethod LLA-val ((m <ins>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vn300-msg:LLA-val is deprecated.  Use vn300-msg:LLA instead.")
  (LLA m))

(cl:ensure-generic-function 'NedVel-val :lambda-list '(m))
(cl:defmethod NedVel-val ((m <ins>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vn300-msg:NedVel-val is deprecated.  Use vn300-msg:NedVel instead.")
  (NedVel m))

(cl:ensure-generic-function 'YawUncertainty-val :lambda-list '(m))
(cl:defmethod YawUncertainty-val ((m <ins>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vn300-msg:YawUncertainty-val is deprecated.  Use vn300-msg:YawUncertainty instead.")
  (YawUncertainty m))

(cl:ensure-generic-function 'PitchUncertainty-val :lambda-list '(m))
(cl:defmethod PitchUncertainty-val ((m <ins>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vn300-msg:PitchUncertainty-val is deprecated.  Use vn300-msg:PitchUncertainty instead.")
  (PitchUncertainty m))

(cl:ensure-generic-function 'RollUncertainty-val :lambda-list '(m))
(cl:defmethod RollUncertainty-val ((m <ins>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vn300-msg:RollUncertainty-val is deprecated.  Use vn300-msg:RollUncertainty instead.")
  (RollUncertainty m))

(cl:ensure-generic-function 'PosUncertainty-val :lambda-list '(m))
(cl:defmethod PosUncertainty-val ((m <ins>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vn300-msg:PosUncertainty-val is deprecated.  Use vn300-msg:PosUncertainty instead.")
  (PosUncertainty m))

(cl:ensure-generic-function 'VelUncertainty-val :lambda-list '(m))
(cl:defmethod VelUncertainty-val ((m <ins>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vn300-msg:VelUncertainty-val is deprecated.  Use vn300-msg:VelUncertainty instead.")
  (VelUncertainty m))

(cl:ensure-generic-function 'SyncInTime-val :lambda-list '(m))
(cl:defmethod SyncInTime-val ((m <ins>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vn300-msg:SyncInTime-val is deprecated.  Use vn300-msg:SyncInTime instead.")
  (SyncInTime m))

(cl:ensure-generic-function 'SyncInCount-val :lambda-list '(m))
(cl:defmethod SyncInCount-val ((m <ins>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vn300-msg:SyncInCount-val is deprecated.  Use vn300-msg:SyncInCount instead.")
  (SyncInCount m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<ins>)))
    "Constants for message type '<ins>"
  '((:STATUS_INSUFFICIENT_MOTION . 1)
    (:STATUS_INS_OK . 2)
    (:STATUS_GPS_FIX_OK . 4)
    (:STATUS_SENSOR_ERROR_TIME . 8)
    (:STATUS_SENSOR_ERROR_IMU . 16)
    (:STATUS_SENSOR_ERROR_MAG . 32)
    (:STATUS_SENSOR_ERROR_GPS . 64))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'ins)))
    "Constants for message type 'ins"
  '((:STATUS_INSUFFICIENT_MOTION . 1)
    (:STATUS_INS_OK . 2)
    (:STATUS_GPS_FIX_OK . 4)
    (:STATUS_SENSOR_ERROR_TIME . 8)
    (:STATUS_SENSOR_ERROR_IMU . 16)
    (:STATUS_SENSOR_ERROR_MAG . 32)
    (:STATUS_SENSOR_ERROR_GPS . 64))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ins>) ostream)
  "Serializes a message object of type '<ins>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'Time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Week)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Week)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Status)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Status)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'RPY) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'LLA) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'NedVel) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'YawUncertainty))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'PitchUncertainty))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'RollUncertainty))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'PosUncertainty))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'VelUncertainty))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'SyncInTime))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'SyncInCount)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'SyncInCount)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'SyncInCount)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'SyncInCount)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ins>) istream)
  "Deserializes a message object of type '<ins>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Time) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Week)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Week)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Status)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Status)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'RPY) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'LLA) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'NedVel) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'YawUncertainty) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'PitchUncertainty) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'RollUncertainty) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'PosUncertainty) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'VelUncertainty) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'SyncInTime) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'SyncInCount)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'SyncInCount)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'SyncInCount)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'SyncInCount)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ins>)))
  "Returns string type for a message object of type '<ins>"
  "vn300/ins")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ins)))
  "Returns string type for a message object of type 'ins"
  "vn300/ins")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ins>)))
  "Returns md5sum for a message object of type '<ins>"
  "6d73535fac7fc35ecd07989081b4b4e6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ins)))
  "Returns md5sum for a message object of type 'ins"
  "6d73535fac7fc35ecd07989081b4b4e6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ins>)))
  "Returns full string definition for message of type '<ins>"
  (cl:format cl:nil "std_msgs/Header       header~%float64               Time~%uint16                Week~%uint16                Status~%geometry_msgs/Vector3 RPY~%geometry_msgs/Vector3 LLA~%geometry_msgs/Vector3 NedVel~%float32               YawUncertainty~%float32               PitchUncertainty~%float32               RollUncertainty~%float32               PosUncertainty~%float32               VelUncertainty~%float64               SyncInTime~%uint32                SyncInCount~%~%uint16 STATUS_INSUFFICIENT_MOTION=1~%uint16 STATUS_INS_OK=2~%uint16 STATUS_GPS_FIX_OK=4~%uint16 STATUS_SENSOR_ERROR_TIME=8~%uint16 STATUS_SENSOR_ERROR_IMU=16~%uint16 STATUS_SENSOR_ERROR_MAG=32~%uint16 STATUS_SENSOR_ERROR_GPS=64~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ins)))
  "Returns full string definition for message of type 'ins"
  (cl:format cl:nil "std_msgs/Header       header~%float64               Time~%uint16                Week~%uint16                Status~%geometry_msgs/Vector3 RPY~%geometry_msgs/Vector3 LLA~%geometry_msgs/Vector3 NedVel~%float32               YawUncertainty~%float32               PitchUncertainty~%float32               RollUncertainty~%float32               PosUncertainty~%float32               VelUncertainty~%float64               SyncInTime~%uint32                SyncInCount~%~%uint16 STATUS_INSUFFICIENT_MOTION=1~%uint16 STATUS_INS_OK=2~%uint16 STATUS_GPS_FIX_OK=4~%uint16 STATUS_SENSOR_ERROR_TIME=8~%uint16 STATUS_SENSOR_ERROR_IMU=16~%uint16 STATUS_SENSOR_ERROR_MAG=32~%uint16 STATUS_SENSOR_ERROR_GPS=64~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ins>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
     2
     2
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'RPY))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'LLA))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'NedVel))
     4
     4
     4
     4
     4
     8
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ins>))
  "Converts a ROS message object to a list"
  (cl:list 'ins
    (cl:cons ':header (header msg))
    (cl:cons ':Time (Time msg))
    (cl:cons ':Week (Week msg))
    (cl:cons ':Status (Status msg))
    (cl:cons ':RPY (RPY msg))
    (cl:cons ':LLA (LLA msg))
    (cl:cons ':NedVel (NedVel msg))
    (cl:cons ':YawUncertainty (YawUncertainty msg))
    (cl:cons ':PitchUncertainty (PitchUncertainty msg))
    (cl:cons ':RollUncertainty (RollUncertainty msg))
    (cl:cons ':PosUncertainty (PosUncertainty msg))
    (cl:cons ':VelUncertainty (VelUncertainty msg))
    (cl:cons ':SyncInTime (SyncInTime msg))
    (cl:cons ':SyncInCount (SyncInCount msg))
))
