// Generated by gencpp from file ramp_msgs/Range.msg
// DO NOT EDIT!


#ifndef RAMP_MSGS_MESSAGE_RANGE_H
#define RAMP_MSGS_MESSAGE_RANGE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace ramp_msgs
{
template <class ContainerAllocator>
struct Range_
{
  typedef Range_<ContainerAllocator> Type;

  Range_()
    : min(0.0)
    , max(0.0)  {
    }
  Range_(const ContainerAllocator& _alloc)
    : min(0.0)
    , max(0.0)  {
  (void)_alloc;
    }



   typedef double _min_type;
  _min_type min;

   typedef double _max_type;
  _max_type max;





  typedef boost::shared_ptr< ::ramp_msgs::Range_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ramp_msgs::Range_<ContainerAllocator> const> ConstPtr;

}; // struct Range_

typedef ::ramp_msgs::Range_<std::allocator<void> > Range;

typedef boost::shared_ptr< ::ramp_msgs::Range > RangePtr;
typedef boost::shared_ptr< ::ramp_msgs::Range const> RangeConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ramp_msgs::Range_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ramp_msgs::Range_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ramp_msgs::Range_<ContainerAllocator1> & lhs, const ::ramp_msgs::Range_<ContainerAllocator2> & rhs)
{
  return lhs.min == rhs.min &&
    lhs.max == rhs.max;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ramp_msgs::Range_<ContainerAllocator1> & lhs, const ::ramp_msgs::Range_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ramp_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::ramp_msgs::Range_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ramp_msgs::Range_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ramp_msgs::Range_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ramp_msgs::Range_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ramp_msgs::Range_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ramp_msgs::Range_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ramp_msgs::Range_<ContainerAllocator> >
{
  static const char* value()
  {
    return "32e1c0b6f254bb48e963512143e9aa6f";
  }

  static const char* value(const ::ramp_msgs::Range_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x32e1c0b6f254bb48ULL;
  static const uint64_t static_value2 = 0xe963512143e9aa6fULL;
};

template<class ContainerAllocator>
struct DataType< ::ramp_msgs::Range_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ramp_msgs/Range";
  }

  static const char* value(const ::ramp_msgs::Range_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ramp_msgs::Range_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 min\n"
"float64 max\n"
;
  }

  static const char* value(const ::ramp_msgs::Range_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ramp_msgs::Range_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.min);
      stream.next(m.max);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Range_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ramp_msgs::Range_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ramp_msgs::Range_<ContainerAllocator>& v)
  {
    s << indent << "min: ";
    Printer<double>::stream(s, indent + "  ", v.min);
    s << indent << "max: ";
    Printer<double>::stream(s, indent + "  ", v.max);
  }
};

} // namespace message_operations
} // namespace ros

#endif // RAMP_MSGS_MESSAGE_RANGE_H
