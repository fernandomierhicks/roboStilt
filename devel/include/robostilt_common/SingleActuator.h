// Generated by gencpp from file robostilt_common/SingleActuator.msg
// DO NOT EDIT!


#ifndef ROBOSTILT_COMMON_MESSAGE_SINGLEACTUATOR_H
#define ROBOSTILT_COMMON_MESSAGE_SINGLEACTUATOR_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace robostilt_common
{
template <class ContainerAllocator>
struct SingleActuator_
{
  typedef SingleActuator_<ContainerAllocator> Type;

  SingleActuator_()
    : name()
    , index(0)
    , position(0.0)
    , position_setpoint(0.0)
    , position_goal(0.0)
    , velocity(0.0)
    , velocity_setpoint(0.0)
    , effort(0.0)
    , effort_limit(0.0)
    , manipulation(0.0)
    , progress(0.0)
    , is_moving(false)
    , is_ready(false)
    , has_been_homed(false)
    , is_supporting_weight(false)  {
    }
  SingleActuator_(const ContainerAllocator& _alloc)
    : name(_alloc)
    , index(0)
    , position(0.0)
    , position_setpoint(0.0)
    , position_goal(0.0)
    , velocity(0.0)
    , velocity_setpoint(0.0)
    , effort(0.0)
    , effort_limit(0.0)
    , manipulation(0.0)
    , progress(0.0)
    , is_moving(false)
    , is_ready(false)
    , has_been_homed(false)
    , is_supporting_weight(false)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _name_type;
  _name_type name;

   typedef int32_t _index_type;
  _index_type index;

   typedef double _position_type;
  _position_type position;

   typedef double _position_setpoint_type;
  _position_setpoint_type position_setpoint;

   typedef double _position_goal_type;
  _position_goal_type position_goal;

   typedef double _velocity_type;
  _velocity_type velocity;

   typedef double _velocity_setpoint_type;
  _velocity_setpoint_type velocity_setpoint;

   typedef double _effort_type;
  _effort_type effort;

   typedef double _effort_limit_type;
  _effort_limit_type effort_limit;

   typedef float _manipulation_type;
  _manipulation_type manipulation;

   typedef float _progress_type;
  _progress_type progress;

   typedef uint8_t _is_moving_type;
  _is_moving_type is_moving;

   typedef uint8_t _is_ready_type;
  _is_ready_type is_ready;

   typedef uint8_t _has_been_homed_type;
  _has_been_homed_type has_been_homed;

   typedef uint8_t _is_supporting_weight_type;
  _is_supporting_weight_type is_supporting_weight;





  typedef boost::shared_ptr< ::robostilt_common::SingleActuator_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::robostilt_common::SingleActuator_<ContainerAllocator> const> ConstPtr;

}; // struct SingleActuator_

typedef ::robostilt_common::SingleActuator_<std::allocator<void> > SingleActuator;

typedef boost::shared_ptr< ::robostilt_common::SingleActuator > SingleActuatorPtr;
typedef boost::shared_ptr< ::robostilt_common::SingleActuator const> SingleActuatorConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::robostilt_common::SingleActuator_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::robostilt_common::SingleActuator_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace robostilt_common

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'robostilt_common': ['/home/fernandomierhicks/robostilt/src/robostilt_common/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::robostilt_common::SingleActuator_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robostilt_common::SingleActuator_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robostilt_common::SingleActuator_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robostilt_common::SingleActuator_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robostilt_common::SingleActuator_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robostilt_common::SingleActuator_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::robostilt_common::SingleActuator_<ContainerAllocator> >
{
  static const char* value()
  {
    return "c8adcf30a4a8d2cd998962d19cef108a";
  }

  static const char* value(const ::robostilt_common::SingleActuator_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xc8adcf30a4a8d2cdULL;
  static const uint64_t static_value2 = 0x998962d19cef108aULL;
};

template<class ContainerAllocator>
struct DataType< ::robostilt_common::SingleActuator_<ContainerAllocator> >
{
  static const char* value()
  {
    return "robostilt_common/SingleActuator";
  }

  static const char* value(const ::robostilt_common::SingleActuator_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::robostilt_common::SingleActuator_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# This is a message that holds extended data for a single actuator\n\
\n\
string  name\n\
int32   index\n\
\n\
float64 position\n\
float64 position_setpoint   #trajectorized setpoint TODO\n\
float64 position_goal       #long term goal\n\
\n\
float64 velocity\n\
float64 velocity_setpoint   #trajectorized velocity TODO\n\
\n\
float64 effort\n\
float64 effort_limit\n\
\n\
\n\
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

  static const char* value(const ::robostilt_common::SingleActuator_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::robostilt_common::SingleActuator_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.name);
      stream.next(m.index);
      stream.next(m.position);
      stream.next(m.position_setpoint);
      stream.next(m.position_goal);
      stream.next(m.velocity);
      stream.next(m.velocity_setpoint);
      stream.next(m.effort);
      stream.next(m.effort_limit);
      stream.next(m.manipulation);
      stream.next(m.progress);
      stream.next(m.is_moving);
      stream.next(m.is_ready);
      stream.next(m.has_been_homed);
      stream.next(m.is_supporting_weight);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SingleActuator_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::robostilt_common::SingleActuator_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::robostilt_common::SingleActuator_<ContainerAllocator>& v)
  {
    s << indent << "name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.name);
    s << indent << "index: ";
    Printer<int32_t>::stream(s, indent + "  ", v.index);
    s << indent << "position: ";
    Printer<double>::stream(s, indent + "  ", v.position);
    s << indent << "position_setpoint: ";
    Printer<double>::stream(s, indent + "  ", v.position_setpoint);
    s << indent << "position_goal: ";
    Printer<double>::stream(s, indent + "  ", v.position_goal);
    s << indent << "velocity: ";
    Printer<double>::stream(s, indent + "  ", v.velocity);
    s << indent << "velocity_setpoint: ";
    Printer<double>::stream(s, indent + "  ", v.velocity_setpoint);
    s << indent << "effort: ";
    Printer<double>::stream(s, indent + "  ", v.effort);
    s << indent << "effort_limit: ";
    Printer<double>::stream(s, indent + "  ", v.effort_limit);
    s << indent << "manipulation: ";
    Printer<float>::stream(s, indent + "  ", v.manipulation);
    s << indent << "progress: ";
    Printer<float>::stream(s, indent + "  ", v.progress);
    s << indent << "is_moving: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.is_moving);
    s << indent << "is_ready: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.is_ready);
    s << indent << "has_been_homed: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.has_been_homed);
    s << indent << "is_supporting_weight: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.is_supporting_weight);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROBOSTILT_COMMON_MESSAGE_SINGLEACTUATOR_H
