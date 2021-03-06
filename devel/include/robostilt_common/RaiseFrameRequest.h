// Generated by gencpp from file robostilt_common/RaiseFrameRequest.msg
// DO NOT EDIT!


#ifndef ROBOSTILT_COMMON_MESSAGE_RAISEFRAMEREQUEST_H
#define ROBOSTILT_COMMON_MESSAGE_RAISEFRAMEREQUEST_H


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
struct RaiseFrameRequest_
{
  typedef RaiseFrameRequest_<ContainerAllocator> Type;

  RaiseFrameRequest_()
    : frame(0)
    , position(0.0)  {
    }
  RaiseFrameRequest_(const ContainerAllocator& _alloc)
    : frame(0)
    , position(0.0)  {
  (void)_alloc;
    }



   typedef int32_t _frame_type;
  _frame_type frame;

   typedef double _position_type;
  _position_type position;





  typedef boost::shared_ptr< ::robostilt_common::RaiseFrameRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::robostilt_common::RaiseFrameRequest_<ContainerAllocator> const> ConstPtr;

}; // struct RaiseFrameRequest_

typedef ::robostilt_common::RaiseFrameRequest_<std::allocator<void> > RaiseFrameRequest;

typedef boost::shared_ptr< ::robostilt_common::RaiseFrameRequest > RaiseFrameRequestPtr;
typedef boost::shared_ptr< ::robostilt_common::RaiseFrameRequest const> RaiseFrameRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::robostilt_common::RaiseFrameRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::robostilt_common::RaiseFrameRequest_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::robostilt_common::RaiseFrameRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robostilt_common::RaiseFrameRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robostilt_common::RaiseFrameRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robostilt_common::RaiseFrameRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robostilt_common::RaiseFrameRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robostilt_common::RaiseFrameRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::robostilt_common::RaiseFrameRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "7d0e0ad310bb7aef9c9a49e66c7e845c";
  }

  static const char* value(const ::robostilt_common::RaiseFrameRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x7d0e0ad310bb7aefULL;
  static const uint64_t static_value2 = 0x9c9a49e66c7e845cULL;
};

template<class ContainerAllocator>
struct DataType< ::robostilt_common::RaiseFrameRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "robostilt_common/RaiseFrameRequest";
  }

  static const char* value(const ::robostilt_common::RaiseFrameRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::robostilt_common::RaiseFrameRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32 frame\n\
float64 position\n\
\n\
\n\
\n\
";
  }

  static const char* value(const ::robostilt_common::RaiseFrameRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::robostilt_common::RaiseFrameRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.frame);
      stream.next(m.position);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct RaiseFrameRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::robostilt_common::RaiseFrameRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::robostilt_common::RaiseFrameRequest_<ContainerAllocator>& v)
  {
    s << indent << "frame: ";
    Printer<int32_t>::stream(s, indent + "  ", v.frame);
    s << indent << "position: ";
    Printer<double>::stream(s, indent + "  ", v.position);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROBOSTILT_COMMON_MESSAGE_RAISEFRAMEREQUEST_H
