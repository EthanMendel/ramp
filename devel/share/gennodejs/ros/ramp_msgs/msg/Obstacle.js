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
let CircleGroup = require('./CircleGroup.js');
let nav_msgs = _finder('nav_msgs');
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class Obstacle {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ob_ms = null;
      this.cirGroup = null;
      this.odom = null;
      this.T_w_odom = null;
    }
    else {
      if (initObj.hasOwnProperty('ob_ms')) {
        this.ob_ms = initObj.ob_ms
      }
      else {
        this.ob_ms = new MotionState();
      }
      if (initObj.hasOwnProperty('cirGroup')) {
        this.cirGroup = initObj.cirGroup
      }
      else {
        this.cirGroup = new CircleGroup();
      }
      if (initObj.hasOwnProperty('odom')) {
        this.odom = initObj.odom
      }
      else {
        this.odom = new nav_msgs.msg.Odometry();
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
    // Serialize message field [cirGroup]
    bufferOffset = CircleGroup.serialize(obj.cirGroup, buffer, bufferOffset);
    // Serialize message field [odom]
    bufferOffset = nav_msgs.msg.Odometry.serialize(obj.odom, buffer, bufferOffset);
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
    // Deserialize message field [cirGroup]
    data.cirGroup = CircleGroup.deserialize(buffer, bufferOffset);
    // Deserialize message field [odom]
    data.odom = nav_msgs.msg.Odometry.deserialize(buffer, bufferOffset);
    // Deserialize message field [T_w_odom]
    data.T_w_odom = geometry_msgs.msg.Transform.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += MotionState.getMessageSize(object.ob_ms);
    length += CircleGroup.getMessageSize(object.cirGroup);
    length += nav_msgs.msg.Odometry.getMessageSize(object.odom);
    return length + 56;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ramp_msgs/Obstacle';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4161a43c4114be728fdd1d8e33f7e027';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    ramp_msgs/MotionState ob_ms
    ramp_msgs/CircleGroup cirGroup
    nav_msgs/Odometry odom
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
    ================================================================================
    MSG: nav_msgs/Odometry
    # This represents an estimate of a position and velocity in free space.  
    # The pose in this message should be specified in the coordinate frame given by header.frame_id.
    # The twist in this message should be specified in the coordinate frame given by the child_frame_id
    Header header
    string child_frame_id
    geometry_msgs/PoseWithCovariance pose
    geometry_msgs/TwistWithCovariance twist
    
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
    MSG: geometry_msgs/PoseWithCovariance
    # This represents a pose in free space with uncertainty.
    
    Pose pose
    
    # Row-major representation of the 6x6 covariance matrix
    # The orientation parameters use a fixed-axis representation.
    # In order, the parameters are:
    # (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)
    float64[36] covariance
    
    ================================================================================
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
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
    
    ================================================================================
    MSG: geometry_msgs/TwistWithCovariance
    # This expresses velocity in free space with uncertainty.
    
    Twist twist
    
    # Row-major representation of the 6x6 covariance matrix
    # The orientation parameters use a fixed-axis representation.
    # In order, the parameters are:
    # (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)
    float64[36] covariance
    
    ================================================================================
    MSG: geometry_msgs/Twist
    # This expresses velocity in free space broken into its linear and angular parts.
    Vector3  linear
    Vector3  angular
    
    ================================================================================
    MSG: geometry_msgs/Transform
    # This represents the transform between two coordinate frames in free space.
    
    Vector3 translation
    Quaternion rotation
    
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

    if (msg.cirGroup !== undefined) {
      resolved.cirGroup = CircleGroup.Resolve(msg.cirGroup)
    }
    else {
      resolved.cirGroup = new CircleGroup()
    }

    if (msg.odom !== undefined) {
      resolved.odom = nav_msgs.msg.Odometry.Resolve(msg.odom)
    }
    else {
      resolved.odom = new nav_msgs.msg.Odometry()
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
