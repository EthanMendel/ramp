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

class TrajectoryRepresentation {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.order = null;
      this.numDOF = null;
      this.type = null;
      this.coefficients = null;
      this.uCoefficients = null;
      this.resolution = null;
      this.active = null;
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
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = '';
      }
      if (initObj.hasOwnProperty('coefficients')) {
        this.coefficients = initObj.coefficients
      }
      else {
        this.coefficients = [];
      }
      if (initObj.hasOwnProperty('uCoefficients')) {
        this.uCoefficients = initObj.uCoefficients
      }
      else {
        this.uCoefficients = [];
      }
      if (initObj.hasOwnProperty('resolution')) {
        this.resolution = initObj.resolution
      }
      else {
        this.resolution = 0.0;
      }
      if (initObj.hasOwnProperty('active')) {
        this.active = initObj.active
      }
      else {
        this.active = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TrajectoryRepresentation
    // Serialize message field [order]
    bufferOffset = _serializer.uint32(obj.order, buffer, bufferOffset);
    // Serialize message field [numDOF]
    bufferOffset = _serializer.uint32(obj.numDOF, buffer, bufferOffset);
    // Serialize message field [type]
    bufferOffset = _serializer.string(obj.type, buffer, bufferOffset);
    // Serialize message field [coefficients]
    // Serialize the length for message field [coefficients]
    bufferOffset = _serializer.uint32(obj.coefficients.length, buffer, bufferOffset);
    obj.coefficients.forEach((val) => {
      bufferOffset = Coefficient.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [uCoefficients]
    // Serialize the length for message field [uCoefficients]
    bufferOffset = _serializer.uint32(obj.uCoefficients.length, buffer, bufferOffset);
    obj.uCoefficients.forEach((val) => {
      bufferOffset = Coefficient.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [resolution]
    bufferOffset = _serializer.float64(obj.resolution, buffer, bufferOffset);
    // Serialize message field [active]
    bufferOffset = _serializer.bool(obj.active, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TrajectoryRepresentation
    let len;
    let data = new TrajectoryRepresentation(null);
    // Deserialize message field [order]
    data.order = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [numDOF]
    data.numDOF = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [type]
    data.type = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [coefficients]
    // Deserialize array length for message field [coefficients]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.coefficients = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.coefficients[i] = Coefficient.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [uCoefficients]
    // Deserialize array length for message field [uCoefficients]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.uCoefficients = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.uCoefficients[i] = Coefficient.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [resolution]
    data.resolution = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [active]
    data.active = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.type);
    object.coefficients.forEach((val) => {
      length += Coefficient.getMessageSize(val);
    });
    object.uCoefficients.forEach((val) => {
      length += Coefficient.getMessageSize(val);
    });
    return length + 29;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ramp_planner_new/TrajectoryRepresentation';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f65cd27a48745f7c3c37027a27dae96d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint32 order
    uint32 numDOF
    string type
    ramp_planner_new/Coefficient[] coefficients
    ramp_planner_new/Coefficient[] uCoefficients
    float64 resolution
    bool active
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
    const resolved = new TrajectoryRepresentation(null);
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

    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = ''
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

    if (msg.uCoefficients !== undefined) {
      resolved.uCoefficients = new Array(msg.uCoefficients.length);
      for (let i = 0; i < resolved.uCoefficients.length; ++i) {
        resolved.uCoefficients[i] = Coefficient.Resolve(msg.uCoefficients[i]);
      }
    }
    else {
      resolved.uCoefficients = []
    }

    if (msg.resolution !== undefined) {
      resolved.resolution = msg.resolution;
    }
    else {
      resolved.resolution = 0.0
    }

    if (msg.active !== undefined) {
      resolved.active = msg.active;
    }
    else {
      resolved.active = false
    }

    return resolved;
    }
};

module.exports = TrajectoryRepresentation;
