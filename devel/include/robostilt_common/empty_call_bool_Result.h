// Generated by gencpp from file robostilt_common/empty_call_bool_Result.msg
// DO NOT EDIT!


#ifndef ROBOSTILT_COMMON_MESSAGE_EMPTY_CALL_BOOL_RESULT_H
#define ROBOSTILT_COMMON_MESSAGE_EMPTY_CALL_BOOL_RESULT_H

#include <ros/service_traits.h>


#include <robostilt_common/empty_call_bool_ResultRequest.h>
#include <robostilt_common/empty_call_bool_ResultResponse.h>


namespace robostilt_common
{

struct empty_call_bool_Result
{

typedef empty_call_bool_ResultRequest Request;
typedef empty_call_bool_ResultResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct empty_call_bool_Result
} // namespace robostilt_common


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::robostilt_common::empty_call_bool_Result > {
  static const char* value()
  {
    return "eb13ac1f1354ccecb7941ee8fa2192e8";
  }

  static const char* value(const ::robostilt_common::empty_call_bool_Result&) { return value(); }
};

template<>
struct DataType< ::robostilt_common::empty_call_bool_Result > {
  static const char* value()
  {
    return "robostilt_common/empty_call_bool_Result";
  }

  static const char* value(const ::robostilt_common::empty_call_bool_Result&) { return value(); }
};


// service_traits::MD5Sum< ::robostilt_common::empty_call_bool_ResultRequest> should match 
// service_traits::MD5Sum< ::robostilt_common::empty_call_bool_Result > 
template<>
struct MD5Sum< ::robostilt_common::empty_call_bool_ResultRequest>
{
  static const char* value()
  {
    return MD5Sum< ::robostilt_common::empty_call_bool_Result >::value();
  }
  static const char* value(const ::robostilt_common::empty_call_bool_ResultRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::robostilt_common::empty_call_bool_ResultRequest> should match 
// service_traits::DataType< ::robostilt_common::empty_call_bool_Result > 
template<>
struct DataType< ::robostilt_common::empty_call_bool_ResultRequest>
{
  static const char* value()
  {
    return DataType< ::robostilt_common::empty_call_bool_Result >::value();
  }
  static const char* value(const ::robostilt_common::empty_call_bool_ResultRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::robostilt_common::empty_call_bool_ResultResponse> should match 
// service_traits::MD5Sum< ::robostilt_common::empty_call_bool_Result > 
template<>
struct MD5Sum< ::robostilt_common::empty_call_bool_ResultResponse>
{
  static const char* value()
  {
    return MD5Sum< ::robostilt_common::empty_call_bool_Result >::value();
  }
  static const char* value(const ::robostilt_common::empty_call_bool_ResultResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::robostilt_common::empty_call_bool_ResultResponse> should match 
// service_traits::DataType< ::robostilt_common::empty_call_bool_Result > 
template<>
struct DataType< ::robostilt_common::empty_call_bool_ResultResponse>
{
  static const char* value()
  {
    return DataType< ::robostilt_common::empty_call_bool_Result >::value();
  }
  static const char* value(const ::robostilt_common::empty_call_bool_ResultResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // ROBOSTILT_COMMON_MESSAGE_EMPTY_CALL_BOOL_RESULT_H
