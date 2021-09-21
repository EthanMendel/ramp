// Auto-generated. Do not edit!

// (in-package ramp_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Path = require('../msg/Path.js');

//-----------------------------------------------------------


//-----------------------------------------------------------

class ModificationRequestRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.paths = null;
      this.op = null;
      this.move_dist = null;
      this.move_dir = null;
    }
    else {
      if (initObj.hasOwnProperty('paths')) {
        this.paths = initObj.paths
      }
      else {
        this.paths = [];
      }
      if (initObj.hasOwnProperty('op')) {
        this.op = initObj.op
      }
      else {
        this.op = '';
      }
      if (initObj.hasOwnProperty('move_dist')) {
        this.move_dist = initObj.move_dist
      }
      else {
        this.move_dist = 0.0;
      }
      if (initObj.hasOwnProperty('move_dir')) {
        this.move_dir = initObj.move_dir
      }
      else {
        this.move_dir = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ModificationRequestRequest
    // Serialize message field [paths]
    // Serialize the length for message field [paths]
    bufferOffset = _serializer.uint32(obj.paths.length, buffer, bufferOffset);
    obj.paths.forEach((val) => {
      bufferOffset = Path.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [op]
    bufferOffset = _serializer.string(obj.op, buffer, bufferOffset);
    // Serialize message field [move_dist]
    bufferOffset = _serializer.float64(obj.move_dist, buffer, bufferOffset);
    // Serialize message field [move_dir]
    bufferOffset = _serializer.float64(obj.move_dir, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ModificationRequestRequest
    let len;
    let data = new ModificationRequestRequest(null);
    // Deserialize message field [paths]
    // Deserialize array length for message field [paths]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.paths = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.paths[i] = Path.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [op]
    data.op = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [move_dist]
    data.move_dist = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [move_dir]
    data.move_dir = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.paths.forEach((val) => {
      length += Path.getMessageSize(val);
    });
    length += _getByteLength(object.op);
    return length + 24;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ramp_msgs/ModificationRequestRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6a1d61389648b601b0bb8dc72c5e0625';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Path[] paths
    string op
    float64 move_dist
    float64 move_dir
    
    
    ================================================================================
    MSG: ramp_msgs/Path
    ramp_msgs/KnotPoint[] points
    
    ================================================================================
    MSG: ramp_msgs/KnotPoint
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
    const resolved = new ModificationRequestRequest(null);
    if (msg.paths !== undefined) {
      resolved.paths = new Array(msg.paths.length);
      for (let i = 0; i < resolved.paths.length; ++i) {
        resolved.paths[i] = Path.Resolve(msg.paths[i]);
      }
    }
    else {
      resolved.paths = []
    }

    if (msg.op !== undefined) {
      resolved.op = msg.op;
    }
    else {
      resolved.op = ''
    }

    if (msg.move_dist !== undefined) {
      resolved.move_dist = msg.move_dist;
    }
    else {
      resolved.move_dist = 0.0
    }

    if (msg.move_dir !== undefined) {
      resolved.move_dir = msg.move_dir;
    }
    else {
      resolved.move_dir = 0.0
    }

    return resolved;
    }
};

class ModificationRequestResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.mod_paths = null;
    }
    else {
      if (initObj.hasOwnProperty('mod_paths')) {
        this.mod_paths = initObj.mod_paths
      }
      else {
        this.mod_paths = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ModificationRequestResponse
    // Serialize message field [mod_paths]
    // Serialize the length for message field [mod_paths]
    bufferOffset = _serializer.uint32(obj.mod_paths.length, buffer, bufferOffset);
    obj.mod_paths.forEach((val) => {
      bufferOffset = Path.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ModificationRequestResponse
    let len;
    let data = new ModificationRequestResponse(null);
    // Deserialize message field [mod_paths]
    // Deserialize array length for message field [mod_paths]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.mod_paths = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.mod_paths[i] = Path.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.mod_paths.forEach((val) => {
      length += Path.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ramp_msgs/ModificationRequestResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '08df06df43e07409d295b8cc678df7cf';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    Path[]  mod_paths
    
    
    ================================================================================
    MSG: ramp_msgs/Path
    ramp_msgs/KnotPoint[] points
    
    ================================================================================
    MSG: ramp_msgs/KnotPoint
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
    const resolved = new ModificationRequestResponse(null);
    if (msg.mod_paths !== undefined) {
      resolved.mod_paths = new Array(msg.mod_paths.length);
      for (let i = 0; i < resolved.mod_paths.length; ++i) {
        resolved.mod_paths[i] = Path.Resolve(msg.mod_paths[i]);
      }
    }
    else {
      resolved.mod_paths = []
    }

    return resolved;
    }
};

module.exports = {
  Request: ModificationRequestRequest,
  Response: ModificationRequestResponse,
  md5sum() { return '81d0e2ec37dd2f917b71cfdf955b990d'; },
  datatype() { return 'ramp_msgs/ModificationRequest'; }
};
