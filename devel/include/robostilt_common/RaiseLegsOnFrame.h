// Generated by gencpp from file robostilt_common/RaiseLegsOnFrame.msg
// DO NOT EDIT!


#ifndef ROBOSTILT_COMMON_MESSAGE_RAISELEGSONFRAME_H
#define ROBOSTILT_COMMON_MESSAGE_RAISELEGSONFRAME_H

#include <ros/service_traits.h>


#include <robostilt_common/RaiseLegsOnFrameRequest.h>
#include <robostilt_common/RaiseLegsOnFrameResponse.h>


namespace robostilt_common
{

struct RaiseLegsOnFrame
{

typedef RaiseLegsOnFrameRequest Request;
typedef RaiseLegsOnFrameResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct RaiseLegsOnFrame
} // namespace robostilt_common


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::robostilt_common::RaiseLegsOnFrame > {
  static const char* value()
  {
    return "b8d63a087f5948862a72cd21437ca0f9";
  }

  static const char* value(const ::robostilt_common::RaiseLegsOnFrame&) { return value(); }
};

template<>
struct DataType< ::robostilt_common::RaiseLegsOnFrame > {
  static const char* value()
  {
    return "robostilt_common/RaiseLegsOnFrame";
  }

  static const char* value(const ::robostilt_common::RaiseLegsOnFrame&) { return value(); }
};


// service_traits::MD5Sum< ::robostilt_common::RaiseLegsOnFrameRequest> should match 
// service_traits::MD5Sum< ::robostilt_common::RaiseLegsOnFrame > 
template<>
struct MD5Sum< ::robostilt_common::RaiseLegsOnFrameRequest>
{
  static const char* value()
  {
    return MD5Sum< ::robostilt_common::RaiseLegsOnFrame >::value();
  }
  static const char* value(const ::robostilt_common::RaiseLegsOnFrameRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::robostilt_common::RaiseLegsOnFrameRequest> should match 
// service_traits::DataType< ::robostilt_common::RaiseLegsOnFrame > 
template<>
struct DataType< ::robostilt_common::RaiseLegsOnFrameRequest>
{
  static const char* value()
  {
    return DataType< ::robostilt_common::RaiseLegsOnFrame >::value();
  }
  static const char* value(const ::robostilt_common::RaiseLegsOnFrameRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::robostilt_common::RaiseLegsOnFrameResponse> should match 
// service_traits::MD5Sum< ::robostilt_common::RaiseLegsOnFrame > 
template<>
struct MD5Sum< ::robostilt_common::RaiseLegsOnFrameResponse>
{
  static const char* value()
  {
    return MD5Sum< ::robostilt_common::RaiseLegsOnFrame >::value();
  }
  static const char* value(const ::robostilt_common::RaiseLegsOnFrameResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::robostilt_common::RaiseLegsOnFrameResponse> should match 
// service_traits::DataType< ::robostilt_common::RaiseLegsOnFrame > 
template<>
struct DataType< ::robostilt_common::RaiseLegsOnFrameResponse>
{
  static const char* value()
  {
    return DataType< ::robostilt_common::RaiseLegsOnFrame >::value();
  }
  static const char* value(const ::robostilt_common::RaiseLegsOnFrameResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // ROBOSTILT_COMMON_MESSAGE_RAISELEGSONFRAME_H