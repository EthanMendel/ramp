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
      this.max_speed_linear = null;
      this.max_speed_angular = null;
      this.sl_traj = null;
      this.sl_final_speed = null;
      this.sl_init_dur = null;
      this.sl_final_dur = null;
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
      if (initObj.hasOwnProperty('max_speed_linear')) {
        this.max_speed_linear = initObj.max_speed_linear
      }
      else {
        this.max_speed_linear = 0.0;
      }
      if (initObj.hasOwnProperty('max_speed_angular')) {
        this.max_speed_angular = initObj.max_speed_angular
      }
      else {
        this.max_speed_angular = 0.0;
      }
      if (initObj.hasOwnProperty('sl_traj')) {
        this.sl_traj = initObj.sl_traj
      }
      else {
        this.sl_traj = false;
      }
      if (initObj.hasOwnProperty('sl_final_speed')) {
        this.sl_final_speed = initObj.sl_final_speed
      }
      else {
        this.sl_final_speed = 0.0;
      }
      if (initObj.hasOwnProperty('sl_init_dur')) {
        this.sl_init_dur = initObj.sl_init_dur
      }
      else {
        this.sl_init_dur = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('sl_final_dur')) {
        this.sl_final_dur = initObj.sl_final_dur
      }
      else {
        this.sl_final_dur = {secs: 0, nsecs: 0};
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
    // Serialize message field [max_speed_linear]
    bufferOffset = _serializer.float64(obj.max_speed_linear, buffer, bufferOffset);
    // Serialize message field [max_speed_angular]
    bufferOffset = _serializer.float64(obj.max_speed_angular, buffer, bufferOffset);
    // Serialize message field [sl_traj]
    bufferOffset = _serializer.bool(obj.sl_traj, buffer, bufferOffset);
    // Serialize message field [sl_final_speed]
    bufferOffset = _serializer.float64(obj.sl_final_speed, buffer, bufferOffset);
    // Serialize message field [sl_init_dur]
    bufferOffset = _serializer.duration(obj.sl_init_dur, buffer, bufferOffset);
    // Serialize message field [sl_final_dur]
    bufferOffset = _serializer.duration(obj.sl_final_dur, buffer, bufferOffset);
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
    // Deserialize message field [max_speed_linear]
    data.max_speed_linear = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [max_speed_angular]
    data.max_speed_angular = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [sl_traj]
    data.sl_traj = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [sl_final_speed]
    data.sl_final_speed = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [sl_init_dur]
    data.sl_init_dur = _deserializer.duration(buffer, bufferOffset);
    // Deserialize message field [sl_final_dur]
    data.sl_final_dur = _deserializer.duration(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += Path.getMessageSize(object.path);
    object.bezierCurves.forEach((val) => {
      length += BezierCurve.getMessageSize(val);
    });
    return length + 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ramp_msgs/TrajectoryRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ad9619205ac6cad901fa5450a41bd191';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    ramp_msgs/Path path
    uint8 type 
    bool print
    ramp_msgs/BezierCurve[] bezierCurves
    int8 segments
    float64 max_speed_linear
    float64 max_speed_angular
    
    # For system-level test generation...
    bool sl_traj
    float64 sl_final_speed
    duration sl_init_dur
    duration sl_final_dur
    
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

    if (msg.max_speed_linear !== undefined) {
      resolved.max_speed_linear = msg.max_speed_linear;
    }
    else {
      resolved.max_speed_linear = 0.0
    }

    if (msg.max_speed_angular !== undefined) {
      resolved.max_speed_angular = msg.max_speed_angular;
    }
    else {
      resolved.max_speed_angular = 0.0
    }

    if (msg.sl_traj !== undefined) {
      resolved.sl_traj = msg.sl_traj;
    }
    else {
      resolved.sl_traj = false
    }

    if (msg.sl_final_speed !== undefined) {
      resolved.sl_final_speed = msg.sl_final_speed;
    }
    else {
      resolved.sl_final_speed = 0.0
    }

    if (msg.sl_init_dur !== undefined) {
      resolved.sl_init_dur = msg.sl_init_dur;
    }
    else {
      resolved.sl_init_dur = {secs: 0, nsecs: 0}
    }

    if (msg.sl_final_dur !== undefined) {
      resolved.sl_final_dur = msg.sl_final_dur;
    }
    else {
      resolved.sl_final_dur = {secs: 0, nsecs: 0}
    }

    return resolved;
    }
};

module.exports = TrajectoryRequest;
