// Auto-generated. Do not edit!

// (in-package robostilt_common.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let SingleActuator = require('./SingleActuator.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class ActuatorsState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.actuators = null;
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
      if (initObj.hasOwnProperty('actuators')) {
        this.actuators = initObj.actuators
      }
      else {
        this.actuators = [];
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
    // Serializes a message object of type ActuatorsState
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [actuators]
    // Serialize the length for message field [actuators]
    bufferOffset = _serializer.uint32(obj.actuators.length, buffer, bufferOffset);
    obj.actuators.forEach((val) => {
      bufferOffset = SingleActuator.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [have_all_been_homed]
    bufferOffset = _serializer.bool(obj.have_all_been_homed, buffer, bufferOffset);
    // Serialize message field [all_are_ready]
    bufferOffset = _serializer.bool(obj.all_are_ready, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ActuatorsState
    let len;
    let data = new ActuatorsState(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [actuators]
    // Deserialize array length for message field [actuators]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.actuators = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.actuators[i] = SingleActuator.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [have_all_been_homed]
    data.have_all_been_homed = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [all_are_ready]
    data.all_are_ready = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.actuators.forEach((val) => {
      length += SingleActuator.getMessageSize(val);
    });
    return length + 6;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robostilt_common/ActuatorsState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '49208e592a412e2ba9a50e6f208bf8a1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This is a message that holds the state of all actuators as an array.
    
    uint8 COUNT=8
    uint8 THIRD_FRAME_PRISMATIC = 0
    uint8 LEG_1 = 1
    uint8 LEG_2 = 2
    uint8 LEG_3 = 3
    uint8 LEG_4 = 4
    uint8 LEG_5 = 5
    uint8 LEG_6 = 6
    uint8 THIRD_FRAME_REVOLUTE = 7
    
    
    Header header
    
    SingleActuator[] actuators
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
    
    ================================================================================
    MSG: robostilt_common/SingleActuator
    # This is a message that holds extended data for a single actuator
    
    string  name
    int32   index
    
    float64 position
    float64 position_setpoint   #trajectorized setpoint TODO
    float64 position_goal       #long term goal
    
    float64 velocity
    float64 velocity_setpoint   #trajectorized velocity TODO
    
    float64 effort
    float64 effort_limit
    
    
    float32 manipulation
    float32 progress
    
    bool is_moving
    bool is_ready
    bool has_been_homed
    bool is_supporting_weight
    
    
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ActuatorsState(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.actuators !== undefined) {
      resolved.actuators = new Array(msg.actuators.length);
      for (let i = 0; i < resolved.actuators.length; ++i) {
        resolved.actuators[i] = SingleActuator.Resolve(msg.actuators[i]);
      }
    }
    else {
      resolved.actuators = []
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
ActuatorsState.Constants = {
  COUNT: 8,
  THIRD_FRAME_PRISMATIC: 0,
  LEG_1: 1,
  LEG_2: 2,
  LEG_3: 3,
  LEG_4: 4,
  LEG_5: 5,
  LEG_6: 6,
  THIRD_FRAME_REVOLUTE: 7,
}

module.exports = ActuatorsState;
