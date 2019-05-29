// Auto-generated. Do not edit!

// (in-package robostilt_common.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class RobotState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.state = null;
      this.state_string = null;
      this.fault = null;
      this.fault_string = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('state')) {
        this.state = initObj.state
      }
      else {
        this.state = 0;
      }
      if (initObj.hasOwnProperty('state_string')) {
        this.state_string = initObj.state_string
      }
      else {
        this.state_string = '';
      }
      if (initObj.hasOwnProperty('fault')) {
        this.fault = initObj.fault
      }
      else {
        this.fault = 0;
      }
      if (initObj.hasOwnProperty('fault_string')) {
        this.fault_string = initObj.fault_string
      }
      else {
        this.fault_string = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RobotState
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [state]
    bufferOffset = _serializer.int32(obj.state, buffer, bufferOffset);
    // Serialize message field [state_string]
    bufferOffset = _serializer.string(obj.state_string, buffer, bufferOffset);
    // Serialize message field [fault]
    bufferOffset = _serializer.int32(obj.fault, buffer, bufferOffset);
    // Serialize message field [fault_string]
    bufferOffset = _serializer.string(obj.fault_string, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RobotState
    let len;
    let data = new RobotState(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [state]
    data.state = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [state_string]
    data.state_string = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [fault]
    data.fault = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [fault_string]
    data.fault_string = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += object.state_string.length;
    length += object.fault_string.length;
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robostilt_common/RobotState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8d7a63dca06bfd67e6e09bd329a9cf32';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 STATE_READY=0
    int32 STATE_FAULTED=1
    int32 STATE_BUSY_MOVING=2
    int32 STATE_BUSY_COMPUTING=3
    
    int32 FAULT_CLEAR=0
    int32 FAULT_ESTOP=1
    int32 FAULT_EFFORT=2
    int32 FAULT_TRAJECTORY=3
    
    
    Header header
    
    int32 state
    string state_string
    
    int32 fault
    string fault_string
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
    # 0: no frame
    # 1: global frame
    string frame_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RobotState(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.state !== undefined) {
      resolved.state = msg.state;
    }
    else {
      resolved.state = 0
    }

    if (msg.state_string !== undefined) {
      resolved.state_string = msg.state_string;
    }
    else {
      resolved.state_string = ''
    }

    if (msg.fault !== undefined) {
      resolved.fault = msg.fault;
    }
    else {
      resolved.fault = 0
    }

    if (msg.fault_string !== undefined) {
      resolved.fault_string = msg.fault_string;
    }
    else {
      resolved.fault_string = ''
    }

    return resolved;
    }
};

// Constants for message
RobotState.Constants = {
  STATE_READY: 0,
  STATE_FAULTED: 1,
  STATE_BUSY_MOVING: 2,
  STATE_BUSY_COMPUTING: 3,
  FAULT_CLEAR: 0,
  FAULT_ESTOP: 1,
  FAULT_EFFORT: 2,
  FAULT_TRAJECTORY: 3,
}

module.exports = RobotState;
