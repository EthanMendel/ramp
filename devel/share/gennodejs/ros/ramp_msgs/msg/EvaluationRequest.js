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

class EvaluationRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.trajectory = null;
      this.currentTheta = null;
      this.theta_cc = null;
      this.obstacle_trjs = null;
      this.imminent_collision = null;
      this.coll_dist = null;
      this.offset = null;
      this.full_eval = null;
      this.consider_trans = null;
      this.trans_possible = null;
    }
    else {
      if (initObj.hasOwnProperty('trajectory')) {
        this.trajectory = initObj.trajectory
      }
      else {
        this.trajectory = new RampTrajectory();
      }
      if (initObj.hasOwnProperty('currentTheta')) {
        this.currentTheta = initObj.currentTheta
      }
      else {
        this.currentTheta = 0.0;
      }
      if (initObj.hasOwnProperty('theta_cc')) {
        this.theta_cc = initObj.theta_cc
      }
      else {
        this.theta_cc = 0.0;
      }
      if (initObj.hasOwnProperty('obstacle_trjs')) {
        this.obstacle_trjs = initObj.obstacle_trjs
      }
      else {
        this.obstacle_trjs = [];
      }
      if (initObj.hasOwnProperty('imminent_collision')) {
        this.imminent_collision = initObj.imminent_collision
      }
      else {
        this.imminent_collision = false;
      }
      if (initObj.hasOwnProperty('coll_dist')) {
        this.coll_dist = initObj.coll_dist
      }
      else {
        this.coll_dist = 0.0;
      }
      if (initObj.hasOwnProperty('offset')) {
        this.offset = initObj.offset
      }
      else {
        this.offset = 0.0;
      }
      if (initObj.hasOwnProperty('full_eval')) {
        this.full_eval = initObj.full_eval
      }
      else {
        this.full_eval = false;
      }
      if (initObj.hasOwnProperty('consider_trans')) {
        this.consider_trans = initObj.consider_trans
      }
      else {
        this.consider_trans = false;
      }
      if (initObj.hasOwnProperty('trans_possible')) {
        this.trans_possible = initObj.trans_possible
      }
      else {
        this.trans_possible = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EvaluationRequest
    // Serialize message field [trajectory]
    bufferOffset = RampTrajectory.serialize(obj.trajectory, buffer, bufferOffset);
    // Serialize message field [currentTheta]
    bufferOffset = _serializer.float64(obj.currentTheta, buffer, bufferOffset);
    // Serialize message field [theta_cc]
    bufferOffset = _serializer.float64(obj.theta_cc, buffer, bufferOffset);
    // Serialize message field [obstacle_trjs]
    // Serialize the length for message field [obstacle_trjs]
    bufferOffset = _serializer.uint32(obj.obstacle_trjs.length, buffer, bufferOffset);
    obj.obstacle_trjs.forEach((val) => {
      bufferOffset = RampTrajectory.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [imminent_collision]
    bufferOffset = _serializer.bool(obj.imminent_collision, buffer, bufferOffset);
    // Serialize message field [coll_dist]
    bufferOffset = _serializer.float64(obj.coll_dist, buffer, bufferOffset);
    // Serialize message field [offset]
    bufferOffset = _serializer.float64(obj.offset, buffer, bufferOffset);
    // Serialize message field [full_eval]
    bufferOffset = _serializer.bool(obj.full_eval, buffer, bufferOffset);
    // Serialize message field [consider_trans]
    bufferOffset = _serializer.bool(obj.consider_trans, buffer, bufferOffset);
    // Serialize message field [trans_possible]
    bufferOffset = _serializer.bool(obj.trans_possible, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EvaluationRequest
    let len;
    let data = new EvaluationRequest(null);
    // Deserialize message field [trajectory]
    data.trajectory = RampTrajectory.deserialize(buffer, bufferOffset);
    // Deserialize message field [currentTheta]
    data.currentTheta = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [theta_cc]
    data.theta_cc = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [obstacle_trjs]
    // Deserialize array length for message field [obstacle_trjs]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.obstacle_trjs = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.obstacle_trjs[i] = RampTrajectory.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [imminent_collision]
    data.imminent_collision = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [coll_dist]
    data.coll_dist = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [offset]
    data.offset = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [full_eval]
    data.full_eval = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [consider_trans]
    data.consider_trans = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [trans_possible]
    data.trans_possible = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += RampTrajectory.getMessageSize(object.trajectory);
    object.obstacle_trjs.forEach((val) => {
      length += RampTrajectory.getMessageSize(val);
    });
    return length + 40;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ramp_msgs/EvaluationRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8964e17c705f63c522df77b43636a204';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    RampTrajectory trajectory
    float64 currentTheta
    float64 theta_cc
    RampTrajectory[] obstacle_trjs
    bool imminent_collision
    float64 coll_dist
    float64 offset
    bool full_eval
    
    bool consider_trans
    bool trans_possible
    
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
    const resolved = new EvaluationRequest(null);
    if (msg.trajectory !== undefined) {
      resolved.trajectory = RampTrajectory.Resolve(msg.trajectory)
    }
    else {
      resolved.trajectory = new RampTrajectory()
    }

    if (msg.currentTheta !== undefined) {
      resolved.currentTheta = msg.currentTheta;
    }
    else {
      resolved.currentTheta = 0.0
    }

    if (msg.theta_cc !== undefined) {
      resolved.theta_cc = msg.theta_cc;
    }
    else {
      resolved.theta_cc = 0.0
    }

    if (msg.obstacle_trjs !== undefined) {
      resolved.obstacle_trjs = new Array(msg.obstacle_trjs.length);
      for (let i = 0; i < resolved.obstacle_trjs.length; ++i) {
        resolved.obstacle_trjs[i] = RampTrajectory.Resolve(msg.obstacle_trjs[i]);
      }
    }
    else {
      resolved.obstacle_trjs = []
    }

    if (msg.imminent_collision !== undefined) {
      resolved.imminent_collision = msg.imminent_collision;
    }
    else {
      resolved.imminent_collision = false
    }

    if (msg.coll_dist !== undefined) {
      resolved.coll_dist = msg.coll_dist;
    }
    else {
      resolved.coll_dist = 0.0
    }

    if (msg.offset !== undefined) {
      resolved.offset = msg.offset;
    }
    else {
      resolved.offset = 0.0
    }

    if (msg.full_eval !== undefined) {
      resolved.full_eval = msg.full_eval;
    }
    else {
      resolved.full_eval = false
    }

    if (msg.consider_trans !== undefined) {
      resolved.consider_trans = msg.consider_trans;
    }
    else {
      resolved.consider_trans = false
    }

    if (msg.trans_possible !== undefined) {
      resolved.trans_possible = msg.trans_possible;
    }
    else {
      resolved.trans_possible = false
    }

    return resolved;
    }
};

module.exports = EvaluationRequest;
