; Auto-generated. Do not edit!


(cl:in-package vn300-msg)


;//! \htmlinclude utc_time.msg.html

(cl:defclass <utc_time> (roslisp-msg-protocol:ros-message)
  ((year
    :reader year
    :initarg :year
    :type cl:fixnum
    :initform 0)
   (month
    :reader month
    :initarg :month
    :type cl:fixnum
    :initform 0)
   (day
    :reader day
    :initarg :day
    :type cl:fixnum
    :initform 0)
   (hour
    :reader hour
    :initarg :hour
    :type cl:fixnum
    :initform 0)
   (minute
    :reader minute
    :initarg :minute
    :type cl:fixnum
    :initform 0)
   (second
    :reader second
    :initarg :second
    :type cl:fixnum
    :initform 0)
   (millisecond
    :reader millisecond
    :initarg :millisecond
    :type cl:fixnum
    :initform 0))
)

(cl:defclass utc_time (<utc_time>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <utc_time>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'utc_time)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name vn300-msg:<utc_time> is deprecated: use vn300-msg:utc_time instead.")))

(cl:ensure-generic-function 'year-val :lambda-list '(m))
(cl:defmethod year-val ((m <utc_time>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vn300-msg:year-val is deprecated.  Use vn300-msg:year instead.")
  (year m))

(cl:ensure-generic-function 'month-val :lambda-list '(m))
(cl:defmethod month-val ((m <utc_time>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vn300-msg:month-val is deprecated.  Use vn300-msg:month instead.")
  (month m))

(cl:ensure-generic-function 'day-val :lambda-list '(m))
(cl:defmethod day-val ((m <utc_time>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vn300-msg:day-val is deprecated.  Use vn300-msg:day instead.")
  (day m))

(cl:ensure-generic-function 'hour-val :lambda-list '(m))
(cl:defmethod hour-val ((m <utc_time>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vn300-msg:hour-val is deprecated.  Use vn300-msg:hour instead.")
  (hour m))

(cl:ensure-generic-function 'minute-val :lambda-list '(m))
(cl:defmethod minute-val ((m <utc_time>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vn300-msg:minute-val is deprecated.  Use vn300-msg:minute instead.")
  (minute m))

(cl:ensure-generic-function 'second-val :lambda-list '(m))
(cl:defmethod second-val ((m <utc_time>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vn300-msg:second-val is deprecated.  Use vn300-msg:second instead.")
  (second m))

(cl:ensure-generic-function 'millisecond-val :lambda-list '(m))
(cl:defmethod millisecond-val ((m <utc_time>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vn300-msg:millisecond-val is deprecated.  Use vn300-msg:millisecond instead.")
  (millisecond m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <utc_time>) ostream)
  "Serializes a message object of type '<utc_time>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'year)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'month)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'day)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'hour)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'minute)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'second)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'millisecond)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'millisecond)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <utc_time>) istream)
  "Deserializes a message object of type '<utc_time>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'year)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'month)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'day)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'hour)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'minute)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'second)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'millisecond)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'millisecond)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<utc_time>)))
  "Returns string type for a message object of type '<utc_time>"
  "vn300/utc_time")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'utc_time)))
  "Returns string type for a message object of type 'utc_time"
  "vn300/utc_time")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<utc_time>)))
  "Returns md5sum for a message object of type '<utc_time>"
  "c5364f7d779a45ceab890115aa08581e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'utc_time)))
  "Returns md5sum for a message object of type 'utc_time"
  "c5364f7d779a45ceab890115aa08581e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<utc_time>)))
  "Returns full string definition for message of type '<utc_time>"
  (cl:format cl:nil "uint8 year~%uint8 month~%uint8 day~%uint8 hour~%uint8 minute~%uint8 second~%uint16 millisecond~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'utc_time)))
  "Returns full string definition for message of type 'utc_time"
  (cl:format cl:nil "uint8 year~%uint8 month~%uint8 day~%uint8 hour~%uint8 minute~%uint8 second~%uint16 millisecond~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <utc_time>))
  (cl:+ 0
     1
     1
     1
     1
     1
     1
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <utc_time>))
  "Converts a ROS message object to a list"
  (cl:list 'utc_time
    (cl:cons ':year (year msg))
    (cl:cons ':month (month msg))
    (cl:cons ':day (day msg))
    (cl:cons ':hour (hour msg))
    (cl:cons ':minute (minute msg))
    (cl:cons ':second (second msg))
    (cl:cons ':millisecond (millisecond msg))
))
