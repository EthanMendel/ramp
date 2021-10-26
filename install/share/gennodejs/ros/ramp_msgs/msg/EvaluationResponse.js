// Auto-generated. Do not edit!

// (in-package ramp_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class EvaluationResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.fitness = null;
      this.feasible = null;
      this.t_firstCollision = null;
    }
    else {
      if (initObj.hasOwnProperty('fitness')) {
        this.fitness = initObj.fitness
      }
      else {
        this.fitness = 0.0;
      }
      if (initObj.hasOwnProperty('feasible')) {
        this.feasible = initObj.feasible
      }
      else {
        this.feasible = false;
      }
      if (initObj.hasOwnProperty('t_firstCollision')) {
        this.t_firstCollision = initObj.t_firstCollision
      }
      else {
        this.t_firstCollision = {secs: 0, nsecs: 0};
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EvaluationResponse
    // Serialize message field [fitness]
    bufferOffset = _serializer.float64(obj.fitness, buffer, bufferOffset);
    // Serialize message field [feasible]
    bufferOffset = _serializer.bool(obj.feasible, buffer, bufferOffset);
    // Serialize message field [t_firstCollision]
    bufferOffset = _serializer.duration(obj.t_firstCollision, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EvaluationResponse
    let len;
    let data = new EvaluationResponse(null);
    // Deserialize message field [fitness]
    data.fitness = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [feasible]
    data.feasible = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [t_firstCollision]
    data.t_firstCollision = _deserializer.duration(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 17;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ramp_msgs/EvaluationResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f964edf11b680c3f41b2a601ea124cac';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 fitness
    bool feasible
    duration t_firstCollision
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new EvaluationResponse(null);
    if (msg.fitness !== undefined) {
      resolved.fitness = msg.fitness;
    }
    else {
      resolved.fitness = 0.0
    }

    if (msg.feasible !== undefined) {
      resolved.feasible = msg.feasible;
    }
    else {
      resolved.feasible = false
    }

    if (msg.t_firstCollision !== undefined) {
      resolved.t_firstCollision = msg.t_firstCollision;
    }
    else {
      resolved.t_firstCollision = {secs: 0, nsecs: 0}
    }

    return resolved;
    }
};

module.exports = EvaluationResponse;
