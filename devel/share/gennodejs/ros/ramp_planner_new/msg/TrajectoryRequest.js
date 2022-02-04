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
      this.type = null;
      this.points = null;
      this.normVals = null;
      this.hasNext = null;
    }
    else {
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
      if (initObj.hasOwnProperty('normVals')) {
        this.normVals = initObj.normVals
      }
      else {
        this.normVals = [];
      }
      if (initObj.hasOwnProperty('hasNext')) {
        this.hasNext = initObj.hasNext
      }
      else {
        this.hasNext = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TrajectoryRequest
    // Serialize message field [type]
    bufferOffset = _serializer.string(obj.type, buffer, bufferOffset);
    // Serialize message field [points]
    // Serialize the length for message field [points]
    bufferOffset = _serializer.uint32(obj.points.length, buffer, bufferOffset);
    obj.points.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Point.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [normVals]
    bufferOffset = _arraySerializer.float64(obj.normVals, buffer, bufferOffset, null);
    // Serialize message field [hasNext]
    bufferOffset = _serializer.bool(obj.hasNext, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TrajectoryRequest
    let len;
    let data = new TrajectoryRequest(null);
    // Deserialize message field [type]
    data.type = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [points]
    // Deserialize array length for message field [points]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.points = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.points[i] = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [normVals]
    data.normVals = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [hasNext]
    data.hasNext = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.type);
    length += 24 * object.points.length;
    length += 8 * object.normVals.length;
    return length + 13;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ramp_planner_new/TrajectoryRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '670d22841def486d9fd88eee4b9481a0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string type
    geometry_msgs/Point[] points
    float64[] normVals
    bool hasNext
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

    if (msg.normVals !== undefined) {
      resolved.normVals = msg.normVals;
    }
    else {
      resolved.normVals = []
    }

    if (msg.hasNext !== undefined) {
      resolved.hasNext = msg.hasNext;
    }
    else {
      resolved.hasNext = false
    }

    return resolved;
    }
};

module.exports = TrajectoryRequest;
