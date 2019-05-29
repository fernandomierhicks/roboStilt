// Generated by gencpp from file robostilt_common/SetSupportingLegs.msg
// DO NOT EDIT!


#ifndef ROBOSTILT_COMMON_MESSAGE_SETSUPPORTINGLEGS_H
#define ROBOSTILT_COMMON_MESSAGE_SETSUPPORTINGLEGS_H

#include <ros/service_traits.h>


#include <robostilt_common/SetSupportingLegsRequest.h>
#include <robostilt_common/SetSupportingLegsResponse.h>


namespace robostilt_common
{

struct SetSupportingLegs
{

typedef SetSupportingLegsRequest Request;
typedef SetSupportingLegsResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct SetSupportingLegs
} // namespace robostilt_common


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::robostilt_common::SetSupportingLegs > {
  static const char* value()
  {
    return "7f54c2f8a83517db50c6f0cbd59094f8";
  }

  static const char* value(const ::robostilt_common::SetSupportingLegs&) { return value(); }
};

template<>
struct DataType< ::robostilt_common::SetSupportingLegs > {
  static const char* value()
  {
    return "robostilt_common/SetSupportingLegs";
  }

  static const char* value(const ::robostilt_common::SetSupportingLegs&) { return value(); }
};


// service_traits::MD5Sum< ::robostilt_common::SetSupportingLegsRequest> should match 
// service_traits::MD5Sum< ::robostilt_common::SetSupportingLegs > 
template<>
struct MD5Sum< ::robostilt_common::SetSupportingLegsRequest>
{
  static const char* value()
  {
    return MD5Sum< ::robostilt_common::SetSupportingLegs >::value();
  }
  static const char* value(const ::robostilt_common::SetSupportingLegsRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::robostilt_common::SetSupportingLegsRequest> should match 
// service_traits::DataType< ::robostilt_common::SetSupportingLegs > 
template<>
struct DataType< ::robostilt_common::SetSupportingLegsRequest>
{
  static const char* value()
  {
    return DataType< ::robostilt_common::SetSupportingLegs >::value();
  }
  static const char* value(const ::robostilt_common::SetSupportingLegsRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::robostilt_common::SetSupportingLegsResponse> should match 
// service_traits::MD5Sum< ::robostilt_common::SetSupportingLegs > 
template<>
struct MD5Sum< ::robostilt_common::SetSupportingLegsResponse>
{
  static const char* value()
  {
    return MD5Sum< ::robostilt_common::SetSupportingLegs >::value();
  }
  static const char* value(const ::robostilt_common::SetSupportingLegsResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::robostilt_common::SetSupportingLegsResponse> should match 
// service_traits::DataType< ::robostilt_common::SetSupportingLegs > 
template<>
struct DataType< ::robostilt_common::SetSupportingLegsResponse>
{
  static const char* value()
  {
    return DataType< ::robostilt_common::SetSupportingLegs >::value();
  }
  static const char* value(const ::robostilt_common::SetSupportingLegsResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // ROBOSTILT_COMMON_MESSAGE_SETSUPPORTINGLEGS_H
