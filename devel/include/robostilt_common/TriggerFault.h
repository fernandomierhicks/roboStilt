// Generated by gencpp from file robostilt_common/TriggerFault.msg
// DO NOT EDIT!


#ifndef ROBOSTILT_COMMON_MESSAGE_TRIGGERFAULT_H
#define ROBOSTILT_COMMON_MESSAGE_TRIGGERFAULT_H

#include <ros/service_traits.h>


#include <robostilt_common/TriggerFaultRequest.h>
#include <robostilt_common/TriggerFaultResponse.h>


namespace robostilt_common
{

struct TriggerFault
{

typedef TriggerFaultRequest Request;
typedef TriggerFaultResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct TriggerFault
} // namespace robostilt_common


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::robostilt_common::TriggerFault > {
  static const char* value()
  {
    return "48423ad27bada7cd9dea5c77b2e6e973";
  }

  static const char* value(const ::robostilt_common::TriggerFault&) { return value(); }
};

template<>
struct DataType< ::robostilt_common::TriggerFault > {
  static const char* value()
  {
    return "robostilt_common/TriggerFault";
  }

  static const char* value(const ::robostilt_common::TriggerFault&) { return value(); }
};


// service_traits::MD5Sum< ::robostilt_common::TriggerFaultRequest> should match 
// service_traits::MD5Sum< ::robostilt_common::TriggerFault > 
template<>
struct MD5Sum< ::robostilt_common::TriggerFaultRequest>
{
  static const char* value()
  {
    return MD5Sum< ::robostilt_common::TriggerFault >::value();
  }
  static const char* value(const ::robostilt_common::TriggerFaultRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::robostilt_common::TriggerFaultRequest> should match 
// service_traits::DataType< ::robostilt_common::TriggerFault > 
template<>
struct DataType< ::robostilt_common::TriggerFaultRequest>
{
  static const char* value()
  {
    return DataType< ::robostilt_common::TriggerFault >::value();
  }
  static const char* value(const ::robostilt_common::TriggerFaultRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::robostilt_common::TriggerFaultResponse> should match 
// service_traits::MD5Sum< ::robostilt_common::TriggerFault > 
template<>
struct MD5Sum< ::robostilt_common::TriggerFaultResponse>
{
  static const char* value()
  {
    return MD5Sum< ::robostilt_common::TriggerFault >::value();
  }
  static const char* value(const ::robostilt_common::TriggerFaultResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::robostilt_common::TriggerFaultResponse> should match 
// service_traits::DataType< ::robostilt_common::TriggerFault > 
template<>
struct DataType< ::robostilt_common::TriggerFaultResponse>
{
  static const char* value()
  {
    return DataType< ::robostilt_common::TriggerFault >::value();
  }
  static const char* value(const ::robostilt_common::TriggerFaultResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // ROBOSTILT_COMMON_MESSAGE_TRIGGERFAULT_H
