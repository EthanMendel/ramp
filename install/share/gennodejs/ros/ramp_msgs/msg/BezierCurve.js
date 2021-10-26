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
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class BezierCurve {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.points = null;
      this.u_values = null;
      this.segmentPoints = null;
      this.controlPoints = null;
      this.l = null;
      this.ms_maxVA = null;
      this.ms_initialVA = null;
      this.ms_begin = null;
      this.u_0 = null;
      this.u_dot_0 = null;
      this.u_dot_max = null;
      this.u_target = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('points')) {
        this.points = initObj.points
      }
      else {
        this.points = [];
      }
      if (initObj.hasOwnProperty('u_values')) {
        this.u_values = initObj.u_values
      }
      else {
        this.u_values = [];
      }
      if (initObj.hasOwnProperty('segmentPoints')) {
        this.segmentPoints = initObj.segmentPoints
      }
      else {
        this.segmentPoints = [];
      }
      if (initObj.hasOwnProperty('controlPoints')) {
        this.controlPoints = initObj.controlPoints
      }
      else {
        this.controlPoints = [];
      }
      if (initObj.hasOwnProperty('l')) {
        this.l = initObj.l
      }
      else {
        this.l = 0.0;
      }
      if (initObj.hasOwnProperty('ms_maxVA')) {
        this.ms_maxVA = initObj.ms_maxVA
      }
      else {
        this.ms_maxVA = new MotionState();
      }
      if (initObj.hasOwnProperty('ms_initialVA')) {
        this.ms_initialVA = initObj.ms_initialVA
      }
      else {
        this.ms_initialVA = new MotionState();
      }
      if (initObj.hasOwnProperty('ms_begin')) {
        this.ms_begin = initObj.ms_begin
      }
      else {
        this.ms_begin = new MotionState();
      }
      if (initObj.hasOwnProperty('u_0')) {
        this.u_0 = initObj.u_0
      }
      else {
        this.u_0 = 0.0;
      }
      if (initObj.hasOwnProperty('u_dot_0')) {
        this.u_dot_0 = initObj.u_dot_0
      }
      else {
        this.u_dot_0 = 0.0;
      }
      if (initObj.hasOwnProperty('u_dot_max')) {
        this.u_dot_max = initObj.u_dot_max
      }
      else {
        this.u_dot_max = 0.0;
      }
      if (initObj.hasOwnProperty('u_target')) {
        this.u_target = initObj.u_target
      }
      else {
        this.u_target = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BezierCurve
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [points]
    // Serialize the length for message field [points]
    bufferOffset = _serializer.uint32(obj.points.length, buffer, bufferOffset);
    obj.points.forEach((val) => {
      bufferOffset = MotionState.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [u_values]
    bufferOffset = _arraySerializer.float64(obj.u_values, buffer, bufferOffset, null);
    // Serialize message field [segmentPoints]
    // Serialize the length for message field [segmentPoints]
    bufferOffset = _serializer.uint32(obj.segmentPoints.length, buffer, bufferOffset);
    obj.segmentPoints.forEach((val) => {
      bufferOffset = MotionState.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [controlPoints]
    // Serialize the length for message field [controlPoints]
    bufferOffset = _serializer.uint32(obj.controlPoints.length, buffer, bufferOffset);
    obj.controlPoints.forEach((val) => {
      bufferOffset = MotionState.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [l]
    bufferOffset = _serializer.float64(obj.l, buffer, bufferOffset);
    // Serialize message field [ms_maxVA]
    bufferOffset = MotionState.serialize(obj.ms_maxVA, buffer, bufferOffset);
    // Serialize message field [ms_initialVA]
    bufferOffset = MotionState.serialize(obj.ms_initialVA, buffer, bufferOffset);
    // Serialize message field [ms_begin]
    bufferOffset = MotionState.serialize(obj.ms_begin, buffer, bufferOffset);
    // Serialize message field [u_0]
    bufferOffset = _serializer.float64(obj.u_0, buffer, bufferOffset);
    // Serialize message field [u_dot_0]
    bufferOffset = _serializer.float64(obj.u_dot_0, buffer, bufferOffset);
    // Serialize message field [u_dot_max]
    bufferOffset = _serializer.float64(obj.u_dot_max, buffer, bufferOffset);
    // Serialize message field [u_target]
    bufferOffset = _serializer.float64(obj.u_target, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BezierCurve
    let len;
    let data = new BezierCurve(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [points]
    // Deserialize array length for message field [points]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.points = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.points[i] = MotionState.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [u_values]
    data.u_values = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [segmentPoints]
    // Deserialize array length for message field [segmentPoints]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.segmentPoints = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.segmentPoints[i] = MotionState.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [controlPoints]
    // Deserialize array length for message field [controlPoints]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.controlPoints = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.controlPoints[i] = MotionState.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [l]
    data.l = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [ms_maxVA]
    data.ms_maxVA = MotionState.deserialize(buffer, bufferOffset);
    // Deserialize message field [ms_initialVA]
    data.ms_initialVA = MotionState.deserialize(buffer, bufferOffset);
    // Deserialize message field [ms_begin]
    data.ms_begin = MotionState.deserialize(buffer, bufferOffset);
    // Deserialize message field [u_0]
    data.u_0 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [u_dot_0]
    data.u_dot_0 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [u_dot_max]
    data.u_dot_max = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [u_target]
    data.u_target = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.points.forEach((val) => {
      length += MotionState.getMessageSize(val);
    });
    length += 8 * object.u_values.length;
    object.segmentPoints.forEach((val) => {
      length += MotionState.getMessageSize(val);
    });
    object.controlPoints.forEach((val) => {
      length += MotionState.getMessageSize(val);
    });
    length += MotionState.getMessageSize(object.ms_maxVA);
    length += MotionState.getMessageSize(object.ms_initialVA);
    length += MotionState.getMessageSize(object.ms_begin);
    return length + 56;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ramp_msgs/BezierCurve';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ce5eeb9cbad0aaaf351cc381d13ee193';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
    ramp_msgs/MotionState[] points
    float64[] u_values
    
    ramp_msgs/MotionState[] segmentPoints
    ramp_msgs/MotionState[] controlPoints
    
    float64 l
    ramp_msgs/MotionState ms_maxVA
    ramp_msgs/MotionState ms_initialVA
    ramp_msgs/MotionState ms_begin
    float64 u_0
    float64 u_dot_0
    float64 u_dot_max
    float64 u_target
    
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
    string frame_id
    
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
    const resolved = new BezierCurve(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.points !== undefined) {
      resolved.points = new Array(msg.points.length);
      for (let i = 0; i < resolved.points.length; ++i) {
        resolved.points[i] = MotionState.Resolve(msg.points[i]);
      }
    }
    else {
      resolved.points = []
    }

    if (msg.u_values !== undefined) {
      resolved.u_values = msg.u_values;
    }
    else {
      resolved.u_values = []
    }

    if (msg.segmentPoints !== undefined) {
      resolved.segmentPoints = new Array(msg.segmentPoints.length);
      for (let i = 0; i < resolved.segmentPoints.length; ++i) {
        resolved.segmentPoints[i] = MotionState.Resolve(msg.segmentPoints[i]);
      }
    }
    else {
      resolved.segmentPoints = []
    }

    if (msg.controlPoints !== undefined) {
      resolved.controlPoints = new Array(msg.controlPoints.length);
      for (let i = 0; i < resolved.controlPoints.length; ++i) {
        resolved.controlPoints[i] = MotionState.Resolve(msg.controlPoints[i]);
      }
    }
    else {
      resolved.controlPoints = []
    }

    if (msg.l !== undefined) {
      resolved.l = msg.l;
    }
    else {
      resolved.l = 0.0
    }

    if (msg.ms_maxVA !== undefined) {
      resolved.ms_maxVA = MotionState.Resolve(msg.ms_maxVA)
    }
    else {
      resolved.ms_maxVA = new MotionState()
    }

    if (msg.ms_initialVA !== undefined) {
      resolved.ms_initialVA = MotionState.Resolve(msg.ms_initialVA)
    }
    else {
      resolved.ms_initialVA = new MotionState()
    }

    if (msg.ms_begin !== undefined) {
      resolved.ms_begin = MotionState.Resolve(msg.ms_begin)
    }
    else {
      resolved.ms_begin = new MotionState()
    }

    if (msg.u_0 !== undefined) {
      resolved.u_0 = msg.u_0;
    }
    else {
      resolved.u_0 = 0.0
    }

    if (msg.u_dot_0 !== undefined) {
      resolved.u_dot_0 = msg.u_dot_0;
    }
    else {
      resolved.u_dot_0 = 0.0
    }

    if (msg.u_dot_max !== undefined) {
      resolved.u_dot_max = msg.u_dot_max;
    }
    else {
      resolved.u_dot_max = 0.0
    }

    if (msg.u_target !== undefined) {
      resolved.u_target = msg.u_target;
    }
    else {
      resolved.u_target = 0.0
    }

    return resolved;
    }
};

module.exports = BezierCurve;
