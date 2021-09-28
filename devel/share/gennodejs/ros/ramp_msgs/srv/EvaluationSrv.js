// Auto-generated. Do not edit!

// (in-package ramp_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let EvaluationRequest = require('../msg/EvaluationRequest.js');

//-----------------------------------------------------------

let EvaluationResponse = require('../msg/EvaluationResponse.js');

//-----------------------------------------------------------

class EvaluationSrvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.reqs = null;
    }
    else {
      if (initObj.hasOwnProperty('reqs')) {
        this.reqs = initObj.reqs
      }
      else {
        this.reqs = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EvaluationSrvRequest
    // Serialize message field [reqs]
    // Serialize the length for message field [reqs]
    bufferOffset = _serializer.uint32(obj.reqs.length, buffer, bufferOffset);
    obj.reqs.forEach((val) => {
      bufferOffset = EvaluationRequest.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EvaluationSrvRequest
    let len;
    let data = new EvaluationSrvRequest(null);
    // Deserialize message field [reqs]
    // Deserialize array length for message field [reqs]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.reqs = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.reqs[i] = EvaluationRequest.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.reqs.forEach((val) => {
      length += EvaluationRequest.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ramp_msgs/EvaluationSrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c5f4358a97c363f83106d9ab74137f28';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    EvaluationRequest[] reqs
    
    
    ================================================================================
    MSG: ramp_msgs/EvaluationRequest
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
    const resolved = new EvaluationSrvRequest(null);
    if (msg.reqs !== undefined) {
      resolved.reqs = new Array(msg.reqs.length);
      for (let i = 0; i < resolved.reqs.length; ++i) {
        resolved.reqs[i] = EvaluationRequest.Resolve(msg.reqs[i]);
      }
    }
    else {
      resolved.reqs = []
    }

    return resolved;
    }
};

class EvaluationSrvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.resps = null;
    }
    else {
      if (initObj.hasOwnProperty('resps')) {
        this.resps = initObj.resps
      }
      else {
        this.resps = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EvaluationSrvResponse
    // Serialize message field [resps]
    // Serialize the length for message field [resps]
    bufferOffset = _serializer.uint32(obj.resps.length, buffer, bufferOffset);
    obj.resps.forEach((val) => {
      bufferOffset = EvaluationResponse.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EvaluationSrvResponse
    let len;
    let data = new EvaluationSrvResponse(null);
    // Deserialize message field [resps]
    // Deserialize array length for message field [resps]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.resps = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.resps[i] = EvaluationResponse.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 17 * object.resps.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ramp_msgs/EvaluationSrvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4c511a6bddace16490772be119d9e7d0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    EvaluationResponse[] resps
    
    
    ================================================================================
    MSG: ramp_msgs/EvaluationResponse
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
    const resolved = new EvaluationSrvResponse(null);
    if (msg.resps !== undefined) {
      resolved.resps = new Array(msg.resps.length);
      for (let i = 0; i < resolved.resps.length; ++i) {
        resolved.resps[i] = EvaluationResponse.Resolve(msg.resps[i]);
      }
    }
    else {
      resolved.resps = []
    }

    return resolved;
    }
};

module.exports = {
  Request: EvaluationSrvRequest,
  Response: EvaluationSrvResponse,
  md5sum() { return 'bb14ee9ba2b91774273c2644f7a15381'; },
  datatype() { return 'ramp_msgs/EvaluationSrv'; }
};
