;; Auto-generated. Do not edit!


(when (boundp 'vn300::utc_time)
  (if (not (find-package "VN300"))
    (make-package "VN300"))
  (shadow 'utc_time (find-package "VN300")))
(unless (find-package "VN300::UTC_TIME")
  (make-package "VN300::UTC_TIME"))

(in-package "ROS")
;;//! \htmlinclude utc_time.msg.html


(defclass vn300::utc_time
  :super ros::object
  :slots (_year _month _day _hour _minute _second _millisecond ))

(defmethod vn300::utc_time
  (:init
   (&key
    ((:year __year) 0)
    ((:month __month) 0)
    ((:day __day) 0)
    ((:hour __hour) 0)
    ((:minute __minute) 0)
    ((:second __second) 0)
    ((:millisecond __millisecond) 0)
    )
   (send-super :init)
   (setq _year (round __year))
   (setq _month (round __month))
   (setq _day (round __day))
   (setq _hour (round __hour))
   (setq _minute (round __minute))
   (setq _second (round __second))
   (setq _millisecond (round __millisecond))
   self)
  (:year
   (&optional __year)
   (if __year (setq _year __year)) _year)
  (:month
   (&optional __month)
   (if __month (setq _month __month)) _month)
  (:day
   (&optional __day)
   (if __day (setq _day __day)) _day)
  (:hour
   (&optional __hour)
   (if __hour (setq _hour __hour)) _hour)
  (:minute
   (&optional __minute)
   (if __minute (setq _minute __minute)) _minute)
  (:second
   (&optional __second)
   (if __second (setq _second __second)) _second)
  (:millisecond
   (&optional __millisecond)
   (if __millisecond (setq _millisecond __millisecond)) _millisecond)
  (:serialization-length
   ()
   (+
    ;; uint8 _year
    1
    ;; uint8 _month
    1
    ;; uint8 _day
    1
    ;; uint8 _hour
    1
    ;; uint8 _minute
    1
    ;; uint8 _second
    1
    ;; uint16 _millisecond
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _year
       (write-byte _year s)
     ;; uint8 _month
       (write-byte _month s)
     ;; uint8 _day
       (write-byte _day s)
     ;; uint8 _hour
       (write-byte _hour s)
     ;; uint8 _minute
       (write-byte _minute s)
     ;; uint8 _second
       (write-byte _second s)
     ;; uint16 _millisecond
       (write-word _millisecond s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _year
     (setq _year (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _month
     (setq _month (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _day
     (setq _day (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _hour
     (setq _hour (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _minute
     (setq _minute (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _second
     (setq _second (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint16 _millisecond
     (setq _millisecond (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get vn300::utc_time :md5sum-) "c5364f7d779a45ceab890115aa08581e")
(setf (get vn300::utc_time :datatype-) "vn300/utc_time")
(setf (get vn300::utc_time :definition-)
      "uint8 year
uint8 month
uint8 day
uint8 hour
uint8 minute
uint8 second
uint16 millisecond

")



(provide :vn300/utc_time "c5364f7d779a45ceab890115aa08581e")


