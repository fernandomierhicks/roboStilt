// Generated by gencpp from file robostilt_common/FramesState.msg
// DO NOT EDIT!


#ifndef ROBOSTILT_COMMON_MESSAGE_FRAMESSTATE_H
#define ROBOSTILT_COMMON_MESSAGE_FRAMESSTATE_H


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
struct FramesState_
{
  typedef FramesState_<ContainerAllocator> Type;

  FramesState_()
    : supporting_frame(0)  {
    }
  FramesState_(const ContainerAllocator& _alloc)
    : supporting_frame(0)  {
  (void)_alloc;
    }



   typedef uint8_t _supporting_frame_type;
  _supporting_frame_type supporting_frame;



  enum {
    NONE = 0u,
    ODD = 1u,
    EVEN = 2u,
    PRISMATIC = 3u,
    REVOLUTE = 4u,
    ODD_AND_EVEN = 5u,
    PRISMATIC_AND_REVOLUTE = 6u,
  };


  typedef boost::shared_ptr< ::robostilt_common::FramesState_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::robostilt_common::FramesState_<ContainerAllocator> const> ConstPtr;

}; // struct FramesState_

typedef ::robostilt_common::FramesState_<std::allocator<void> > FramesState;

typedef boost::shared_ptr< ::robostilt_common::FramesState > FramesStatePtr;
typedef boost::shared_ptr< ::robostilt_common::FramesState const> FramesStateConstPtr;

// constants requiring out of line definition

   

   

   

   

   

   

   



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::robostilt_common::FramesState_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::robostilt_common::FramesState_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::robostilt_common::FramesState_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robostilt_common::FramesState_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robostilt_common::FramesState_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robostilt_common::FramesState_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robostilt_common::FramesState_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robostilt_common::FramesState_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::robostilt_common::FramesState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "6960690b13db489543fcbbdcab8fcd47";
  }

  static const char* value(const ::robostilt_common::FramesState_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x6960690b13db4895ULL;
  static const uint64_t static_value2 = 0x43fcbbdcab8fcd47ULL;
};

template<class ContainerAllocator>
struct DataType< ::robostilt_common::FramesState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "robostilt_common/FramesState";
  }

  static const char* value(const ::robostilt_common::FramesState_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::robostilt_common::FramesState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uint8 NONE=0\n\
uint8 ODD = 1\n\
uint8 EVEN = 2\n\
uint8 PRISMATIC = 3\n\
uint8 REVOLUTE = 4\n\
uint8 ODD_AND_EVEN = 5\n\
uint8 PRISMATIC_AND_REVOLUTE = 6\n\
\n\
uint8 supporting_frame\n\
";
  }

  static const char* value(const ::robostilt_common::FramesState_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::robostilt_common::FramesState_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.supporting_frame);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct FramesState_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::robostilt_common::FramesState_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::robostilt_common::FramesState_<ContainerAllocator>& v)
  {
    s << indent << "supporting_frame: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.supporting_frame);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROBOSTILT_COMMON_MESSAGE_FRAMESSTATE_H
