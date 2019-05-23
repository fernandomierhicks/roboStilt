// Generated by gencpp from file robostilt_common/LowerLegsOnFrameRequest.msg
// DO NOT EDIT!


#ifndef ROBOSTILT_COMMON_MESSAGE_LOWERLEGSONFRAMEREQUEST_H
#define ROBOSTILT_COMMON_MESSAGE_LOWERLEGSONFRAMEREQUEST_H


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
struct LowerLegsOnFrameRequest_
{
  typedef LowerLegsOnFrameRequest_<ContainerAllocator> Type;

  LowerLegsOnFrameRequest_()
    : frame(0)
    , position(0.0)
    , velocity(0.0)
    , effort(0.0)  {
    }
  LowerLegsOnFrameRequest_(const ContainerAllocator& _alloc)
    : frame(0)
    , position(0.0)
    , velocity(0.0)
    , effort(0.0)  {
  (void)_alloc;
    }



   typedef int32_t _frame_type;
  _frame_type frame;

   typedef double _position_type;
  _position_type position;

   typedef double _velocity_type;
  _velocity_type velocity;

   typedef double _effort_type;
  _effort_type effort;





  typedef boost::shared_ptr< ::robostilt_common::LowerLegsOnFrameRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::robostilt_common::LowerLegsOnFrameRequest_<ContainerAllocator> const> ConstPtr;

}; // struct LowerLegsOnFrameRequest_

typedef ::robostilt_common::LowerLegsOnFrameRequest_<std::allocator<void> > LowerLegsOnFrameRequest;

typedef boost::shared_ptr< ::robostilt_common::LowerLegsOnFrameRequest > LowerLegsOnFrameRequestPtr;
typedef boost::shared_ptr< ::robostilt_common::LowerLegsOnFrameRequest const> LowerLegsOnFrameRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::robostilt_common::LowerLegsOnFrameRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::robostilt_common::LowerLegsOnFrameRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace robostilt_common

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'robostilt_common': ['/home/fernandomierhicks/robostilt/src/robostilt_common/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::robostilt_common::LowerLegsOnFrameRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robostilt_common::LowerLegsOnFrameRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robostilt_common::LowerLegsOnFrameRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robostilt_common::LowerLegsOnFrameRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robostilt_common::LowerLegsOnFrameRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robostilt_common::LowerLegsOnFrameRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::robostilt_common::LowerLegsOnFrameRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "fd4f38832c71d9c02f9cd37fa8b01d72";
  }

  static const char* value(const ::robostilt_common::LowerLegsOnFrameRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xfd4f38832c71d9c0ULL;
  static const uint64_t static_value2 = 0x2f9cd37fa8b01d72ULL;
};

template<class ContainerAllocator>
struct DataType< ::robostilt_common::LowerLegsOnFrameRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "robostilt_common/LowerLegsOnFrameRequest";
  }

  static const char* value(const ::robostilt_common::LowerLegsOnFrameRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::robostilt_common::LowerLegsOnFrameRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n\
int32 frame\n\
float64 position\n\
float64 velocity\n\
float64 effort\n\
";
  }

  static const char* value(const ::robostilt_common::LowerLegsOnFrameRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::robostilt_common::LowerLegsOnFrameRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.frame);
      stream.next(m.position);
      stream.next(m.velocity);
      stream.next(m.effort);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct LowerLegsOnFrameRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::robostilt_common::LowerLegsOnFrameRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::robostilt_common::LowerLegsOnFrameRequest_<ContainerAllocator>& v)
  {
    s << indent << "frame: ";
    Printer<int32_t>::stream(s, indent + "  ", v.frame);
    s << indent << "position: ";
    Printer<double>::stream(s, indent + "  ", v.position);
    s << indent << "velocity: ";
    Printer<double>::stream(s, indent + "  ", v.velocity);
    s << indent << "effort: ";
    Printer<double>::stream(s, indent + "  ", v.effort);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROBOSTILT_COMMON_MESSAGE_LOWERLEGSONFRAMEREQUEST_H
