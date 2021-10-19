// Auto-generated. Do not edit!

// (in-package ramp_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let BezierCurve = require('./BezierCurve.js');
let Path = require('./Path.js');
let std_msgs = _finder('std_msgs');
let trajectory_msgs = _finder('trajectory_msgs');

//-----------------------------------------------------------

class RampTrajectory {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.id = null;
      this.trajectory = null;
      this.i_knotPoints = null;
      this.curves = null;
      this.holonomic_path = null;
      this.feasible = null;
      this.fitness = null;
      this.t_firstCollision = null;
      this.i_subPopulation = null;
      this.t_start = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('trajectory')) {
        this.trajectory = initObj.trajectory
      }
      else {
        this.trajectory = new trajectory_msgs.msg.JointTrajectory();
      }
      if (initObj.hasOwnProperty('i_knotPoints')) {
        this.i_knotPoints = initObj.i_knotPoints
      }
      else {
        this.i_knotPoints = [];
      }
      if (initObj.hasOwnProperty('curves')) {
        this.curves = initObj.curves
      }
      else {
        this.curves = [];
      }
      if (initObj.hasOwnProperty('holonomic_path')) {
        this.holonomic_path = initObj.holonomic_path
      }
      else {
        this.holonomic_path = new Path();
      }
      if (initObj.hasOwnProperty('feasible')) {
        this.feasible = initObj.feasible
      }
      else {
        this.feasible = false;
      }
      if (initObj.hasOwnProperty('fitness')) {
        this.fitness = initObj.fitness
      }
      else {
        this.fitness = 0.0;
      }
      if (initObj.hasOwnProperty('t_firstCollision')) {
        this.t_firstCollision = initObj.t_firstCollision
      }
      else {
        this.t_firstCollision = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('i_subPopulation')) {
        this.i_subPopulation = initObj.i_subPopulation
      }
      else {
        this.i_subPopulation = 0;
      }
      if (initObj.hasOwnProperty('t_start')) {
        this.t_start = initObj.t_start
      }
      else {
        this.t_start = {secs: 0, nsecs: 0};
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RampTrajectory
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [id]
    bufferOffset = _serializer.uint16(obj.id, buffer, bufferOffset);
    // Serialize message field [trajectory]
    bufferOffset = trajectory_msgs.msg.JointTrajectory.serialize(obj.trajectory, buffer, bufferOffset);
    // Serialize message field [i_knotPoints]
    bufferOffset = _arraySerializer.uint16(obj.i_knotPoints, buffer, bufferOffset, null);
    // Serialize message field [curves]
    // Serialize the length for message field [curves]
    bufferOffset = _serializer.uint32(obj.curves.length, buffer, bufferOffset);
    obj.curves.forEach((val) => {
      bufferOffset = BezierCurve.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [holonomic_path]
    bufferOffset = Path.serialize(obj.holonomic_path, buffer, bufferOffset);
    // Serialize message field [feasible]
    bufferOffset = _serializer.bool(obj.feasible, buffer, bufferOffset);
    // Serialize message field [fitness]
    bufferOffset = _serializer.float64(obj.fitness, buffer, bufferOffset);
    // Serialize message field [t_firstCollision]
    bufferOffset = _serializer.duration(obj.t_firstCollision, buffer, bufferOffset);
    // Serialize message field [i_subPopulation]
    bufferOffset = _serializer.int8(obj.i_subPopulation, buffer, bufferOffset);
    // Serialize message field [t_start]
    bufferOffset = _serializer.duration(obj.t_start, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RampTrajectory
    let len;
    let data = new RampTrajectory(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [id]
    data.id = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [trajectory]
    data.trajectory = trajectory_msgs.msg.JointTrajectory.deserialize(buffer, bufferOffset);
    // Deserialize message field [i_knotPoints]
    data.i_knotPoints = _arrayDeserializer.uint16(buffer, bufferOffset, null)
    // Deserialize message field [curves]
    // Deserialize array length for message field [curves]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.curves = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.curves[i] = BezierCurve.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [holonomic_path]
    data.holonomic_path = Path.deserialize(buffer, bufferOffset);
    // Deserialize message field [feasible]
    data.feasible = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [fitness]
    data.fitness = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [t_firstCollision]
    data.t_firstCollision = _deserializer.duration(buffer, bufferOffset);
    // Deserialize message field [i_subPopulation]
    data.i_subPopulation = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [t_start]
    data.t_start = _deserializer.duration(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += trajectory_msgs.msg.JointTrajectory.getMessageSize(object.trajectory);
    length += 2 * object.i_knotPoints.length;
    object.curves.forEach((val) => {
      length += BezierCurve.getMessageSize(val);
    });
    length += Path.getMessageSize(object.holonomic_path);
    return length + 36;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ramp_msgs/RampTrajectory';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '13d45cd502292765a8d2b315f6b3795c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    uint16 id
    trajectory_msgs/JointTrajectory trajectory
    uint16[] i_knotPoints
    ramp_msgs/BezierCurve[] curves
    ramp_msgs/Path holonomic_path
    
    bool feasible
    float64 fitness
    
    duration t_firstCollision
    int8 i_subPopulation
    
    duration t_start
    
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
    MSG: trajectory_msgs/JointTrajectory
    Header header
    string[] joint_names
    JointTrajectoryPoint[] points
    
    ================================================================================
    MSG: trajectory_msgs/JointTrajectoryPoint
    # Each trajectory point specifies either positions[, velocities[, accelerations]]
    # or positions[, effort] for the trajectory to be executed.
    # All specified values are in the same order as the joint names in JointTrajectory.msg
    
    float64[] positions
    float64[] velocities
    float64[] accelerations
    float64[] effort
    duration time_from_start
    
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
    MSG: ramp_msgs/MotionState
    float64[] positions
    float64[] velocities
    float64[] accelerations
    float64[] jerks
    
    # change to duration
    float64 time
    
    ================================================================================
    MSG: ramp_msgs/Path
    ramp_msgs/KnotPoint[] points
    
    ================================================================================
    MSG: ramp_msgs/KnotPoint
    ramp_msgs/MotionState motionState
    uint32 stopTime
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RampTrajectory(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.trajectory !== undefined) {
      resolved.trajectory = trajectory_msgs.msg.JointTrajectory.Resolve(msg.trajectory)
    }
    else {
      resolved.trajectory = new trajectory_msgs.msg.JointTrajectory()
    }

    if (msg.i_knotPoints !== undefined) {
      resolved.i_knotPoints = msg.i_knotPoints;
    }
    else {
      resolved.i_knotPoints = []
    }

    if (msg.curves !== undefined) {
      resolved.curves = new Array(msg.curves.length);
      for (let i = 0; i < resolved.curves.length; ++i) {
        resolved.curves[i] = BezierCurve.Resolve(msg.curves[i]);
      }
    }
    else {
      resolved.curves = []
    }

    if (msg.holonomic_path !== undefined) {
      resolved.holonomic_path = Path.Resolve(msg.holonomic_path)
    }
    else {
      resolved.holonomic_path = new Path()
    }

    if (msg.feasible !== undefined) {
      resolved.feasible = msg.feasible;
    }
    else {
      resolved.feasible = false
    }

    if (msg.fitness !== undefined) {
      resolved.fitness = msg.fitness;
    }
    else {
      resolved.fitness = 0.0
    }

    if (msg.t_firstCollision !== undefined) {
      resolved.t_firstCollision = msg.t_firstCollision;
    }
    else {
      resolved.t_firstCollision = {secs: 0, nsecs: 0}
    }

    if (msg.i_subPopulation !== undefined) {
      resolved.i_subPopulation = msg.i_subPopulation;
    }
    else {
      resolved.i_subPopulation = 0
    }

    if (msg.t_start !== undefined) {
      resolved.t_start = msg.t_start;
    }
    else {
      resolved.t_start = {secs: 0, nsecs: 0}
    }

    return resolved;
    }
};

module.exports = RampTrajectory;
