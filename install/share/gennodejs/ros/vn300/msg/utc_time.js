// Auto-generated. Do not edit!

// (in-package vn300.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class utc_time {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.year = null;
      this.month = null;
      this.day = null;
      this.hour = null;
      this.minute = null;
      this.second = null;
      this.millisecond = null;
    }
    else {
      if (initObj.hasOwnProperty('year')) {
        this.year = initObj.year
      }
      else {
        this.year = 0;
      }
      if (initObj.hasOwnProperty('month')) {
        this.month = initObj.month
      }
      else {
        this.month = 0;
      }
      if (initObj.hasOwnProperty('day')) {
        this.day = initObj.day
      }
      else {
        this.day = 0;
      }
      if (initObj.hasOwnProperty('hour')) {
        this.hour = initObj.hour
      }
      else {
        this.hour = 0;
      }
      if (initObj.hasOwnProperty('minute')) {
        this.minute = initObj.minute
      }
      else {
        this.minute = 0;
      }
      if (initObj.hasOwnProperty('second')) {
        this.second = initObj.second
      }
      else {
        this.second = 0;
      }
      if (initObj.hasOwnProperty('millisecond')) {
        this.millisecond = initObj.millisecond
      }
      else {
        this.millisecond = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type utc_time
    // Serialize message field [year]
    bufferOffset = _serializer.uint8(obj.year, buffer, bufferOffset);
    // Serialize message field [month]
    bufferOffset = _serializer.uint8(obj.month, buffer, bufferOffset);
    // Serialize message field [day]
    bufferOffset = _serializer.uint8(obj.day, buffer, bufferOffset);
    // Serialize message field [hour]
    bufferOffset = _serializer.uint8(obj.hour, buffer, bufferOffset);
    // Serialize message field [minute]
    bufferOffset = _serializer.uint8(obj.minute, buffer, bufferOffset);
    // Serialize message field [second]
    bufferOffset = _serializer.uint8(obj.second, buffer, bufferOffset);
    // Serialize message field [millisecond]
    bufferOffset = _serializer.uint16(obj.millisecond, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type utc_time
    let len;
    let data = new utc_time(null);
    // Deserialize message field [year]
    data.year = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [month]
    data.month = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [day]
    data.day = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [hour]
    data.hour = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [minute]
    data.minute = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [second]
    data.second = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [millisecond]
    data.millisecond = _deserializer.uint16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'vn300/utc_time';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c5364f7d779a45ceab890115aa08581e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 year
    uint8 month
    uint8 day
    uint8 hour
    uint8 minute
    uint8 second
    uint16 millisecond
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new utc_time(null);
    if (msg.year !== undefined) {
      resolved.year = msg.year;
    }
    else {
      resolved.year = 0
    }

    if (msg.month !== undefined) {
      resolved.month = msg.month;
    }
    else {
      resolved.month = 0
    }

    if (msg.day !== undefined) {
      resolved.day = msg.day;
    }
    else {
      resolved.day = 0
    }

    if (msg.hour !== undefined) {
      resolved.hour = msg.hour;
    }
    else {
      resolved.hour = 0
    }

    if (msg.minute !== undefined) {
      resolved.minute = msg.minute;
    }
    else {
      resolved.minute = 0
    }

    if (msg.second !== undefined) {
      resolved.second = msg.second;
    }
    else {
      resolved.second = 0
    }

    if (msg.millisecond !== undefined) {
      resolved.millisecond = msg.millisecond;
    }
    else {
      resolved.millisecond = 0
    }

    return resolved;
    }
};

module.exports = utc_time;
