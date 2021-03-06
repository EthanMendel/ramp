// Generated by gencpp from file ramp_msgs/TrajectorySrvResponse.msg
// DO NOT EDIT!


#ifndef RAMP_MSGS_MESSAGE_TRAJECTORYSRVRESPONSE_H
#define RAMP_MSGS_MESSAGE_TRAJECTORYSRVRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <ramp_msgs/TrajectoryResponse.h>

namespace ramp_msgs
{
template <class ContainerAllocator>
struct TrajectorySrvResponse_
{
  typedef TrajectorySrvResponse_<ContainerAllocator> Type;

  TrajectorySrvResponse_()
    : resps()  {
    }
  TrajectorySrvResponse_(const ContainerAllocator& _alloc)
    : resps(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector< ::ramp_msgs::TrajectoryResponse_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::ramp_msgs::TrajectoryResponse_<ContainerAllocator> >::other >  _resps_type;
  _resps_type resps;





  typedef boost::shared_ptr< ::ramp_msgs::TrajectorySrvResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ramp_msgs::TrajectorySrvResponse_<ContainerAllocator> const> ConstPtr;

}; // struct TrajectorySrvResponse_

typedef ::ramp_msgs::TrajectorySrvResponse_<std::allocator<void> > TrajectorySrvResponse;

typedef boost::shared_ptr< ::ramp_msgs::TrajectorySrvResponse > TrajectorySrvResponsePtr;
typedef boost::shared_ptr< ::ramp_msgs::TrajectorySrvResponse const> TrajectorySrvResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ramp_msgs::TrajectorySrvResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ramp_msgs::TrajectorySrvResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ramp_msgs::TrajectorySrvResponse_<ContainerAllocator1> & lhs, const ::ramp_msgs::TrajectorySrvResponse_<ContainerAllocator2> & rhs)
{
  return lhs.resps == rhs.resps;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ramp_msgs::TrajectorySrvResponse_<ContainerAllocator1> & lhs, const ::ramp_msgs::TrajectorySrvResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ramp_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::ramp_msgs::TrajectorySrvResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ramp_msgs::TrajectorySrvResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ramp_msgs::TrajectorySrvResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ramp_msgs::TrajectorySrvResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ramp_msgs::TrajectorySrvResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ramp_msgs::TrajectorySrvResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ramp_msgs::TrajectorySrvResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "7c551a792aa4472a1be4db823364d34a";
  }

  static const char* value(const ::ramp_msgs::TrajectorySrvResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x7c551a792aa4472aULL;
  static const uint64_t static_value2 = 0x1be4db823364d34aULL;
};

template<class ContainerAllocator>
struct DataType< ::ramp_msgs::TrajectorySrvResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ramp_msgs/TrajectorySrvResponse";
  }

  static const char* value(const ::ramp_msgs::TrajectorySrvResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ramp_msgs::TrajectorySrvResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n"
"TrajectoryResponse[] resps\n"
"\n"
"\n"
"================================================================================\n"
"MSG: ramp_msgs/TrajectoryResponse\n"
"RampTrajectory trajectory\n"
"bool error\n"
"\n"
"================================================================================\n"
"MSG: ramp_msgs/RampTrajectory\n"
"Header header\n"
"uint16 id\n"
"trajectory_msgs/JointTrajectory trajectory\n"
"uint16[] i_knotPoints\n"
"ramp_msgs/BezierCurve[] curves\n"
"ramp_msgs/Path holonomic_path\n"
"\n"
"bool feasible\n"
"float64 fitness\n"
"\n"
"duration t_firstCollision\n"
"int8 i_subPopulation\n"
"\n"
"duration t_start\n"
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
"MSG: trajectory_msgs/JointTrajectory\n"
"Header header\n"
"string[] joint_names\n"
"JointTrajectoryPoint[] points\n"
"\n"
"================================================================================\n"
"MSG: trajectory_msgs/JointTrajectoryPoint\n"
"# Each trajectory point specifies either positions[, velocities[, accelerations]]\n"
"# or positions[, effort] for the trajectory to be executed.\n"
"# All specified values are in the same order as the joint names in JointTrajectory.msg\n"
"\n"
"float64[] positions\n"
"float64[] velocities\n"
"float64[] accelerations\n"
"float64[] effort\n"
"duration time_from_start\n"
"\n"
"================================================================================\n"
"MSG: ramp_msgs/BezierCurve\n"
"Header header\n"
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
"MSG: ramp_msgs/MotionState\n"
"float64[] positions\n"
"float64[] velocities\n"
"float64[] accelerations\n"
"float64[] jerks\n"
"\n"
"# change to duration\n"
"float64 time\n"
"\n"
"================================================================================\n"
"MSG: ramp_msgs/Path\n"
"ramp_msgs/KnotPoint[] points\n"
"\n"
"================================================================================\n"
"MSG: ramp_msgs/KnotPoint\n"
"ramp_msgs/MotionState motionState\n"
"uint32 stopTime\n"
;
  }

  static const char* value(const ::ramp_msgs::TrajectorySrvResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ramp_msgs::TrajectorySrvResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.resps);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct TrajectorySrvResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ramp_msgs::TrajectorySrvResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ramp_msgs::TrajectorySrvResponse_<ContainerAllocator>& v)
  {
    s << indent << "resps[]" << std::endl;
    for (size_t i = 0; i < v.resps.size(); ++i)
    {
      s << indent << "  resps[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::ramp_msgs::TrajectoryResponse_<ContainerAllocator> >::stream(s, indent + "    ", v.resps[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // RAMP_MSGS_MESSAGE_TRAJECTORYSRVRESPONSE_H
