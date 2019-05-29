// Generated by gencpp from file robostilt_common/RaiseFrame.msg
// DO NOT EDIT!


#ifndef ROBOSTILT_COMMON_MESSAGE_RAISEFRAME_H
#define ROBOSTILT_COMMON_MESSAGE_RAISEFRAME_H

#include <ros/service_traits.h>


#include <robostilt_common/RaiseFrameRequest.h>
#include <robostilt_common/RaiseFrameResponse.h>


namespace robostilt_common
{

struct RaiseFrame
{

typedef RaiseFrameRequest Request;
typedef RaiseFrameResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct RaiseFrame
} // namespace robostilt_common


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::robostilt_common::RaiseFrame > {
  static const char* value()
  {
    return "b8d63a087f5948862a72cd21437ca0f9";
  }

  static const char* value(const ::robostilt_common::RaiseFrame&) { return value(); }
};

template<>
struct DataType< ::robostilt_common::RaiseFrame > {
  static const char* value()
  {
    return "robostilt_common/RaiseFrame";
  }

  static const char* value(const ::robostilt_common::RaiseFrame&) { return value(); }
};


// service_traits::MD5Sum< ::robostilt_common::RaiseFrameRequest> should match 
// service_traits::MD5Sum< ::robostilt_common::RaiseFrame > 
template<>
struct MD5Sum< ::robostilt_common::RaiseFrameRequest>
{
  static const char* value()
  {
    return MD5Sum< ::robostilt_common::RaiseFrame >::value();
  }
  static const char* value(const ::robostilt_common::RaiseFrameRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::robostilt_common::RaiseFrameRequest> should match 
// service_traits::DataType< ::robostilt_common::RaiseFrame > 
template<>
struct DataType< ::robostilt_common::RaiseFrameRequest>
{
  static const char* value()
  {
    return DataType< ::robostilt_common::RaiseFrame >::value();
  }
  static const char* value(const ::robostilt_common::RaiseFrameRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::robostilt_common::RaiseFrameResponse> should match 
// service_traits::MD5Sum< ::robostilt_common::RaiseFrame > 
template<>
struct MD5Sum< ::robostilt_common::RaiseFrameResponse>
{
  static const char* value()
  {
    return MD5Sum< ::robostilt_common::RaiseFrame >::value();
  }
  static const char* value(const ::robostilt_common::RaiseFrameResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::robostilt_common::RaiseFrameResponse> should match 
// service_traits::DataType< ::robostilt_common::RaiseFrame > 
template<>
struct DataType< ::robostilt_common::RaiseFrameResponse>
{
  static const char* value()
  {
    return DataType< ::robostilt_common::RaiseFrame >::value();
  }
  static const char* value(const ::robostilt_common::RaiseFrameResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // ROBOSTILT_COMMON_MESSAGE_RAISEFRAME_H
