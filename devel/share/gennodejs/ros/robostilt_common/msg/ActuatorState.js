// Auto-generated. Do not edit!

// (in-package robostilt_common.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class ActuatorState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.name = null;
      this.index = null;
      this.position = null;
      this.position_setpoint = null;
      this.position_goal = null;
      this.velocity = null;
      this.velocity_setpoint = null;
      this.effort = null;
      this.effort_limit = null;
      this.manipulation = null;
      this.progress = null;
      this.is_moving = null;
      this.is_ready = null;
      this.has_been_homed = null;
      this.is_supporting_weight = null;
    }
    else {
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = '';
      }
      if (initObj.hasOwnProperty('index')) {
        this.index = initObj.index
      }
      else {
        this.index = 0;
      }
      if (initObj.hasOwnProperty('position')) {
        this.position = initObj.position
      }
      else {
        this.position = 0.0;
      }
      if (initObj.hasOwnProperty('position_setpoint')) {
        this.position_setpoint = initObj.position_setpoint
      }
      else {
        this.position_setpoint = 0.0;
      }
      if (initObj.hasOwnProperty('position_goal')) {
        this.position_goal = initObj.position_goal
      }
      else {
        this.position_goal = 0.0;
      }
      if (initObj.hasOwnProperty('velocity')) {
        this.velocity = initObj.velocity
      }
      else {
        this.velocity = 0.0;
      }
      if (initObj.hasOwnProperty('velocity_setpoint')) {
        this.velocity_setpoint = initObj.velocity_setpoint
      }
      else {
        this.velocity_setpoint = 0.0;
      }
      if (initObj.hasOwnProperty('effort')) {
        this.effort = initObj.effort
      }
      else {
        this.effort = 0.0;
      }
      if (initObj.hasOwnProperty('effort_limit')) {
        this.effort_limit = initObj.effort_limit
      }
      else {
        this.effort_limit = 0.0;
      }
      if (initObj.hasOwnProperty('manipulation')) {
        this.manipulation = initObj.manipulation
      }
      else {
        this.manipulation = 0.0;
      }
      if (initObj.hasOwnProperty('progress')) {
        this.progress = initObj.progress
      }
      else {
        this.progress = 0.0;
      }
      if (initObj.hasOwnProperty('is_moving')) {
        this.is_moving = initObj.is_moving
      }
      else {
        this.is_moving = false;
      }
      if (initObj.hasOwnProperty('is_ready')) {
        this.is_ready = initObj.is_ready
      }
      else {
        this.is_ready = false;
      }
      if (initObj.hasOwnProperty('has_been_homed')) {
        this.has_been_homed = initObj.has_been_homed
      }
      else {
        this.has_been_homed = false;
      }
      if (initObj.hasOwnProperty('is_supporting_weight')) {
        this.is_supporting_weight = initObj.is_supporting_weight
      }
      else {
        this.is_supporting_weight = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ActuatorState
    // Serialize message field [name]
    bufferOffset = _serializer.string(obj.name, buffer, bufferOffset);
    // Serialize message field [index]
    bufferOffset = _serializer.int32(obj.index, buffer, bufferOffset);
    // Serialize message field [position]
    bufferOffset = _serializer.float64(obj.position, buffer, bufferOffset);
    // Serialize message field [position_setpoint]
    bufferOffset = _serializer.float64(obj.position_setpoint, buffer, bufferOffset);
    // Serialize message field [position_goal]
    bufferOffset = _serializer.float64(obj.position_goal, buffer, bufferOffset);
    // Serialize message field [velocity]
    bufferOffset = _serializer.float64(obj.velocity, buffer, bufferOffset);
    // Serialize message field [velocity_setpoint]
    bufferOffset = _serializer.float64(obj.velocity_setpoint, buffer, bufferOffset);
    // Serialize message field [effort]
    bufferOffset = _serializer.float64(obj.effort, buffer, bufferOffset);
    // Serialize message field [effort_limit]
    bufferOffset = _serializer.float64(obj.effort_limit, buffer, bufferOffset);
    // Serialize message field [manipulation]
    bufferOffset = _serializer.float32(obj.manipulation, buffer, bufferOffset);
    // Serialize message field [progress]
    bufferOffset = _serializer.float32(obj.progress, buffer, bufferOffset);
    // Serialize message field [is_moving]
    bufferOffset = _serializer.bool(obj.is_moving, buffer, bufferOffset);
    // Serialize message field [is_ready]
    bufferOffset = _serializer.bool(obj.is_ready, buffer, bufferOffset);
    // Serialize message field [has_been_homed]
    bufferOffset = _serializer.bool(obj.has_been_homed, buffer, bufferOffset);
    // Serialize message field [is_supporting_weight]
    bufferOffset = _serializer.bool(obj.is_supporting_weight, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ActuatorState
    let len;
    let data = new ActuatorState(null);
    // Deserialize message field [name]
    data.name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [index]
    data.index = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [position]
    data.position = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [position_setpoint]
    data.position_setpoint = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [position_goal]
    data.position_goal = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [velocity]
    data.velocity = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [velocity_setpoint]
    data.velocity_setpoint = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [effort]
    data.effort = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [effort_limit]
    data.effort_limit = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [manipulation]
    data.manipulation = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [progress]
    data.progress = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [is_moving]
    data.is_moving = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [is_ready]
    data.is_ready = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [has_been_homed]
    data.has_been_homed = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [is_supporting_weight]
    data.is_supporting_weight = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.name.length;
    return length + 76;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robostilt_common/ActuatorState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c8adcf30a4a8d2cd998962d19cef108a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This is a message that holds extended data for a single actuator
    
    string  name
    int32   index
    
    float64 position
    float64 position_setpoint   #trajectorized setpoint
    float64 position_goal       #long term goal
    
    float64 velocity
    float64 velocity_setpoint   #trajectorized velocity
    
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
    const resolved = new ActuatorState(null);
    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = ''
    }

    if (msg.index !== undefined) {
      resolved.index = msg.index;
    }
    else {
      resolved.index = 0
    }

    if (msg.position !== undefined) {
      resolved.position = msg.position;
    }
    else {
      resolved.position = 0.0
    }

    if (msg.position_setpoint !== undefined) {
      resolved.position_setpoint = msg.position_setpoint;
    }
    else {
      resolved.position_setpoint = 0.0
    }

    if (msg.position_goal !== undefined) {
      resolved.position_goal = msg.position_goal;
    }
    else {
      resolved.position_goal = 0.0
    }

    if (msg.velocity !== undefined) {
      resolved.velocity = msg.velocity;
    }
    else {
      resolved.velocity = 0.0
    }

    if (msg.velocity_setpoint !== undefined) {
      resolved.velocity_setpoint = msg.velocity_setpoint;
    }
    else {
      resolved.velocity_setpoint = 0.0
    }

    if (msg.effort !== undefined) {
      resolved.effort = msg.effort;
    }
    else {
      resolved.effort = 0.0
    }

    if (msg.effort_limit !== undefined) {
      resolved.effort_limit = msg.effort_limit;
    }
    else {
      resolved.effort_limit = 0.0
    }

    if (msg.manipulation !== undefined) {
      resolved.manipulation = msg.manipulation;
    }
    else {
      resolved.manipulation = 0.0
    }

    if (msg.progress !== undefined) {
      resolved.progress = msg.progress;
    }
    else {
      resolved.progress = 0.0
    }

    if (msg.is_moving !== undefined) {
      resolved.is_moving = msg.is_moving;
    }
    else {
      resolved.is_moving = false
    }

    if (msg.is_ready !== undefined) {
      resolved.is_ready = msg.is_ready;
    }
    else {
      resolved.is_ready = false
    }

    if (msg.has_been_homed !== undefined) {
      resolved.has_been_homed = msg.has_been_homed;
    }
    else {
      resolved.has_been_homed = false
    }

    if (msg.is_supporting_weight !== undefined) {
      resolved.is_supporting_weight = msg.is_supporting_weight;
    }
    else {
      resolved.is_supporting_weight = false
    }

    return resolved;
    }
};

module.exports = ActuatorState;
