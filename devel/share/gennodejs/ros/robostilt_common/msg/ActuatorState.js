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

class ActuatorState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.name = null;
      this.position = null;
      this.velocity = null;
      this.effort = null;
      this.effort_limit = null;
      this.position_setpoint = null;
      this.manipulation = null;
      this.progress = null;
      this.is_moving = null;
      this.is_ready = null;
      this.has_been_homed = null;
      this.is_supporting_weight = null;
      this.have_all_been_homed = null;
      this.all_are_ready = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = [];
      }
      if (initObj.hasOwnProperty('position')) {
        this.position = initObj.position
      }
      else {
        this.position = [];
      }
      if (initObj.hasOwnProperty('velocity')) {
        this.velocity = initObj.velocity
      }
      else {
        this.velocity = [];
      }
      if (initObj.hasOwnProperty('effort')) {
        this.effort = initObj.effort
      }
      else {
        this.effort = [];
      }
      if (initObj.hasOwnProperty('effort_limit')) {
        this.effort_limit = initObj.effort_limit
      }
      else {
        this.effort_limit = [];
      }
      if (initObj.hasOwnProperty('position_setpoint')) {
        this.position_setpoint = initObj.position_setpoint
      }
      else {
        this.position_setpoint = [];
      }
      if (initObj.hasOwnProperty('manipulation')) {
        this.manipulation = initObj.manipulation
      }
      else {
        this.manipulation = [];
      }
      if (initObj.hasOwnProperty('progress')) {
        this.progress = initObj.progress
      }
      else {
        this.progress = [];
      }
      if (initObj.hasOwnProperty('is_moving')) {
        this.is_moving = initObj.is_moving
      }
      else {
        this.is_moving = [];
      }
      if (initObj.hasOwnProperty('is_ready')) {
        this.is_ready = initObj.is_ready
      }
      else {
        this.is_ready = [];
      }
      if (initObj.hasOwnProperty('has_been_homed')) {
        this.has_been_homed = initObj.has_been_homed
      }
      else {
        this.has_been_homed = [];
      }
      if (initObj.hasOwnProperty('is_supporting_weight')) {
        this.is_supporting_weight = initObj.is_supporting_weight
      }
      else {
        this.is_supporting_weight = [];
      }
      if (initObj.hasOwnProperty('have_all_been_homed')) {
        this.have_all_been_homed = initObj.have_all_been_homed
      }
      else {
        this.have_all_been_homed = false;
      }
      if (initObj.hasOwnProperty('all_are_ready')) {
        this.all_are_ready = initObj.all_are_ready
      }
      else {
        this.all_are_ready = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ActuatorState
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [name]
    bufferOffset = _arraySerializer.string(obj.name, buffer, bufferOffset, null);
    // Serialize message field [position]
    bufferOffset = _arraySerializer.float64(obj.position, buffer, bufferOffset, null);
    // Serialize message field [velocity]
    bufferOffset = _arraySerializer.float64(obj.velocity, buffer, bufferOffset, null);
    // Serialize message field [effort]
    bufferOffset = _arraySerializer.float64(obj.effort, buffer, bufferOffset, null);
    // Serialize message field [effort_limit]
    bufferOffset = _arraySerializer.float64(obj.effort_limit, buffer, bufferOffset, null);
    // Serialize message field [position_setpoint]
    bufferOffset = _arraySerializer.float64(obj.position_setpoint, buffer, bufferOffset, null);
    // Serialize message field [manipulation]
    bufferOffset = _arraySerializer.float32(obj.manipulation, buffer, bufferOffset, null);
    // Serialize message field [progress]
    bufferOffset = _arraySerializer.float32(obj.progress, buffer, bufferOffset, null);
    // Serialize message field [is_moving]
    bufferOffset = _arraySerializer.bool(obj.is_moving, buffer, bufferOffset, null);
    // Serialize message field [is_ready]
    bufferOffset = _arraySerializer.bool(obj.is_ready, buffer, bufferOffset, null);
    // Serialize message field [has_been_homed]
    bufferOffset = _arraySerializer.bool(obj.has_been_homed, buffer, bufferOffset, null);
    // Serialize message field [is_supporting_weight]
    bufferOffset = _arraySerializer.bool(obj.is_supporting_weight, buffer, bufferOffset, null);
    // Serialize message field [have_all_been_homed]
    bufferOffset = _serializer.bool(obj.have_all_been_homed, buffer, bufferOffset);
    // Serialize message field [all_are_ready]
    bufferOffset = _serializer.bool(obj.all_are_ready, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ActuatorState
    let len;
    let data = new ActuatorState(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [name]
    data.name = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [position]
    data.position = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [velocity]
    data.velocity = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [effort]
    data.effort = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [effort_limit]
    data.effort_limit = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [position_setpoint]
    data.position_setpoint = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [manipulation]
    data.manipulation = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [progress]
    data.progress = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [is_moving]
    data.is_moving = _arrayDeserializer.bool(buffer, bufferOffset, null)
    // Deserialize message field [is_ready]
    data.is_ready = _arrayDeserializer.bool(buffer, bufferOffset, null)
    // Deserialize message field [has_been_homed]
    data.has_been_homed = _arrayDeserializer.bool(buffer, bufferOffset, null)
    // Deserialize message field [is_supporting_weight]
    data.is_supporting_weight = _arrayDeserializer.bool(buffer, bufferOffset, null)
    // Deserialize message field [have_all_been_homed]
    data.have_all_been_homed = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [all_are_ready]
    data.all_are_ready = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.name.forEach((val) => {
      length += 4 + val.length;
    });
    length += 8 * object.position.length;
    length += 8 * object.velocity.length;
    length += 8 * object.effort.length;
    length += 8 * object.effort_limit.length;
    length += 8 * object.position_setpoint.length;
    length += 4 * object.manipulation.length;
    length += 4 * object.progress.length;
    length += object.is_moving.length;
    length += object.is_ready.length;
    length += object.has_been_homed.length;
    length += object.is_supporting_weight.length;
    return length + 50;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robostilt_common/ActuatorState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'acf4b6d30f12ebcdcb467bbc886f86be';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This is a message that holds extended data of all actuators
    
    
    # Power supply status constants
    uint8 COUNT=8
    
    uint8 PRISMATIC = 0
    uint8 LEG_1 = 1
    uint8 LEG_2 = 2
    uint8 LEG_3 = 3
    uint8 LEG_4 = 4
    uint8 LEG_5 = 5
    uint8 LEG_6 = 6
    uint8 REVOLUTE = 7
    
    Header header
    
    string[] name
    float64[] position
    float64[] velocity
    float64[] effort
    float64[] effort_limit
    
    float64[] position_setpoint
    float32[] manipulation
    float32[] progress
    
    bool[] is_moving
    bool[] is_ready
    bool[] has_been_homed
    bool[] is_supporting_weight
    
    bool have_all_been_homed
    bool all_are_ready
    
    
    
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
    const resolved = new ActuatorState(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = []
    }

    if (msg.position !== undefined) {
      resolved.position = msg.position;
    }
    else {
      resolved.position = []
    }

    if (msg.velocity !== undefined) {
      resolved.velocity = msg.velocity;
    }
    else {
      resolved.velocity = []
    }

    if (msg.effort !== undefined) {
      resolved.effort = msg.effort;
    }
    else {
      resolved.effort = []
    }

    if (msg.effort_limit !== undefined) {
      resolved.effort_limit = msg.effort_limit;
    }
    else {
      resolved.effort_limit = []
    }

    if (msg.position_setpoint !== undefined) {
      resolved.position_setpoint = msg.position_setpoint;
    }
    else {
      resolved.position_setpoint = []
    }

    if (msg.manipulation !== undefined) {
      resolved.manipulation = msg.manipulation;
    }
    else {
      resolved.manipulation = []
    }

    if (msg.progress !== undefined) {
      resolved.progress = msg.progress;
    }
    else {
      resolved.progress = []
    }

    if (msg.is_moving !== undefined) {
      resolved.is_moving = msg.is_moving;
    }
    else {
      resolved.is_moving = []
    }

    if (msg.is_ready !== undefined) {
      resolved.is_ready = msg.is_ready;
    }
    else {
      resolved.is_ready = []
    }

    if (msg.has_been_homed !== undefined) {
      resolved.has_been_homed = msg.has_been_homed;
    }
    else {
      resolved.has_been_homed = []
    }

    if (msg.is_supporting_weight !== undefined) {
      resolved.is_supporting_weight = msg.is_supporting_weight;
    }
    else {
      resolved.is_supporting_weight = []
    }

    if (msg.have_all_been_homed !== undefined) {
      resolved.have_all_been_homed = msg.have_all_been_homed;
    }
    else {
      resolved.have_all_been_homed = false
    }

    if (msg.all_are_ready !== undefined) {
      resolved.all_are_ready = msg.all_are_ready;
    }
    else {
      resolved.all_are_ready = false
    }

    return resolved;
    }
};

// Constants for message
ActuatorState.Constants = {
  COUNT: 8,
  PRISMATIC: 0,
  LEG_1: 1,
  LEG_2: 2,
  LEG_3: 3,
  LEG_4: 4,
  LEG_5: 5,
  LEG_6: 6,
  REVOLUTE: 7,
}

module.exports = ActuatorState;
