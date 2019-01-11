// Auto-generated. Do not edit!

// (in-package vn300.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let utc_time = require('./utc_time.js');
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class gps {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.Time = null;
      this.UtcTime = null;
      this.Week = null;
      this.GpsFix = null;
      this.NumSats = null;
      this.LLA = null;
      this.NedVel = null;
      this.NedAcc = null;
      this.SpeedAcc = null;
      this.TimeAcc = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('Time')) {
        this.Time = initObj.Time
      }
      else {
        this.Time = 0.0;
      }
      if (initObj.hasOwnProperty('UtcTime')) {
        this.UtcTime = initObj.UtcTime
      }
      else {
        this.UtcTime = new utc_time();
      }
      if (initObj.hasOwnProperty('Week')) {
        this.Week = initObj.Week
      }
      else {
        this.Week = 0;
      }
      if (initObj.hasOwnProperty('GpsFix')) {
        this.GpsFix = initObj.GpsFix
      }
      else {
        this.GpsFix = 0;
      }
      if (initObj.hasOwnProperty('NumSats')) {
        this.NumSats = initObj.NumSats
      }
      else {
        this.NumSats = 0;
      }
      if (initObj.hasOwnProperty('LLA')) {
        this.LLA = initObj.LLA
      }
      else {
        this.LLA = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('NedVel')) {
        this.NedVel = initObj.NedVel
      }
      else {
        this.NedVel = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('NedAcc')) {
        this.NedAcc = initObj.NedAcc
      }
      else {
        this.NedAcc = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('SpeedAcc')) {
        this.SpeedAcc = initObj.SpeedAcc
      }
      else {
        this.SpeedAcc = 0.0;
      }
      if (initObj.hasOwnProperty('TimeAcc')) {
        this.TimeAcc = initObj.TimeAcc
      }
      else {
        this.TimeAcc = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type gps
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [Time]
    bufferOffset = _serializer.float64(obj.Time, buffer, bufferOffset);
    // Serialize message field [UtcTime]
    bufferOffset = utc_time.serialize(obj.UtcTime, buffer, bufferOffset);
    // Serialize message field [Week]
    bufferOffset = _serializer.uint16(obj.Week, buffer, bufferOffset);
    // Serialize message field [GpsFix]
    bufferOffset = _serializer.uint8(obj.GpsFix, buffer, bufferOffset);
    // Serialize message field [NumSats]
    bufferOffset = _serializer.uint8(obj.NumSats, buffer, bufferOffset);
    // Serialize message field [LLA]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.LLA, buffer, bufferOffset);
    // Serialize message field [NedVel]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.NedVel, buffer, bufferOffset);
    // Serialize message field [NedAcc]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.NedAcc, buffer, bufferOffset);
    // Serialize message field [SpeedAcc]
    bufferOffset = _serializer.float32(obj.SpeedAcc, buffer, bufferOffset);
    // Serialize message field [TimeAcc]
    bufferOffset = _serializer.float32(obj.TimeAcc, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type gps
    let len;
    let data = new gps(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [Time]
    data.Time = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [UtcTime]
    data.UtcTime = utc_time.deserialize(buffer, bufferOffset);
    // Deserialize message field [Week]
    data.Week = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [GpsFix]
    data.GpsFix = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [NumSats]
    data.NumSats = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [LLA]
    data.LLA = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [NedVel]
    data.NedVel = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [NedAcc]
    data.NedAcc = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [SpeedAcc]
    data.SpeedAcc = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [TimeAcc]
    data.TimeAcc = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 100;
  }

  static datatype() {
    // Returns string type for a message object
    return 'vn300/gps';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e00674819c464d1fc718e59b64d93387';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header       header
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
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new gps(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.Time !== undefined) {
      resolved.Time = msg.Time;
    }
    else {
      resolved.Time = 0.0
    }

    if (msg.UtcTime !== undefined) {
      resolved.UtcTime = utc_time.Resolve(msg.UtcTime)
    }
    else {
      resolved.UtcTime = new utc_time()
    }

    if (msg.Week !== undefined) {
      resolved.Week = msg.Week;
    }
    else {
      resolved.Week = 0
    }

    if (msg.GpsFix !== undefined) {
      resolved.GpsFix = msg.GpsFix;
    }
    else {
      resolved.GpsFix = 0
    }

    if (msg.NumSats !== undefined) {
      resolved.NumSats = msg.NumSats;
    }
    else {
      resolved.NumSats = 0
    }

    if (msg.LLA !== undefined) {
      resolved.LLA = geometry_msgs.msg.Vector3.Resolve(msg.LLA)
    }
    else {
      resolved.LLA = new geometry_msgs.msg.Vector3()
    }

    if (msg.NedVel !== undefined) {
      resolved.NedVel = geometry_msgs.msg.Vector3.Resolve(msg.NedVel)
    }
    else {
      resolved.NedVel = new geometry_msgs.msg.Vector3()
    }

    if (msg.NedAcc !== undefined) {
      resolved.NedAcc = geometry_msgs.msg.Vector3.Resolve(msg.NedAcc)
    }
    else {
      resolved.NedAcc = new geometry_msgs.msg.Vector3()
    }

    if (msg.SpeedAcc !== undefined) {
      resolved.SpeedAcc = msg.SpeedAcc;
    }
    else {
      resolved.SpeedAcc = 0.0
    }

    if (msg.TimeAcc !== undefined) {
      resolved.TimeAcc = msg.TimeAcc;
    }
    else {
      resolved.TimeAcc = 0.0
    }

    return resolved;
    }
};

// Constants for message
gps.Constants = {
  GPSFIX_NO_FIX: 0,
  GPSFIX_TIME_ONLY: 1,
  GPSFIX_2D_FIX: 3,
  GPSFIX_3D_FIX: 4,
}

module.exports = gps;
