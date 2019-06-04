
"use strict";

let StopAll = require('./StopAll.js')
let RaiseLegsOnFrame = require('./RaiseLegsOnFrame.js')
let LowerLegsOnFrame = require('./LowerLegsOnFrame.js')
let SetPosition = require('./SetPosition.js')
let RaiseFrame = require('./RaiseFrame.js')
let SetSupportingLegs = require('./SetSupportingLegs.js')
let TriggerFault = require('./TriggerFault.js')
let MovePrismatic = require('./MovePrismatic.js')

module.exports = {
  StopAll: StopAll,
  RaiseLegsOnFrame: RaiseLegsOnFrame,
  LowerLegsOnFrame: LowerLegsOnFrame,
  SetPosition: SetPosition,
  RaiseFrame: RaiseFrame,
  SetSupportingLegs: SetSupportingLegs,
  TriggerFault: TriggerFault,
  MovePrismatic: MovePrismatic,
};
