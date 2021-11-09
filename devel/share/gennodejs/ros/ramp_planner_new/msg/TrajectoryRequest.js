// Auto-generated. Do not edit!

// (in-package ramp_planner_new.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class TrajectoryRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.timeNeeded = null;
      this.type = null;
    }
    else {
      if (initObj.hasOwnProperty('timeNeeded')) {
        this.timeNeeded = initObj.timeNeeded
      }
      else {
        this.timeNeeded = 0;
      }
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TrajectoryRequest
    // Serialize message field [timeNeeded]
    bufferOffset = _serializer.uint8(obj.timeNeeded, buffer, bufferOffset);
    // Serialize message field [type]
    bufferOffset = _serializer.string(obj.type, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TrajectoryRequest
    let len;
    let data = new TrajectoryRequest(null);
    // Deserialize message field [timeNeeded]
    data.timeNeeded = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [type]
    data.type = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.type);
    return length + 5;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ramp_planner_new/TrajectoryRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3e58e2f39ce06e72daff4a24c5879f25';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 timeNeeded
    string type
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TrajectoryRequest(null);
    if (msg.timeNeeded !== undefined) {
      resolved.timeNeeded = msg.timeNeeded;
    }
    else {
      resolved.timeNeeded = 0
    }

    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = ''
    }

    return resolved;
    }
};

module.exports = TrajectoryRequest;
