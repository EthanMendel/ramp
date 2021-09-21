// Auto-generated. Do not edit!

// (in-package ramp_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let RampTrajectory = require('./RampTrajectory.js');

//-----------------------------------------------------------

class Population {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.population = null;
      this.best_id = null;
      this.robot_id = null;
    }
    else {
      if (initObj.hasOwnProperty('population')) {
        this.population = initObj.population
      }
      else {
        this.population = [];
      }
      if (initObj.hasOwnProperty('best_id')) {
        this.best_id = initObj.best_id
      }
      else {
        this.best_id = 0;
      }
      if (initObj.hasOwnProperty('robot_id')) {
        this.robot_id = initObj.robot_id
      }
      else {
        this.robot_id = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Population
    // Serialize message field [population]
    // Serialize the length for message field [population]
    bufferOffset = _serializer.uint32(obj.population.length, buffer, bufferOffset);
    obj.population.forEach((val) => {
      bufferOffset = RampTrajectory.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [best_id]
    bufferOffset = _serializer.uint32(obj.best_id, buffer, bufferOffset);
    // Serialize message field [robot_id]
    bufferOffset = _serializer.uint32(obj.robot_id, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Population
    let len;
    let data = new Population(null);
    // Deserialize message field [population]
    // Deserialize array length for message field [population]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.population = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.population[i] = RampTrajectory.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [best_id]
    data.best_id = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [robot_id]
    data.robot_id = _deserializer.uint32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.population.forEach((val) => {
      length += RampTrajectory.getMessageSize(val);
    });
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ramp_msgs/Population';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8c341abc608a5ae75ad01c78647a2f4d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    ramp_msgs/RampTrajectory[] population
    uint32 best_id
    uint32 robot_id
    
    ================================================================================
    MSG: ramp_msgs/RampTrajectory
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
    const resolved = new Population(null);
    if (msg.population !== undefined) {
      resolved.population = new Array(msg.population.length);
      for (let i = 0; i < resolved.population.length; ++i) {
        resolved.population[i] = RampTrajectory.Resolve(msg.population[i]);
      }
    }
    else {
      resolved.population = []
    }

    if (msg.best_id !== undefined) {
      resolved.best_id = msg.best_id;
    }
    else {
      resolved.best_id = 0
    }

    if (msg.robot_id !== undefined) {
      resolved.robot_id = msg.robot_id;
    }
    else {
      resolved.robot_id = 0
    }

    return resolved;
    }
};

module.exports = Population;
