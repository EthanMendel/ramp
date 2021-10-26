// Generated by gencpp from file ramp_msgs/HilbertMap.msg
// DO NOT EDIT!


#ifndef RAMP_MSGS_MESSAGE_HILBERTMAP_H
#define RAMP_MSGS_MESSAGE_HILBERTMAP_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <nav_msgs/OccupancyGrid.h>

namespace ramp_msgs
{
template <class ContainerAllocator>
struct HilbertMap_
{
  typedef HilbertMap_<ContainerAllocator> Type;

  HilbertMap_()
    : map()
    , gamma(0.0)  {
    }
  HilbertMap_(const ContainerAllocator& _alloc)
    : map(_alloc)
    , gamma(0.0)  {
  (void)_alloc;
    }



   typedef  ::nav_msgs::OccupancyGrid_<ContainerAllocator>  _map_type;
  _map_type map;

   typedef double _gamma_type;
  _gamma_type gamma;





  typedef boost::shared_ptr< ::ramp_msgs::HilbertMap_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ramp_msgs::HilbertMap_<ContainerAllocator> const> ConstPtr;

}; // struct HilbertMap_

typedef ::ramp_msgs::HilbertMap_<std::allocator<void> > HilbertMap;

typedef boost::shared_ptr< ::ramp_msgs::HilbertMap > HilbertMapPtr;
typedef boost::shared_ptr< ::ramp_msgs::HilbertMap const> HilbertMapConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ramp_msgs::HilbertMap_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ramp_msgs::HilbertMap_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ramp_msgs::HilbertMap_<ContainerAllocator1> & lhs, const ::ramp_msgs::HilbertMap_<ContainerAllocator2> & rhs)
{
  return lhs.map == rhs.map &&
    lhs.gamma == rhs.gamma;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ramp_msgs::HilbertMap_<ContainerAllocator1> & lhs, const ::ramp_msgs::HilbertMap_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ramp_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::ramp_msgs::HilbertMap_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ramp_msgs::HilbertMap_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ramp_msgs::HilbertMap_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ramp_msgs::HilbertMap_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ramp_msgs::HilbertMap_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ramp_msgs::HilbertMap_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ramp_msgs::HilbertMap_<ContainerAllocator> >
{
  static const char* value()
  {
    return "b6a8a2af53f4c3c36388c3b8ae08732f";
  }

  static const char* value(const ::ramp_msgs::HilbertMap_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xb6a8a2af53f4c3c3ULL;
  static const uint64_t static_value2 = 0x6388c3b8ae08732fULL;
};

template<class ContainerAllocator>
struct DataType< ::ramp_msgs::HilbertMap_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ramp_msgs/HilbertMap";
  }

  static const char* value(const ::ramp_msgs::HilbertMap_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ramp_msgs::HilbertMap_<ContainerAllocator> >
{
  static const char* value()
  {
    return "nav_msgs/OccupancyGrid map\n"
"float64 gamma\n"
"\n"
"================================================================================\n"
"MSG: nav_msgs/OccupancyGrid\n"
"# This represents a 2-D grid map, in which each cell represents the probability of\n"
"# occupancy.\n"
"\n"
"Header header \n"
"\n"
"#MetaData for the map\n"
"MapMetaData info\n"
"\n"
"# The map data, in row-major order, starting with (0,0).  Occupancy\n"
"# probabilities are in the range [0,100].  Unknown is -1.\n"
"int8[] data\n"
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
"MSG: nav_msgs/MapMetaData\n"
"# This hold basic information about the characterists of the OccupancyGrid\n"
"\n"
"# The time at which the map was loaded\n"
"time map_load_time\n"
"# The map resolution [m/cell]\n"
"float32 resolution\n"
"# Map width [cells]\n"
"uint32 width\n"
"# Map height [cells]\n"
"uint32 height\n"
"# The origin of the map [m, m, rad].  This is the real-world pose of the\n"
"# cell (0,0) in the map.\n"
"geometry_msgs/Pose origin\n"
"================================================================================\n"
"MSG: geometry_msgs/Pose\n"
"# A representation of pose in free space, composed of position and orientation. \n"
"Point position\n"
"Quaternion orientation\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Point\n"
"# This contains the position of a point in free space\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Quaternion\n"
"# This represents an orientation in free space in quaternion form.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"float64 w\n"
;
  }

  static const char* value(const ::ramp_msgs::HilbertMap_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ramp_msgs::HilbertMap_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.map);
      stream.next(m.gamma);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct HilbertMap_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ramp_msgs::HilbertMap_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ramp_msgs::HilbertMap_<ContainerAllocator>& v)
  {
    s << indent << "map: ";
    s << std::endl;
    Printer< ::nav_msgs::OccupancyGrid_<ContainerAllocator> >::stream(s, indent + "  ", v.map);
    s << indent << "gamma: ";
    Printer<double>::stream(s, indent + "  ", v.gamma);
  }
};

} // namespace message_operations
} // namespace ros

#endif // RAMP_MSGS_MESSAGE_HILBERTMAP_H
