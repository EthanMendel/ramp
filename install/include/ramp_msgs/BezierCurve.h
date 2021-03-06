// Generated by gencpp from file ramp_msgs/BezierCurve.msg
// DO NOT EDIT!


#ifndef RAMP_MSGS_MESSAGE_BEZIERCURVE_H
#define RAMP_MSGS_MESSAGE_BEZIERCURVE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <ramp_msgs/MotionState.h>
#include <ramp_msgs/MotionState.h>
#include <ramp_msgs/MotionState.h>
#include <ramp_msgs/MotionState.h>
#include <ramp_msgs/MotionState.h>
#include <ramp_msgs/MotionState.h>

namespace ramp_msgs
{
template <class ContainerAllocator>
struct BezierCurve_
{
  typedef BezierCurve_<ContainerAllocator> Type;

  BezierCurve_()
    : header()
    , points()
    , u_values()
    , segmentPoints()
    , controlPoints()
    , l(0.0)
    , ms_maxVA()
    , ms_initialVA()
    , ms_begin()
    , u_0(0.0)
    , u_dot_0(0.0)
    , u_dot_max(0.0)
    , u_target(0.0)  {
    }
  BezierCurve_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , points(_alloc)
    , u_values(_alloc)
    , segmentPoints(_alloc)
    , controlPoints(_alloc)
    , l(0.0)
    , ms_maxVA(_alloc)
    , ms_initialVA(_alloc)
    , ms_begin(_alloc)
    , u_0(0.0)
    , u_dot_0(0.0)
    , u_dot_max(0.0)
    , u_target(0.0)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef std::vector< ::ramp_msgs::MotionState_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::ramp_msgs::MotionState_<ContainerAllocator> >::other >  _points_type;
  _points_type points;

   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _u_values_type;
  _u_values_type u_values;

   typedef std::vector< ::ramp_msgs::MotionState_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::ramp_msgs::MotionState_<ContainerAllocator> >::other >  _segmentPoints_type;
  _segmentPoints_type segmentPoints;

   typedef std::vector< ::ramp_msgs::MotionState_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::ramp_msgs::MotionState_<ContainerAllocator> >::other >  _controlPoints_type;
  _controlPoints_type controlPoints;

   typedef double _l_type;
  _l_type l;

   typedef  ::ramp_msgs::MotionState_<ContainerAllocator>  _ms_maxVA_type;
  _ms_maxVA_type ms_maxVA;

   typedef  ::ramp_msgs::MotionState_<ContainerAllocator>  _ms_initialVA_type;
  _ms_initialVA_type ms_initialVA;

   typedef  ::ramp_msgs::MotionState_<ContainerAllocator>  _ms_begin_type;
  _ms_begin_type ms_begin;

   typedef double _u_0_type;
  _u_0_type u_0;

   typedef double _u_dot_0_type;
  _u_dot_0_type u_dot_0;

   typedef double _u_dot_max_type;
  _u_dot_max_type u_dot_max;

   typedef double _u_target_type;
  _u_target_type u_target;





  typedef boost::shared_ptr< ::ramp_msgs::BezierCurve_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ramp_msgs::BezierCurve_<ContainerAllocator> const> ConstPtr;

}; // struct BezierCurve_

typedef ::ramp_msgs::BezierCurve_<std::allocator<void> > BezierCurve;

typedef boost::shared_ptr< ::ramp_msgs::BezierCurve > BezierCurvePtr;
typedef boost::shared_ptr< ::ramp_msgs::BezierCurve const> BezierCurveConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ramp_msgs::BezierCurve_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ramp_msgs::BezierCurve_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ramp_msgs::BezierCurve_<ContainerAllocator1> & lhs, const ::ramp_msgs::BezierCurve_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.points == rhs.points &&
    lhs.u_values == rhs.u_values &&
    lhs.segmentPoints == rhs.segmentPoints &&
    lhs.controlPoints == rhs.controlPoints &&
    lhs.l == rhs.l &&
    lhs.ms_maxVA == rhs.ms_maxVA &&
    lhs.ms_initialVA == rhs.ms_initialVA &&
    lhs.ms_begin == rhs.ms_begin &&
    lhs.u_0 == rhs.u_0 &&
    lhs.u_dot_0 == rhs.u_dot_0 &&
    lhs.u_dot_max == rhs.u_dot_max &&
    lhs.u_target == rhs.u_target;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ramp_msgs::BezierCurve_<ContainerAllocator1> & lhs, const ::ramp_msgs::BezierCurve_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ramp_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::ramp_msgs::BezierCurve_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ramp_msgs::BezierCurve_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ramp_msgs::BezierCurve_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ramp_msgs::BezierCurve_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ramp_msgs::BezierCurve_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ramp_msgs::BezierCurve_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ramp_msgs::BezierCurve_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ce5eeb9cbad0aaaf351cc381d13ee193";
  }

  static const char* value(const ::ramp_msgs::BezierCurve_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xce5eeb9cbad0aaafULL;
  static const uint64_t static_value2 = 0x351cc381d13ee193ULL;
};

