# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from robostilt_common/SingleActuator.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class SingleActuator(genpy.Message):
  _md5sum = "e6916bddab2de3c4943df05029f6f5bc"
  _type = "robostilt_common/SingleActuator"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """# This is a message that holds extended data for a single actuator

string  name
int32   index

float64 position
float64 position_setpoint   #trajectorized setpoint TODO
float64 position_goal       #long term goal

float64 velocity
float64 velocity_setpoint   #trajectorized velocity TODO

float64 effort
float64 effort_limit_upper
float64 effort_limit_lower
float64 effort_fault_expected


float32 manipulation
float32 progress

bool is_moving
bool is_ready
bool has_been_homed
bool is_supporting_weight





"""
  __slots__ = ['name','index','position','position_setpoint','position_goal','velocity','velocity_setpoint','effort','effort_limit_upper','effort_limit_lower','effort_fault_expected','manipulation','progress','is_moving','is_ready','has_been_homed','is_supporting_weight']
  _slot_types = ['string','int32','float64','float64','float64','float64','float64','float64','float64','float64','float64','float32','float32','bool','bool','bool','bool']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       name,index,position,position_setpoint,position_goal,velocity,velocity_setpoint,effort,effort_limit_upper,effort_limit_lower,effort_fault_expected,manipulation,progress,is_moving,is_ready,has_been_homed,is_supporting_weight

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(SingleActuator, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.name is None:
        self.name = ''
      if self.index is None:
        self.index = 0
      if self.position is None:
        self.position = 0.
      if self.position_setpoint is None:
        self.position_setpoint = 0.
      if self.position_goal is None:
        self.position_goal = 0.
      if self.velocity is None:
        self.velocity = 0.
      if self.velocity_setpoint is None:
        self.velocity_setpoint = 0.
      if self.effort is None:
        self.effort = 0.
      if self.effort_limit_upper is None:
        self.effort_limit_upper = 0.
      if self.effort_limit_lower is None:
        self.effort_limit_lower = 0.
      if self.effort_fault_expected is None:
        self.effort_fault_expected = 0.
      if self.manipulation is None:
        self.manipulation = 0.
      if self.progress is None:
        self.progress = 0.
      if self.is_moving is None:
        self.is_moving = False
      if self.is_ready is None:
        self.is_ready = False
      if self.has_been_homed is None:
        self.has_been_homed = False
      if self.is_supporting_weight is None:
        self.is_supporting_weight = False
    else:
      self.name = ''
      self.index = 0
      self.position = 0.
      self.position_setpoint = 0.
      self.position_goal = 0.
      self.velocity = 0.
      self.velocity_setpoint = 0.
      self.effort = 0.
      self.effort_limit_upper = 0.
      self.effort_limit_lower = 0.
      self.effort_fault_expected = 0.
      self.manipulation = 0.
      self.progress = 0.
      self.is_moving = False
      self.is_ready = False
      self.has_been_homed = False
      self.is_supporting_weight = False

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self.name
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_i9d2f4B().pack(_x.index, _x.position, _x.position_setpoint, _x.position_goal, _x.velocity, _x.velocity_setpoint, _x.effort, _x.effort_limit_upper, _x.effort_limit_lower, _x.effort_fault_expected, _x.manipulation, _x.progress, _x.is_moving, _x.is_ready, _x.has_been_homed, _x.is_supporting_weight))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.name = str[start:end].decode('utf-8')
      else:
        self.name = str[start:end]
      _x = self
      start = end
      end += 88
      (_x.index, _x.position, _x.position_setpoint, _x.position_goal, _x.velocity, _x.velocity_setpoint, _x.effort, _x.effort_limit_upper, _x.effort_limit_lower, _x.effort_fault_expected, _x.manipulation, _x.progress, _x.is_moving, _x.is_ready, _x.has_been_homed, _x.is_supporting_weight,) = _get_struct_i9d2f4B().unpack(str[start:end])
      self.is_moving = bool(self.is_moving)
      self.is_ready = bool(self.is_ready)
      self.has_been_homed = bool(self.has_been_homed)
      self.is_supporting_weight = bool(self.is_supporting_weight)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self.name
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_i9d2f4B().pack(_x.index, _x.position, _x.position_setpoint, _x.position_goal, _x.velocity, _x.velocity_setpoint, _x.effort, _x.effort_limit_upper, _x.effort_limit_lower, _x.effort_fault_expected, _x.manipulation, _x.progress, _x.is_moving, _x.is_ready, _x.has_been_homed, _x.is_supporting_weight))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.name = str[start:end].decode('utf-8')
      else:
        self.name = str[start:end]
      _x = self
      start = end
      end += 88
      (_x.index, _x.position, _x.position_setpoint, _x.position_goal, _x.velocity, _x.velocity_setpoint, _x.effort, _x.effort_limit_upper, _x.effort_limit_lower, _x.effort_fault_expected, _x.manipulation, _x.progress, _x.is_moving, _x.is_ready, _x.has_been_homed, _x.is_supporting_weight,) = _get_struct_i9d2f4B().unpack(str[start:end])
      self.is_moving = bool(self.is_moving)
      self.is_ready = bool(self.is_ready)
      self.has_been_homed = bool(self.has_been_homed)
      self.is_supporting_weight = bool(self.is_supporting_weight)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_i9d2f4B = None
def _get_struct_i9d2f4B():
    global _struct_i9d2f4B
    if _struct_i9d2f4B is None:
        _struct_i9d2f4B = struct.Struct("<i9d2f4B")
    return _struct_i9d2f4B
