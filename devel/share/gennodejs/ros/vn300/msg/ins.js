// Auto-generated. Do not edit!

// (in-package vn300.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class ins {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.Time = null;
      this.Week = null;
      this.Status = null;
      this.RPY = null;
      this.LLA = null;
      this.NedVel = null;
      this.YawUncertainty = null;
      this.PitchUncertainty = null;
      this.RollUncertainty = null;
      this.PosUncertainty = null;
      this.VelUncertainty = null;
      this.SyncInTime = null;
      this.SyncInCount = null;
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
      if (initObj.hasOwnProperty('Week')) {
        this.Week = initObj.Week
      }
      else {
        this.Week = 0;
      }
      if (initObj.hasOwnProperty('Status')) {
        this.Status = initObj.Status
      }
      else {
        this.Status = 0;
      }
      if (initObj.hasOwnProperty('RPY')) {
        this.RPY = initObj.RPY
      }
      else {
        this.RPY = new geometry_msgs.msg.Vector3();
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
      if (initObj.hasOwnProperty('YawUncertainty')) {
        this.YawUncertainty = initObj.YawUncertainty
      }
      else {
        this.YawUncertainty = 0.0;
      }
      if (initObj.hasOwnProperty('PitchUncertainty')) {
        this.PitchUncertainty = initObj.PitchUncertainty
      }
      else {
        this.PitchUncertainty = 0.0;
      }
      if (initObj.hasOwnProperty('RollUncertainty')) {
        this.RollUncertainty = initObj.RollUncertainty
      }
      else {
        this.RollUncertainty = 0.0;
      }
      if (initObj.hasOwnProperty('PosUncertainty')) {
        this.PosUncertainty = initObj.PosUncertainty
      }
      else {
        this.PosUncertainty = 0.0;
      }
      if (initObj.hasOwnProperty('VelUncertainty')) {
        this.VelUncertainty = initObj.VelUncertainty
      }
      else {
        this.VelUncertainty = 0.0;
      }
      if (initObj.hasOwnProperty('SyncInTime')) {
        this.SyncInTime = initObj.SyncInTime
      }
      else {
        this.SyncInTime = 0.0;
      }
      if (initObj.hasOwnProperty('SyncInCount')) {
        this.SyncInCount = initObj.SyncInCount
      }
      else {
        this.SyncInCount = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ins
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [Time]
    bufferOffset = _serializer.float64(obj.Time, buffer, bufferOffset);
    // Serialize message field [Week]
    bufferOffset = _serializer.uint16(obj.Week, buffer, bufferOffset);
    // Serialize message field [Status]
    bufferOffset = _serializer.uint16(obj.Status, buffer, bufferOffset);
    // Serialize message field [RPY]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.RPY, buffer, bufferOffset);
    // Serialize message field [LLA]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.LLA, buffer, bufferOffset);
    // Serialize message field [NedVel]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.NedVel, buffer, bufferOffset);
    // Serialize message field [YawUncertainty]
    bufferOffset = _serializer.float32(obj.YawUncertainty, buffer, bufferOffset);
    // Serialize message field [PitchUncertainty]
    bufferOffset = _serializer.float32(obj.PitchUncertainty, buffer, bufferOffset);
    // Serialize message field [RollUncertainty]
    bufferOffset = _serializer.float32(obj.RollUncertainty, buffer, bufferOffset);
    // Serialize message field [PosUncertainty]
    bufferOffset = _serializer.float32(obj.PosUncertainty, buffer, bufferOffset);
    // Serialize message field [VelUncertainty]
    bufferOffset = _serializer.float32(obj.VelUncertainty, buffer, bufferOffset);
    // Serialize message field [SyncInTime]
    bufferOffset = _serializer.float64(obj.SyncInTime, buffer, bufferOffset);
    // Serialize message field [SyncInCount]
    bufferOffset = _serializer.uint32(obj.SyncInCount, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ins
    let len;
    let data = new ins(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [Time]
    data.Time = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [Week]
    data.Week = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [Status]
    data.Status = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [RPY]
    data.RPY = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [LLA]
    data.LLA = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [NedVel]
    data.NedVel = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [YawUncertainty]
    data.YawUncertainty = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [PitchUncertainty]
    data.PitchUncertainty = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [RollUncertainty]
    data.RollUncertainty = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [PosUncertainty]
    data.PosUncertainty = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [VelUncertainty]
    data.VelUncertainty = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [SyncInTime]
    data.SyncInTime = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [SyncInCount]
    data.SyncInCount = _deserializer.uint32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 116;
  }

  static datatype() {
    // Returns string type for a message object
    return 'vn300/ins';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6d73535fac7fc35ecd07989081b4b4e6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header       header
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
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ins(null);
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

    if (msg.Week !== undefined) {
      resolved.Week = msg.Week;
    }
    else {
      resolved.Week = 0
    }

    if (msg.Status !== undefined) {
      resolved.Status = msg.Status;
    }
    else {
      resolved.Status = 0
    }

    if (msg.RPY !== undefined) {
      resolved.RPY = geometry_msgs.msg.Vector3.Resolve(msg.RPY)
    }
    else {
      resolved.RPY = new geometry_msgs.msg.Vector3()
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

    if (msg.YawUncertainty !== undefined) {
      resolved.YawUncertainty = msg.YawUncertainty;
    }
    else {
      resolved.YawUncertainty = 0.0
    }

    if (msg.PitchUncertainty !== undefined) {
      resolved.PitchUncertainty = msg.PitchUncertainty;
    }
    else {
      resolved.PitchUncertainty = 0.0
    }

    if (msg.RollUncertainty !== undefined) {
      resolved.RollUncertainty = msg.RollUncertainty;
    }
    else {
      resolved.RollUncertainty = 0.0
    }

    if (msg.PosUncertainty !== undefined) {
      resolved.PosUncertainty = msg.PosUncertainty;
    }
    else {
      resolved.PosUncertainty = 0.0
    }

    if (msg.VelUncertainty !== undefined) {
      resolved.VelUncertainty = msg.VelUncertainty;
    }
    else {
      resolved.VelUncertainty = 0.0
    }

    if (msg.SyncInTime !== undefined) {
      resolved.SyncInTime = msg.SyncInTime;
    }
    else {
      resolved.SyncInTime = 0.0
    }

    if (msg.SyncInCount !== undefined) {
      resolved.SyncInCount = msg.SyncInCount;
    }
    else {
      resolved.SyncInCount = 0
    }

    return resolved;
    }
};

// Constants for message
ins.Constants = {
  STATUS_INSUFFICIENT_MOTION: 1,
  STATUS_INS_OK: 2,
  STATUS_GPS_FIX_OK: 4,
  STATUS_SENSOR_ERROR_TIME: 8,
  STATUS_SENSOR_ERROR_IMU: 16,
  STATUS_SENSOR_ERROR_MAG: 32,
  STATUS_SENSOR_ERROR_GPS: 64,
}

module.exports = ins;
