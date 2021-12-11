// Auto-generated. Do not edit!

// (in-package ramp_planner_new.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class TrajectoryRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.timeNeeded = null;
      this.timeDelta = null;
      this.type = null;
      this.points = null;
    }
    else {
      if (initObj.hasOwnProperty('timeNeeded')) {
        this.timeNeeded = initObj.timeNeeded
      }
      else {
        this.timeNeeded = 0;
      }
      if (initObj.hasOwnProperty('timeDelta')) {
        this.timeDelta = initObj.timeDelta
      }
      else {
        this.timeDelta = 0;
      }
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = '';
      }
      if (initObj.hasOwnProperty('points')) {
        this.points = initObj.points
      }
      else {
        this.points = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TrajectoryRequest
    // Serialize message field [timeNeeded]
    bufferOffset = _serializer.uint8(obj.timeNeeded, buffer, bufferOffset);
    // Serialize message field [timeDelta]
    bufferOffset = _serializer.uint8(obj.timeDelta, buffer, bufferOffset);
    // Serialize message field [type]
    bufferOffset = _serializer.string(obj.type, buffer, bufferOffset);
    // Serialize message field [points]
    // Serialize the length for message field [points]
    bufferOffset = _serializer.uint32(obj.points.length, buffer, bufferOffset);
    obj.points.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Point.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TrajectoryRequest
    let len;
    let data = new TrajectoryRequest(null);
    // Deserialize message field [timeNeeded]
    data.timeNeeded = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [timeDelta]
    data.timeDelta = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [type]
    data.type = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [points]
    // Deserialize array length for message field [points]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.points = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.points[i] = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.type);
    length += 24 * object.points.length;
    return length + 10;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ramp_planner_new/TrajectoryRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5807e025a182a2dd09ae68814e63e47d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 timeNeeded
    uint8 timeDelta
    string type
    geometry_msgs/Point[] points
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
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
    const resolved = new TrajectoryRequest(null);
    if (msg.timeNeeded !== undefined) {
      resolved.timeNeeded = msg.timeNeeded;
    }
    else {
      resolved.timeNeeded = 0
    }

    if (msg.timeDelta !== undefined) {
      resolved.timeDelta = msg.timeDelta;
    }
    else {
      resolved.timeDelta = 0
    }

    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = ''
    }

    if (msg.points !== undefined) {
      resolved.points = new Array(msg.points.length);
      for (let i = 0; i < resolved.points.length; ++i) {
        resolved.points[i] = geometry_msgs.msg.Point.Resolve(msg.points[i]);
      }
    }
    else {
      resolved.points = []
    }

    return resolved;
    }
};

module.exports = TrajectoryRequest;
