// Auto-generated. Do not edit!

// (in-package ramp_planner_new.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Coefficient = require('./Coefficient.js');

//-----------------------------------------------------------

class CubicRepresentation {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.order = null;
      this.numDOF = null;
      this.coefficients = null;
      this.time = null;
    }
    else {
      if (initObj.hasOwnProperty('order')) {
        this.order = initObj.order
      }
      else {
        this.order = 0;
      }
      if (initObj.hasOwnProperty('numDOF')) {
        this.numDOF = initObj.numDOF
      }
      else {
        this.numDOF = 0;
      }
      if (initObj.hasOwnProperty('coefficients')) {
        this.coefficients = initObj.coefficients
      }
      else {
        this.coefficients = [];
      }
      if (initObj.hasOwnProperty('time')) {
        this.time = initObj.time
      }
      else {
        this.time = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CubicRepresentation
    // Serialize message field [order]
    bufferOffset = _serializer.uint32(obj.order, buffer, bufferOffset);
    // Serialize message field [numDOF]
    bufferOffset = _serializer.uint32(obj.numDOF, buffer, bufferOffset);
    // Serialize message field [coefficients]
    // Serialize the length for message field [coefficients]
    bufferOffset = _serializer.uint32(obj.coefficients.length, buffer, bufferOffset);
    obj.coefficients.forEach((val) => {
      bufferOffset = Coefficient.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [time]
    bufferOffset = _serializer.uint32(obj.time, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CubicRepresentation
    let len;
    let data = new CubicRepresentation(null);
    // Deserialize message field [order]
    data.order = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [numDOF]
    data.numDOF = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [coefficients]
    // Deserialize array length for message field [coefficients]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.coefficients = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.coefficients[i] = Coefficient.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [time]
    data.time = _deserializer.uint32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.coefficients.forEach((val) => {
      length += Coefficient.getMessageSize(val);
    });
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ramp_planner_new/CubicRepresentation';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0cd6931c932c0dea333d5e01e429443f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint32 order
    uint32 numDOF
    ramp_planner_new/Coefficient[] coefficients
    uint32 time
    ================================================================================
    MSG: ramp_planner_new/Coefficient
    float64[] values
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CubicRepresentation(null);
    if (msg.order !== undefined) {
      resolved.order = msg.order;
    }
    else {
      resolved.order = 0
    }

    if (msg.numDOF !== undefined) {
      resolved.numDOF = msg.numDOF;
    }
    else {
      resolved.numDOF = 0
    }

    if (msg.coefficients !== undefined) {
      resolved.coefficients = new Array(msg.coefficients.length);
      for (let i = 0; i < resolved.coefficients.length; ++i) {
        resolved.coefficients[i] = Coefficient.Resolve(msg.coefficients[i]);
      }
    }
    else {
      resolved.coefficients = []
    }

    if (msg.time !== undefined) {
      resolved.time = msg.time;
    }
    else {
      resolved.time = 0
    }

    return resolved;
    }
};

module.exports = CubicRepresentation;
