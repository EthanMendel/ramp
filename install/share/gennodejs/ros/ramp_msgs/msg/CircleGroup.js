// Auto-generated. Do not edit!

// (in-package ramp_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Circle = require('./Circle.js');

//-----------------------------------------------------------

class CircleGroup {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.fitCir = null;
      this.packedCirs = null;
    }
    else {
      if (initObj.hasOwnProperty('fitCir')) {
        this.fitCir = initObj.fitCir
      }
      else {
        this.fitCir = new Circle();
      }
      if (initObj.hasOwnProperty('packedCirs')) {
        this.packedCirs = initObj.packedCirs
      }
      else {
        this.packedCirs = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CircleGroup
    // Serialize message field [fitCir]
    bufferOffset = Circle.serialize(obj.fitCir, buffer, bufferOffset);
    // Serialize message field [packedCirs]
    // Serialize the length for message field [packedCirs]
    bufferOffset = _serializer.uint32(obj.packedCirs.length, buffer, bufferOffset);
    obj.packedCirs.forEach((val) => {
      bufferOffset = Circle.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CircleGroup
    let len;
    let data = new CircleGroup(null);
    // Deserialize message field [fitCir]
    data.fitCir = Circle.deserialize(buffer, bufferOffset);
    // Deserialize message field [packedCirs]
    // Deserialize array length for message field [packedCirs]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.packedCirs = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.packedCirs[i] = Circle.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 32 * object.packedCirs.length;
    return length + 36;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ramp_msgs/CircleGroup';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9a0c5849cc79a80224d0f73cc03d9dab';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    ramp_msgs/Circle fitCir
    ramp_msgs/Circle[] packedCirs
    
    ================================================================================
    MSG: ramp_msgs/Circle
    geometry_msgs/Vector3 center
    float64 radius
    
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
    const resolved = new CircleGroup(null);
    if (msg.fitCir !== undefined) {
      resolved.fitCir = Circle.Resolve(msg.fitCir)
    }
    else {
      resolved.fitCir = new Circle()
    }

    if (msg.packedCirs !== undefined) {
      resolved.packedCirs = new Array(msg.packedCirs.length);
      for (let i = 0; i < resolved.packedCirs.length; ++i) {
        resolved.packedCirs[i] = Circle.Resolve(msg.packedCirs[i]);
      }
    }
    else {
      resolved.packedCirs = []
    }

    return resolved;
    }
};

module.exports = CircleGroup;
