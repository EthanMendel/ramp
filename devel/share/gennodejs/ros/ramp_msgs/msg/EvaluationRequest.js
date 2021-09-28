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
let CircleGroup = require('./CircleGroup.js');

//-----------------------------------------------------------

class EvaluationRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.trajectory = null;
      this.robot_radius = null;
      this.currentTheta = null;
      this.theta_cc = null;
      this.obstacle_trjs = null;
      this.obstacle_cir_groups = null;
      this.imminent_collision = null;
      this.offset = null;
      this.full_eval = null;
      this.consider_trans = null;
      this.trans_possible = null;
      this.hmap_eval = null;
    }
    else {
      if (initObj.hasOwnProperty('trajectory')) {
        this.trajectory = initObj.trajectory
      }
      else {
        this.trajectory = new RampTrajectory();
      }
      if (initObj.hasOwnProperty('robot_radius')) {
        this.robot_radius = initObj.robot_radius
      }
      else {
        this.robot_radius = 0.0;
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
      if (initObj.hasOwnProperty('obstacle_cir_groups')) {
        this.obstacle_cir_groups = initObj.obstacle_cir_groups
      }
      else {
        this.obstacle_cir_groups = [];
      }
      if (initObj.hasOwnProperty('imminent_collision')) {
        this.imminent_collision = initObj.imminent_collision
      }
      else {
        this.imminent_collision = false;
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
      if (initObj.hasOwnProperty('hmap_eval')) {
        this.hmap_eval = initObj.hmap_eval
      }
      else {
        this.hmap_eval = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EvaluationRequest
    // Serialize message field [trajectory]
    bufferOffset = RampTrajectory.serialize(obj.trajectory, buffer, bufferOffset);
    // Serialize message field [robot_radius]
    bufferOffset = _serializer.float64(obj.robot_radius, buffer, bufferOffset);
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
    // Serialize message field [obstacle_cir_groups]
    // Serialize the length for message field [obstacle_cir_groups]
    bufferOffset = _serializer.uint32(obj.obstacle_cir_groups.length, buffer, bufferOffset);
    obj.obstacle_cir_groups.forEach((val) => {
      bufferOffset = CircleGroup.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [imminent_collision]
    bufferOffset = _serializer.bool(obj.imminent_collision, buffer, bufferOffset);
    // Serialize message field [offset]
    bufferOffset = _serializer.float64(obj.offset, buffer, bufferOffset);
    // Serialize message field [full_eval]
    bufferOffset = _serializer.bool(obj.full_eval, buffer, bufferOffset);
    // Serialize message field [consider_trans]
    bufferOffset = _serializer.bool(obj.consider_trans, buffer, bufferOffset);
    // Serialize message field [trans_possible]
    bufferOffset = _serializer.bool(obj.trans_possible, buffer, bufferOffset);
    // Serialize message field [hmap_eval]
    bufferOffset = _serializer.bool(obj.hmap_eval, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EvaluationRequest
    let len;
    let data = new EvaluationRequest(null);
    // Deserialize message field [trajectory]
    data.trajectory = RampTrajectory.deserialize(buffer, bufferOffset);
    // Deserialize message field [robot_radius]
    data.robot_radius = _deserializer.float64(buffer, bufferOffset);
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
    // Deserialize message field [obstacle_cir_groups]
    // Deserialize array length for message field [obstacle_cir_groups]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.obstacle_cir_groups = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.obstacle_cir_groups[i] = CircleGroup.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [imminent_collision]
    data.imminent_collision = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [offset]
    data.offset = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [full_eval]
    data.full_eval = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [consider_trans]
    data.consider_trans = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [trans_possible]
    data.trans_possible = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [hmap_eval]
    data.hmap_eval = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += RampTrajectory.getMessageSize(object.trajectory);
    object.obstacle_trjs.forEach((val) => {
      length += RampTrajectory.getMessageSize(val);
    });
    object.obstacle_cir_groups.forEach((val) => {
      length += CircleGroup.getMessageSize(val);
    });
    return length + 45;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ramp_msgs/EvaluationRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '40e525bfb7e4a2a45b79429a4d3f00db';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    RampTrajectory trajectory
    float64 robot_radius
    float64 currentTheta
    float64 theta_cc
    RampTrajectory[] obstacle_trjs
    CircleGroup[] obstacle_cir_groups
    bool imminent_collision
    float64 offset
    bool full_eval
    
    bool consider_trans
    bool trans_possible
    bool hmap_eval
    
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
    
    ================================================================================
    MSG: ramp_msgs/CircleGroup
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
    const resolved = new EvaluationRequest(null);
    if (msg.trajectory !== undefined) {
      resolved.trajectory = RampTrajectory.Resolve(msg.trajectory)
    }
    else {
      resolved.trajectory = new RampTrajectory()
    }

    if (msg.robot_radius !== undefined) {
      resolved.robot_radius = msg.robot_radius;
    }
    else {
      resolved.robot_radius = 0.0
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

    if (msg.obstacle_cir_groups !== undefined) {
      resolved.obstacle_cir_groups = new Array(msg.obstacle_cir_groups.length);
      for (let i = 0; i < resolved.obstacle_cir_groups.length; ++i) {
        resolved.obstacle_cir_groups[i] = CircleGroup.Resolve(msg.obstacle_cir_groups[i]);
      }
    }
    else {
      resolved.obstacle_cir_groups = []
    }

    if (msg.imminent_collision !== undefined) {
      resolved.imminent_collision = msg.imminent_collision;
    }
    else {
      resolved.imminent_collision = false
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

    if (msg.hmap_eval !== undefined) {
      resolved.hmap_eval = msg.hmap_eval;
    }
    else {
      resolved.hmap_eval = false
    }

    return resolved;
    }
};

module.exports = EvaluationRequest;
