// Generated by gencpp from file robostilt_common/MovePrismatic.msg
// DO NOT EDIT!


#ifndef ROBOSTILT_COMMON_MESSAGE_MOVEPRISMATIC_H
#define ROBOSTILT_COMMON_MESSAGE_MOVEPRISMATIC_H

#include <ros/service_traits.h>


#include <robostilt_common/MovePrismaticRequest.h>
#include <robostilt_common/MovePrismaticResponse.h>


namespace robostilt_common
{

struct MovePrismatic
{

typedef MovePrismaticRequest Request;
typedef MovePrismaticResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct MovePrismatic
} // namespace robostilt_common


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::robostilt_common::MovePrismatic > {
  static const char* value()
  {
    return "b8d63a087f5948862a72cd21437ca0f9";
  }

  static const char* value(const ::robostilt_common::MovePrismatic&) { return value(); }
};

template<>
struct DataType< ::robostilt_common::MovePrismatic > {
  static const char* value()
  {
    return "robostilt_common/MovePrismatic";
  }

  static const char* value(const ::robostilt_common::MovePrismatic&) { return value(); }
};


// service_traits::MD5Sum< ::robostilt_common::MovePrismaticRequest> should match 
// service_traits::MD5Sum< ::robostilt_common::MovePrismatic > 
template<>
struct MD5Sum< ::robostilt_common::MovePrismaticRequest>
{
  static const char* value()
  {
    return MD5Sum< ::robostilt_common::MovePrismatic >::value();
  }
  static const char* value(const ::robostilt_common::MovePrismaticRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::robostilt_common::MovePrismaticRequest> should match 
// service_traits::DataType< ::robostilt_common::MovePrismatic > 
template<>
struct DataType< ::robostilt_common::MovePrismaticRequest>
{
  static const char* value()
  {
    return DataType< ::robostilt_common::MovePrismatic >::value();
  }
  static const char* value(const ::robostilt_common::MovePrismaticRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::robostilt_common::MovePrismaticResponse> should match 
// service_traits::MD5Sum< ::robostilt_common::MovePrismatic > 
template<>
struct MD5Sum< ::robostilt_common::MovePrismaticResponse>
{
  static const char* value()
  {
    return MD5Sum< ::robostilt_common::MovePrismatic >::value();
  }
  static const char* value(const ::robostilt_common::MovePrismaticResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::robostilt_common::MovePrismaticResponse> should match 
// service_traits::DataType< ::robostilt_common::MovePrismatic > 
template<>
struct DataType< ::robostilt_common::MovePrismaticResponse>
{
  static const char* value()
  {
    return DataType< ::robostilt_common::MovePrismatic >::value();
  }
  static const char* value(const ::robostilt_common::MovePrismaticResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // ROBOSTILT_COMMON_MESSAGE_MOVEPRISMATIC_H
