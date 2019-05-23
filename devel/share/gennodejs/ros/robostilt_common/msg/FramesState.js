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

class FramesState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.supporting_frame = null;
    }
    else {
      if (initObj.hasOwnProperty('supporting_frame')) {
        this.supporting_frame = initObj.supporting_frame
      }
      else {
        this.supporting_frame = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FramesState
    // Serialize message field [supporting_frame]
    bufferOffset = _serializer.uint8(obj.supporting_frame, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FramesState
    let len;
    let data = new FramesState(null);
    // Deserialize message field [supporting_frame]
    data.supporting_frame = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robostilt_common/FramesState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6960690b13db489543fcbbdcab8fcd47';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 NONE=0
    uint8 ODD = 1
    uint8 EVEN = 2
    uint8 PRISMATIC = 3
    uint8 REVOLUTE = 4
    uint8 ODD_AND_EVEN = 5
    uint8 PRISMATIC_AND_REVOLUTE = 6
    
    uint8 supporting_frame
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new FramesState(null);
    if (msg.supporting_frame !== undefined) {
      resolved.supporting_frame = msg.supporting_frame;
    }
    else {
      resolved.supporting_frame = 0
    }

    return resolved;
    }
};

// Constants for message
FramesState.Constants = {
  NONE: 0,
  ODD: 1,
  EVEN: 2,
  PRISMATIC: 3,
  REVOLUTE: 4,
  ODD_AND_EVEN: 5,
  PRISMATIC_AND_REVOLUTE: 6,
}

module.exports = FramesState;
