// Generated by gencpp from file ramp_planner_new/TrajectoryRequest.msg
// DO NOT EDIT!


#ifndef RAMP_PLANNER_NEW_MESSAGE_TRAJECTORYREQUEST_H
#define RAMP_PLANNER_NEW_MESSAGE_TRAJECTORYREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <geometry_msgs/Point.h>

namespace ramp_planner_new
{
template <class ContainerAllocator>
struct TrajectoryRequest_
{
  typedef TrajectoryRequest_<ContainerAllocator> Type;

  TrajectoryRequest_()
    : type()
    , points()
    , normVals()  {
    }
  TrajectoryRequest_(const ContainerAllocator& _alloc)
    : type(_alloc)
    , points(_alloc)
    , normVals(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _type_type;
  _type_type type;

   typedef std::vector< ::geometry_msgs::Point_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::geometry_msgs::Point_<ContainerAllocator> >::other >  _points_type;
  _points_type points;

   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _normVals_type;
  _normVals_type normVals;





  typedef boost::shared_ptr< ::ramp_planner_new::TrajectoryRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ramp_planner_new::TrajectoryRequest_<ContainerAllocator> const> ConstPtr;

}; // struct TrajectoryRequest_

typedef ::ramp_planner_new::TrajectoryRequest_<std::allocator<void> > TrajectoryRequest;

typedef boost::shared_ptr< ::ramp_planner_new::TrajectoryRequest > TrajectoryRequestPtr;
typedef boost::shared_ptr< ::ramp_planner_new::TrajectoryRequest const> TrajectoryRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ramp_planner_new::TrajectoryRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ramp_planner_new::TrajectoryRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ramp_planner_new::TrajectoryRequest_<ContainerAllocator1> & lhs, const ::ramp_planner_new::TrajectoryRequest_<ContainerAllocator2> & rhs)
{
  return lhs.type == rhs.type &&
    lhs.points == rhs.points &&
    lhs.normVals == rhs.normVals;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ramp_planner_new::TrajectoryRequest_<ContainerAllocator1> & lhs, const ::ramp_planner_new::TrajectoryRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ramp_planner_new

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::ramp_planner_new::TrajectoryRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ramp_planner_new::TrajectoryRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ramp_planner_new::TrajectoryRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ramp_planner_new::TrajectoryRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ramp_planner_new::TrajectoryRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ramp_planner_new::TrajectoryRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ramp_planner_new::TrajectoryRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "5c125c00eccba1e258c36f6c4bcd110e";
  }

  static const char* value(const ::ramp_planner_new::TrajectoryRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x5c125c00eccba1e2ULL;
  static const uint64_t static_value2 = 0x58c36f6c4bcd110eULL;
};

template<class ContainerAllocator>
struct DataType< ::ramp_planner_new::TrajectoryRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ramp_planner_new/TrajectoryRequest";
  }

  static const char* value(const ::ramp_planner_new::TrajectoryRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ramp_planner_new::TrajectoryRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string type\n"
"geometry_msgs/Point[] points\n"
"float64[] normVals\n"
"================================================================================\n"
"MSG: geometry_msgs/Point\n"
"# This contains the position of a point in free space\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
;
  }

  static const char* value(const ::ramp_planner_new::TrajectoryRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ramp_planner_new::TrajectoryRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.type);
      stream.next(m.points);
      stream.next(m.normVals);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct TrajectoryRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ramp_planner_new::TrajectoryRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ramp_planner_new::TrajectoryRequest_<ContainerAllocator>& v)
  {
    s << indent << "type: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.type);
    s << indent << "points[]" << std::endl;
    for (size_t i = 0; i < v.points.size(); ++i)
    {
      s << indent << "  points[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::geometry_msgs::Point_<ContainerAllocator> >::stream(s, indent + "    ", v.points[i]);
    }
    s << indent << "normVals[]" << std::endl;
    for (size_t i = 0; i < v.normVals.size(); ++i)
    {
      s << indent << "  normVals[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.normVals[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // RAMP_PLANNER_NEW_MESSAGE_TRAJECTORYREQUEST_H