template<class ContainerAllocator>
struct DataType< ::ramp_msgs::BezierCurve_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ramp_msgs/BezierCurve";
  }

  static const char* value(const ::ramp_msgs::BezierCurve_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ramp_msgs::BezierCurve_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n"
"\n"
"ramp_msgs/MotionState[] points\n"
"float64[] u_values\n"
"\n"
"ramp_msgs/MotionState[] segmentPoints\n"
"ramp_msgs/MotionState[] controlPoints\n"
"\n"
"float64 l\n"
"ramp_msgs/MotionState ms_maxVA\n"
"ramp_msgs/MotionState ms_initialVA\n"
"ramp_msgs/MotionState ms_begin\n"
"float64 u_0\n"
"float64 u_dot_0\n"
"float64 u_dot_max\n"
"float64 u_target\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
"\n"
"================================================================================\n"
"MSG: ramp_msgs/MotionState\n"
"float64[] positions\n"
"float64[] velocities\n"
"float64[] accelerations\n"
"float64[] jerks\n"
"\n"
"# change to duration\n"
"float64 time\n"
;
  }

  static const char* value(const ::ramp_msgs::BezierCurve_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ramp_msgs::BezierCurve_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.points);
      stream.next(m.u_values);
      stream.next(m.segmentPoints);
      stream.next(m.controlPoints);
      stream.next(m.l);
      stream.next(m.ms_maxVA);
      stream.next(m.ms_initialVA);
      stream.next(m.ms_begin);
      stream.next(m.u_0);
      stream.next(m.u_dot_0);
      stream.next(m.u_dot_max);
      stream.next(m.u_target);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct BezierCurve_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ramp_msgs::BezierCurve_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ramp_msgs::BezierCurve_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "points[]" << std::endl;
    for (size_t i = 0; i < v.points.size(); ++i)
    {
      s << indent << "  points[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::ramp_msgs::MotionState_<ContainerAllocator> >::stream(s, indent + "    ", v.points[i]);
    }
    s << indent << "u_values[]" << std::endl;
    for (size_t i = 0; i < v.u_values.size(); ++i)
    {
      s << indent << "  u_values[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.u_values[i]);
    }
    s << indent << "segmentPoints[]" << std::endl;
    for (size_t i = 0; i < v.segmentPoints.size(); ++i)
    {
      s << indent << "  segmentPoints[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::ramp_msgs::MotionState_<ContainerAllocator> >::stream(s, indent + "    ", v.segmentPoints[i]);
    }
    s << indent << "controlPoints[]" << std::endl;
    for (size_t i = 0; i < v.controlPoints.size(); ++i)
    {
      s << indent << "  controlPoints[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::ramp_msgs::MotionState_<ContainerAllocator> >::stream(s, indent + "    ", v.controlPoints[i]);
    }
    s << indent << "l: ";
    Printer<double>::stream(s, indent + "  ", v.l);
    s << indent << "ms_maxVA: ";
    s << std::endl;
    Printer< ::ramp_msgs::MotionState_<ContainerAllocator> >::stream(s, indent + "  ", v.ms_maxVA);
    s << indent << "ms_initialVA: ";
    s << std::endl;
    Printer< ::ramp_msgs::MotionState_<ContainerAllocator> >::stream(s, indent + "  ", v.ms_initialVA);
    s << indent << "ms_begin: ";
    s << std::endl;
    Printer< ::ramp_msgs::MotionState_<ContainerAllocator> >::stream(s, indent + "  ", v.ms_begin);
    s << indent << "u_0: ";
    Printer<double>::stream(s, indent + "  ", v.u_0);
    s << indent << "u_dot_0: ";
    Printer<double>::stream(s, indent + "  ", v.u_dot_0);
    s << indent << "u_dot_max: ";
    Printer<double>::stream(s, indent + "  ", v.u_dot_max);
    s << indent << "u_target: ";
    Printer<double>::stream(s, indent + "  ", v.u_target);
  }
};

} // namespace message_operations
} // namespace ros

#endif // RAMP_MSGS_MESSAGE_BEZIERCURVE_H
