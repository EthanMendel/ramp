// Auto-generated. Do not edit!

// (in-package ramp_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let MotionState = require('./MotionState.js');

//-----------------------------------------------------------

class KnotPoint {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.motionState = null;
      this.stopTime = null;
    }
    else {
      if (initObj.hasOwnProperty('motionState')) {
        this.motionState = initObj.motionState
      }
      else {
        this.motionState = new MotionState();
      }
      if (initObj.hasOwnProperty('stopTime')) {
        this.stopTime = initObj.stopTime
      }
      else {
        this.stopTime = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type KnotPoint
    // Serialize message field [motionState]
    bufferOffset = MotionState.serialize(obj.motionState, buffer, bufferOffset);
    // Serialize message field [stopTime]
    bufferOffset = _serializer.uint32(obj.stopTime, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type KnotPoint
    let len;
    let data = new KnotPoint(null);
    // Deserialize message field [motionState]
    data.motionState = MotionState.deserialize(buffer, bufferOffset);
    // Deserialize message field [stopTime]
    data.stopTime = _deserializer.uint32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += MotionState.getMessageSize(object.motionState);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ramp_msgs/KnotPoint';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '003814a67ae1dae25c6ac938e801efe5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    ramp_msgs/MotionState motionState
    uint32 stopTime
    
    ================================================================================
    MSG: ramp_msgs/MotionState
    float64[] positions
    float64[] velocities
    float64[] accelerations
    float64[] jerks
    
    # change to duration
    float64 time
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new KnotPoint(null);
    if (msg.motionState !== undefined) {
      resolved.motionState = MotionState.Resolve(msg.motionState)
    }
    else {
      resolved.motionState = new MotionState()
    }

    if (msg.stopTime !== undefined) {
      resolved.stopTime = msg.stopTime;
    }
    else {
      resolved.stopTime = 0
    }

    return resolved;
    }
};

module.exports = KnotPoint;
