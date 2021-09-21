// Auto-generated. Do not edit!

// (in-package ramp_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let TrajectoryRequest = require('../msg/TrajectoryRequest.js');

//-----------------------------------------------------------

let RampTrajectory = require('../msg/RampTrajectory.js');
let TrajectoryResponse = require('../msg/TrajectoryResponse.js');

//-----------------------------------------------------------

class TrajectorySrvRequest {
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
    // Serializes a message object of type TrajectorySrvRequest
    // Serialize message field [reqs]
    // Serialize the length for message field [reqs]
    bufferOffset = _serializer.uint32(obj.reqs.length, buffer, bufferOffset);
    obj.reqs.forEach((val) => {
      bufferOffset = TrajectoryRequest.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TrajectorySrvRequest
    let len;
    let data = new TrajectorySrvRequest(null);
    // Deserialize message field [reqs]
    // Deserialize array length for message field [reqs]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.reqs = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.reqs[i] = TrajectoryRequest.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.reqs.forEach((val) => {
      length += TrajectoryRequest.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ramp_msgs/TrajectorySrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '101e27bc6a9ab5f6be0769461d2fc9bd';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    TrajectoryRequest[] reqs
    
    
    ================================================================================
    MSG: ramp_msgs/TrajectoryRequest
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
    const resolved = new TrajectorySrvRequest(null);
    if (msg.reqs !== undefined) {
      resolved.reqs = new Array(msg.reqs.length);
      for (let i = 0; i < resolved.reqs.length; ++i) {
        resolved.reqs[i] = TrajectoryRequest.Resolve(msg.reqs[i]);
      }
    }
    else {
      resolved.reqs = []
    }

    return resolved;
    }
};

class TrajectorySrvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.trajectory = null;
      this.error = null;
      this.resps = null;
    }
    else {
      if (initObj.hasOwnProperty('trajectory')) {
        this.trajectory = initObj.trajectory
      }
      else {
        this.trajectory = new RampTrajectory();
      }
      if (initObj.hasOwnProperty('error')) {
        this.error = initObj.error
      }
      else {
        this.error = false;
      }
      if (initObj.hasOwnProperty('resps')) {
        this.resps = initObj.resps
      }
      else {
        this.resps = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TrajectorySrvResponse
    // Serialize message field [trajectory]
    bufferOffset = RampTrajectory.serialize(obj.trajectory, buffer, bufferOffset);
    // Serialize message field [error]
    bufferOffset = _serializer.bool(obj.error, buffer, bufferOffset);
    // Serialize message field [resps]
    // Serialize the length for message field [resps]
    bufferOffset = _serializer.uint32(obj.resps.length, buffer, bufferOffset);
    obj.resps.forEach((val) => {
      bufferOffset = TrajectoryResponse.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TrajectorySrvResponse
    let len;
    let data = new TrajectorySrvResponse(null);
    // Deserialize message field [trajectory]
    data.trajectory = RampTrajectory.deserialize(buffer, bufferOffset);
    // Deserialize message field [error]
    data.error = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [resps]
    // Deserialize array length for message field [resps]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.resps = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.resps[i] = TrajectoryResponse.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += RampTrajectory.getMessageSize(object.trajectory);
    object.resps.forEach((val) => {
      length += TrajectoryResponse.getMessageSize(val);
    });
    return length + 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ramp_msgs/TrajectorySrvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9c1e8ebdfb3e8233fe73af09818604e7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    RampTrajectory trajectory
    bool error
    
    TrajectoryResponse[] resps
    
    
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
    MSG: ramp_msgs/TrajectoryResponse
    RampTrajectory trajectory
    bool error
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TrajectorySrvResponse(null);
    if (msg.trajectory !== undefined) {
      resolved.trajectory = RampTrajectory.Resolve(msg.trajectory)
    }
    else {
      resolved.trajectory = new RampTrajectory()
    }

    if (msg.error !== undefined) {
      resolved.error = msg.error;
    }
    else {
      resolved.error = false
    }

    if (msg.resps !== undefined) {
      resolved.resps = new Array(msg.resps.length);
      for (let i = 0; i < resolved.resps.length; ++i) {
        resolved.resps[i] = TrajectoryResponse.Resolve(msg.resps[i]);
      }
    }
    else {
      resolved.resps = []
    }

    return resolved;
    }
};

module.exports = {
  Request: TrajectorySrvRequest,
  Response: TrajectorySrvResponse,
  md5sum() { return '74cb2a92026a7e1f5cd832b3efb48cb0'; },
  datatype() { return 'ramp_msgs/TrajectorySrv'; }
};
