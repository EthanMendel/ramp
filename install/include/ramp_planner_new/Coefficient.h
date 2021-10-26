// Generated by gencpp from file ramp_planner_new/Coefficient.msg
// DO NOT EDIT!


#ifndef RAMP_PLANNER_NEW_MESSAGE_COEFFICIENT_H
#define RAMP_PLANNER_NEW_MESSAGE_COEFFICIENT_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace ramp_planner_new
{
template <class ContainerAllocator>
struct Coefficient_
{
  typedef Coefficient_<ContainerAllocator> Type;

  Coefficient_()
    : values()  {
    }
  Coefficient_(const ContainerAllocator& _alloc)
    : values(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _values_type;
  _values_type values;





  typedef boost::shared_ptr< ::ramp_planner_new::Coefficient_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ramp_planner_new::Coefficient_<ContainerAllocator> const> ConstPtr;

}; // struct Coefficient_

typedef ::ramp_planner_new::Coefficient_<std::allocator<void> > Coefficient;

typedef boost::shared_ptr< ::ramp_planner_new::Coefficient > CoefficientPtr;
typedef boost::shared_ptr< ::ramp_planner_new::Coefficient const> CoefficientConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ramp_planner_new::Coefficient_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ramp_planner_new::Coefficient_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ramp_planner_new::Coefficient_<ContainerAllocator1> & lhs, const ::ramp_planner_new::Coefficient_<ContainerAllocator2> & rhs)
{
  return lhs.values == rhs.values;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ramp_planner_new::Coefficient_<ContainerAllocator1> & lhs, const ::ramp_planner_new::Coefficient_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ramp_planner_new

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::ramp_planner_new::Coefficient_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ramp_planner_new::Coefficient_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ramp_planner_new::Coefficient_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ramp_planner_new::Coefficient_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ramp_planner_new::Coefficient_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ramp_planner_new::Coefficient_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ramp_planner_new::Coefficient_<ContainerAllocator> >
{
  static const char* value()
  {
    return "b9163d7c678dcd669317e43e46b63d96";
  }

  static const char* value(const ::ramp_planner_new::Coefficient_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xb9163d7c678dcd66ULL;
  static const uint64_t static_value2 = 0x9317e43e46b63d96ULL;
};

template<class ContainerAllocator>
struct DataType< ::ramp_planner_new::Coefficient_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ramp_planner_new/Coefficient";
  }

  static const char* value(const ::ramp_planner_new::Coefficient_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ramp_planner_new::Coefficient_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64[] values\n"
;
  }

  static const char* value(const ::ramp_planner_new::Coefficient_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ramp_planner_new::Coefficient_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.values);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Coefficient_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ramp_planner_new::Coefficient_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ramp_planner_new::Coefficient_<ContainerAllocator>& v)
  {
    s << indent << "values[]" << std::endl;
    for (size_t i = 0; i < v.values.size(); ++i)
    {
      s << indent << "  values[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.values[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // RAMP_PLANNER_NEW_MESSAGE_COEFFICIENT_H
