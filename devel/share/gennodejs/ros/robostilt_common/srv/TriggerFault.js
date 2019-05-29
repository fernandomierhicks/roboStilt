// Auto-generated. Do not edit!

// (in-package robostilt_common.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class TriggerFaultRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.fault_code = null;
    }
    else {
      if (initObj.hasOwnProperty('fault_code')) {
        this.fault_code = initObj.fault_code
      }
      else {
        this.fault_code = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TriggerFaultRequest
    // Serialize message field [fault_code]
    bufferOffset = _serializer.int32(obj.fault_code, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TriggerFaultRequest
    let len;
    let data = new TriggerFaultRequest(null);
    // Deserialize message field [fault_code]
    data.fault_code = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robostilt_common/TriggerFaultRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd9002628eb8c255f6b9219bd73cf0ec3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 fault_code
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TriggerFaultRequest(null);
    if (msg.fault_code !== undefined) {
      resolved.fault_code = msg.fault_code;
    }
    else {
      resolved.fault_code = 0
    }

    return resolved;
    }
};

class TriggerFaultResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TriggerFaultResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TriggerFaultResponse
    let len;
    let data = new TriggerFaultResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robostilt_common/TriggerFaultResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '358e233cde0c8a8bcfea4ce193f8fc15';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TriggerFaultResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    return resolved;
    }
};

module.exports = {
  Request: TriggerFaultRequest,
  Response: TriggerFaultResponse,
  md5sum() { return '48423ad27bada7cd9dea5c77b2e6e973'; },
  datatype() { return 'robostilt_common/TriggerFault'; }
};
