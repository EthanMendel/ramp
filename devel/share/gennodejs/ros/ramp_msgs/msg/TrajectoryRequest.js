// Auto-generated. Do not edit!

// (in-package ramp_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Path = require('./Path.js');
let BezierCurve = require('./BezierCurve.js');

//-----------------------------------------------------------

class TrajectoryRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.path = null;
      this.type = null;
      this.print = null;
      this.bezierCurves = null;
      this.segments = null;
    }
    else {
      if (initObj.hasOwnProperty('path')) {
        this.path = initObj.path
      }
      else {
        this.path = new Path();
      }
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = 0;
      }
      if (initObj.hasOwnProperty('print')) {
        this.print = initObj.print
      }
      else {
        this.print = false;
      }
      if (initObj.hasOwnProperty('bezierCurves')) {
        this.bezierCurves = initObj.bezierCurves
      }
      else {
        this.bezierCurves = [];
      }
      if (initObj.hasOwnProperty('segments')) {
        this.segments = initObj.segments
      }
      else {
        this.segments = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TrajectoryRequest
    // Serialize message field [path]
    bufferOffset = Path.serialize(obj.path, buffer, bufferOffset);
    // Serialize message field [type]
    bufferOffset = _serializer.uint8(obj.type, buffer, bufferOffset);
    // Serialize message field [print]
    bufferOffset = _serializer.bool(obj.print, buffer, bufferOffset);
    // Serialize message field [bezierCurves]
    // Serialize the length for message field [bezierCurves]
    bufferOffset = _serializer.uint32(obj.bezierCurves.length, buffer, bufferOffset);
    obj.bezierCurves.forEach((val) => {
      bufferOffset = BezierCurve.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [segments]
    bufferOffset = _serializer.int8(obj.segments, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TrajectoryRequest
    let len;
    let data = new TrajectoryRequest(null);
    // Deserialize message field [path]
    data.path = Path.deserialize(buffer, bufferOffset);
    // Deserialize message field [type]
    data.type = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [print]
    data.print = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [bezierCurves]
    // Deserialize array length for message field [bezierCurves]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.bezierCurves = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.bezierCurves[i] = BezierCurve.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [segments]
    data.segments = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += Path.getMessageSize(object.path);
    object.bezierCurves.forEach((val) => {
      length += BezierCurve.getMessageSize(val);
    });
    return length + 7;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ramp_msgs/TrajectoryRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '90b320ee1b26415bfc5a720e57c91cb0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    ramp_msgs/Path path
    uint8 type 
    bool print
    ramp_msgs/BezierCurve[] bezierCurves
    int8 segments
    
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
    
    ================================================================================
    MSG: ramp_msgs/BezierCurve
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TrajectoryRequest(null);
    if (msg.path !== undefined) {
      resolved.path = Path.Resolve(msg.path)
    }
    else {
      resolved.path = new Path()
    }

    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = 0
    }

    if (msg.print !== undefined) {
      resolved.print = msg.print;
    }
    else {
      resolved.print = false
    }

    if (msg.bezierCurves !== undefined) {
      resolved.bezierCurves = new Array(msg.bezierCurves.length);
      for (let i = 0; i < resolved.bezierCurves.length; ++i) {
        resolved.bezierCurves[i] = BezierCurve.Resolve(msg.bezierCurves[i]);
      }
    }
    else {
      resolved.bezierCurves = []
    }

    if (msg.segments !== undefined) {
      resolved.segments = msg.segments;
    }
    else {
      resolved.segments = 0
    }

    return resolved;
    }
};

module.exports = TrajectoryRequest;
