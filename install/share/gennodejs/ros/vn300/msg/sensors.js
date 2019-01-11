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

class sensors {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.gps_time = null;
      this.Mag = null;
      this.Accel = null;
      this.Gyro = null;
      this.Temp = null;
      this.Pressure = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('gps_time')) {
        this.gps_time = initObj.gps_time
      }
      else {
        this.gps_time = 0.0;
      }
      if (initObj.hasOwnProperty('Mag')) {
        this.Mag = initObj.Mag
      }
      else {
        this.Mag = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('Accel')) {
        this.Accel = initObj.Accel
      }
      else {
        this.Accel = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('Gyro')) {
        this.Gyro = initObj.Gyro
      }
      else {
        this.Gyro = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('Temp')) {
        this.Temp = initObj.Temp
      }
      else {
        this.Temp = 0.0;
      }
      if (initObj.hasOwnProperty('Pressure')) {
        this.Pressure = initObj.Pressure
      }
      else {
        this.Pressure = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type sensors
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [gps_time]
    bufferOffset = _serializer.float64(obj.gps_time, buffer, bufferOffset);
    // Serialize message field [Mag]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.Mag, buffer, bufferOffset);
    // Serialize message field [Accel]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.Accel, buffer, bufferOffset);
    // Serialize message field [Gyro]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.Gyro, buffer, bufferOffset);
    // Serialize message field [Temp]
    bufferOffset = _serializer.float32(obj.Temp, buffer, bufferOffset);
    // Serialize message field [Pressure]
    bufferOffset = _serializer.float32(obj.Pressure, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type sensors
    let len;
    let data = new sensors(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [gps_time]
    data.gps_time = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [Mag]
    data.Mag = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [Accel]
    data.Accel = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [Gyro]
    data.Gyro = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [Temp]
    data.Temp = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Pressure]
    data.Pressure = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 88;
  }

  static datatype() {
    // Returns string type for a message object
    return 'vn300/sensors';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '39b3da64afd92d016eb0b8e07688fc15';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header       header
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
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new sensors(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.gps_time !== undefined) {
      resolved.gps_time = msg.gps_time;
    }
    else {
      resolved.gps_time = 0.0
    }

    if (msg.Mag !== undefined) {
      resolved.Mag = geometry_msgs.msg.Vector3.Resolve(msg.Mag)
    }
    else {
      resolved.Mag = new geometry_msgs.msg.Vector3()
    }

    if (msg.Accel !== undefined) {
      resolved.Accel = geometry_msgs.msg.Vector3.Resolve(msg.Accel)
    }
    else {
      resolved.Accel = new geometry_msgs.msg.Vector3()
    }

    if (msg.Gyro !== undefined) {
      resolved.Gyro = geometry_msgs.msg.Vector3.Resolve(msg.Gyro)
    }
    else {
      resolved.Gyro = new geometry_msgs.msg.Vector3()
    }

    if (msg.Temp !== undefined) {
      resolved.Temp = msg.Temp;
    }
    else {
      resolved.Temp = 0.0
    }

    if (msg.Pressure !== undefined) {
      resolved.Pressure = msg.Pressure;
    }
    else {
      resolved.Pressure = 0.0
    }

    return resolved;
    }
};

module.exports = sensors;
