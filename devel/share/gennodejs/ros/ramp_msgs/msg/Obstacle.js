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
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class Obstacle {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ob_ms = null;
      this.T_w_odom = null;
    }
    else {
      if (initObj.hasOwnProperty('ob_ms')) {
        this.ob_ms = initObj.ob_ms
      }
      else {
        this.ob_ms = new MotionState();
      }
      if (initObj.hasOwnProperty('T_w_odom')) {
        this.T_w_odom = initObj.T_w_odom
      }
      else {
        this.T_w_odom = new geometry_msgs.msg.Transform();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Obstacle
    // Serialize message field [ob_ms]
    bufferOffset = MotionState.serialize(obj.ob_ms, buffer, bufferOffset);
    // Serialize message field [T_w_odom]
    bufferOffset = geometry_msgs.msg.Transform.serialize(obj.T_w_odom, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Obstacle
    let len;
    let data = new Obstacle(null);
    // Deserialize message field [ob_ms]
    data.ob_ms = MotionState.deserialize(buffer, bufferOffset);
    // Deserialize message field [T_w_odom]
    data.T_w_odom = geometry_msgs.msg.Transform.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += MotionState.getMessageSize(object.ob_ms);
    return length + 56;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ramp_msgs/Obstacle';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1c898b42573c16c59c5800c91c7d0b57';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    ramp_msgs/MotionState ob_ms
    geometry_msgs/Transform T_w_odom
    
    ================================================================================
    MSG: ramp_msgs/MotionState
    float64[] positions
    float64[] velocities
    float64[] accelerations
    float64[] jerks
    
    # change to duration
    float64 time
    
    ================================================================================
    MSG: geometry_msgs/Transform
    # This represents the transform between two coordinate frames in free space.
    
    Vector3 translation
    Quaternion rotation
    
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
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Obstacle(null);
    if (msg.ob_ms !== undefined) {
      resolved.ob_ms = MotionState.Resolve(msg.ob_ms)
    }
    else {
      resolved.ob_ms = new MotionState()
    }

    if (msg.T_w_odom !== undefined) {
      resolved.T_w_odom = geometry_msgs.msg.Transform.Resolve(msg.T_w_odom)
    }
    else {
      resolved.T_w_odom = new geometry_msgs.msg.Transform()
    }

    return resolved;
    }
};

module.exports = Obstacle;
