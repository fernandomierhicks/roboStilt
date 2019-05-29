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

class SetSupportingLegsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.indexes = null;
      this.is_supporting_weight = null;
    }
    else {
      if (initObj.hasOwnProperty('indexes')) {
        this.indexes = initObj.indexes
      }
      else {
        this.indexes = [];
      }
      if (initObj.hasOwnProperty('is_supporting_weight')) {
        this.is_supporting_weight = initObj.is_supporting_weight
      }
      else {
        this.is_supporting_weight = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetSupportingLegsRequest
    // Serialize message field [indexes]
    bufferOffset = _arraySerializer.int32(obj.indexes, buffer, bufferOffset, null);
    // Serialize message field [is_supporting_weight]
    bufferOffset = _arraySerializer.bool(obj.is_supporting_weight, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetSupportingLegsRequest
    let len;
    let data = new SetSupportingLegsRequest(null);
    // Deserialize message field [indexes]
    data.indexes = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [is_supporting_weight]
    data.is_supporting_weight = _arrayDeserializer.bool(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.indexes.length;
    length += object.is_supporting_weight.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robostilt_common/SetSupportingLegsRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ebc461152beaceb4199f054fe9699d75';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32[] indexes
    bool[] is_supporting_weight
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetSupportingLegsRequest(null);
    if (msg.indexes !== undefined) {
      resolved.indexes = msg.indexes;
    }
    else {
      resolved.indexes = []
    }

    if (msg.is_supporting_weight !== undefined) {
      resolved.is_supporting_weight = msg.is_supporting_weight;
    }
    else {
      resolved.is_supporting_weight = []
    }

    return resolved;
    }
};

class SetSupportingLegsResponse {
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
    // Serializes a message object of type SetSupportingLegsResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetSupportingLegsResponse
    let len;
    let data = new SetSupportingLegsResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robostilt_common/SetSupportingLegsResponse';
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
    const resolved = new SetSupportingLegsResponse(null);
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
  Request: SetSupportingLegsRequest,
  Response: SetSupportingLegsResponse,
  md5sum() { return '7f54c2f8a83517db50c6f0cbd59094f8'; },
  datatype() { return 'robostilt_common/SetSupportingLegs'; }
};
