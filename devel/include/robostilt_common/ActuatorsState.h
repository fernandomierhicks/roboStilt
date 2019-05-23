// Generated by gencpp from file robostilt_common/ActuatorsState.msg
// DO NOT EDIT!


#ifndef ROBOSTILT_COMMON_MESSAGE_ACTUATORSSTATE_H
#define ROBOSTILT_COMMON_MESSAGE_ACTUATORSSTATE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <robostilt_common/ActuatorState.h>

namespace robostilt_common
{
template <class ContainerAllocator>
struct ActuatorsState_
{
  typedef ActuatorsState_<ContainerAllocator> Type;

  ActuatorsState_()
    : header()
    , actuators()
    , have_all_been_homed(false)
    , all_are_ready(false)  {
    }
  ActuatorsState_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , actuators(_alloc)
    , have_all_been_homed(false)
    , all_are_ready(false)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef std::vector< ::robostilt_common::ActuatorState_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::robostilt_common::ActuatorState_<ContainerAllocator> >::other >  _actuators_type;
  _actuators_type actuators;

   typedef uint8_t _have_all_been_homed_type;
  _have_all_been_homed_type have_all_been_homed;

   typedef uint8_t _all_are_ready_type;
  _all_are_ready_type all_are_ready;



  enum {
    COUNT = 8u,
    THIRD_FRAME_PRISMATIC = 0u,
    LEG_1 = 1u,
    LEG_2 = 2u,
    LEG_3 = 3u,
    LEG_4 = 4u,
    LEG_5 = 5u,
    LEG_6 = 6u,
    THIRD_FRAME_REVOLUTE = 7u,
  };


  typedef boost::shared_ptr< ::robostilt_common::ActuatorsState_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::robostilt_common::ActuatorsState_<ContainerAllocator> const> ConstPtr;

}; // struct ActuatorsState_

typedef ::robostilt_common::ActuatorsState_<std::allocator<void> > ActuatorsState;

typedef boost::shared_ptr< ::robostilt_common::ActuatorsState > ActuatorsStatePtr;
typedef boost::shared_ptr< ::robostilt_common::ActuatorsState const> ActuatorsStateConstPtr;

// constants requiring out of line definition

   

   

   

   

   

   

   

   

   



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::robostilt_common::ActuatorsState_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::robostilt_common::ActuatorsState_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace robostilt_common

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': True}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'robostilt_common': ['/home/fernandomierhicks/robostilt/src/robostilt_common/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::robostilt_common::ActuatorsState_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robostilt_common::ActuatorsState_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robostilt_common::ActuatorsState_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robostilt_common::ActuatorsState_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robostilt_common::ActuatorsState_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robostilt_common::ActuatorsState_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::robostilt_common::ActuatorsState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "b738e1ec17f4222e8b4a3330fc699bb7";
  }

  static const char* value(const ::robostilt_common::ActuatorsState_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xb738e1ec17f4222eULL;
  static const uint64_t static_value2 = 0x8b4a3330fc699bb7ULL;
};

template<class ContainerAllocator>
struct DataType< ::robostilt_common::ActuatorsState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "robostilt_common/ActuatorsState";
  }

  static const char* value(const ::robostilt_common::ActuatorsState_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::robostilt_common::ActuatorsState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uint8 COUNT=8\n\
\n\
uint8 THIRD_FRAME_PRISMATIC = 0\n\
uint8 LEG_1 = 1\n\
uint8 LEG_2 = 2\n\
uint8 LEG_3 = 3\n\
uint8 LEG_4 = 4\n\
uint8 LEG_5 = 5\n\
uint8 LEG_6 = 6\n\
uint8 THIRD_FRAME_REVOLUTE = 7\n\
\n\
\n\
Header header\n\
ActuatorState[] actuators\n\
\n\
bool have_all_been_homed\n\
bool all_are_ready\n\
================================================================================\n\
MSG: std_msgs/Header\n\
# Standard metadata for higher-level stamped data types.\n\
# This is generally used to communicate timestamped data \n\
# in a particular coordinate frame.\n\
# \n\
# sequence ID: consecutively increasing ID \n\
uint32 seq\n\
#Two-integer timestamp that is expressed as:\n\
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n\
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n\
# time-handling sugar is provided by the client library\n\
time stamp\n\
#Frame this data is associated with\n\
# 0: no frame\n\
# 1: global frame\n\
string frame_id\n\
\n\
================================================================================\n\
MSG: robostilt_common/ActuatorState\n\
# This is a message that holds extended data for a single actuator\n\
\n\
string  name\n\
int32   index\n\
float64 position\n\
float64 velocity\n\
float64 effort\n\
float64 effort_limit\n\
\n\
float64 position_setpoint\n\
float32 manipulation\n\
float32 progress\n\
\n\
bool is_moving\n\
bool is_ready\n\
bool has_been_homed\n\
bool is_supporting_weight\n\
\n\
\n\
\n\
\n\
";
  }

  static const char* value(const ::robostilt_common::ActuatorsState_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::robostilt_common::ActuatorsState_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.actuators);
      stream.next(m.have_all_been_homed);
      stream.next(m.all_are_ready);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ActuatorsState_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::robostilt_common::ActuatorsState_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::robostilt_common::ActuatorsState_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "actuators[]" << std::endl;
    for (size_t i = 0; i < v.actuators.size(); ++i)
    {
      s << indent << "  actuators[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::robostilt_common::ActuatorState_<ContainerAllocator> >::stream(s, indent + "    ", v.actuators[i]);
    }
    s << indent << "have_all_been_homed: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.have_all_been_homed);
    s << indent << "all_are_ready: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.all_are_ready);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROBOSTILT_COMMON_MESSAGE_ACTUATORSSTATE_H
