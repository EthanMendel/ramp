// Generated by gencpp from file yocs_msgs/DockingInteractorActionGoal.msg
// DO NOT EDIT!


#ifndef YOCS_MSGS_MESSAGE_DOCKINGINTERACTORACTIONGOAL_H
#define YOCS_MSGS_MESSAGE_DOCKINGINTERACTORACTIONGOAL_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <actionlib_msgs/GoalID.h>
#include <yocs_msgs/DockingInteractorGoal.h>

namespace yocs_msgs
{
template <class ContainerAllocator>
struct DockingInteractorActionGoal_
{
  typedef DockingInteractorActionGoal_<ContainerAllocator> Type;

  DockingInteractorActionGoal_()
    : header()
    , goal_id()
    , goal()  {
    }
  DockingInteractorActionGoal_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , goal_id(_alloc)
    , goal(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef  ::actionlib_msgs::GoalID_<ContainerAllocator>  _goal_id_type;
  _goal_id_type goal_id;

   typedef  ::yocs_msgs::DockingInteractorGoal_<ContainerAllocator>  _goal_type;
  _goal_type goal;





  typedef boost::shared_ptr< ::yocs_msgs::DockingInteractorActionGoal_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::yocs_msgs::DockingInteractorActionGoal_<ContainerAllocator> const> ConstPtr;

}; // struct DockingInteractorActionGoal_

typedef ::yocs_msgs::DockingInteractorActionGoal_<std::allocator<void> > DockingInteractorActionGoal;

typedef boost::shared_ptr< ::yocs_msgs::DockingInteractorActionGoal > DockingInteractorActionGoalPtr;
typedef boost::shared_ptr< ::yocs_msgs::DockingInteractorActionGoal const> DockingInteractorActionGoalConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::yocs_msgs::DockingInteractorActionGoal_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::yocs_msgs::DockingInteractorActionGoal_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::yocs_msgs::DockingInteractorActionGoal_<ContainerAllocator1> & lhs, const ::yocs_msgs::DockingInteractorActionGoal_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.goal_id == rhs.goal_id &&
    lhs.goal == rhs.goal;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::yocs_msgs::DockingInteractorActionGoal_<ContainerAllocator1> & lhs, const ::yocs_msgs::DockingInteractorActionGoal_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace yocs_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::yocs_msgs::DockingInteractorActionGoal_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::yocs_msgs::DockingInteractorActionGoal_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::yocs_msgs::DockingInteractorActionGoal_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::yocs_msgs::DockingInteractorActionGoal_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::yocs_msgs::DockingInteractorActionGoal_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::yocs_msgs::DockingInteractorActionGoal_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::yocs_msgs::DockingInteractorActionGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "c5820befe28db119fe6fe4a6c9e700c9";
  }

  static const char* value(const ::yocs_msgs::DockingInteractorActionGoal_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xc5820befe28db119ULL;
  static const uint64_t static_value2 = 0xfe6fe4a6c9e700c9ULL;
};

template<class ContainerAllocator>
struct DataType< ::yocs_msgs::DockingInteractorActionGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "yocs_msgs/DockingInteractorActionGoal";
  }

  static const char* value(const ::yocs_msgs::DockingInteractorActionGoal_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::yocs_msgs::DockingInteractorActionGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"\n"
"Header header\n"
"actionlib_msgs/GoalID goal_id\n"
"DockingInteractorGoal goal\n"
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
"MSG: actionlib_msgs/GoalID\n"
"# The stamp should store the time at which this goal was requested.\n"
"# It is used by an action server when it tries to preempt all\n"
"# goals that were requested before a certain time\n"
"time stamp\n"
"\n"
"# The id provides a way to associate feedback and\n"
"# result message with specific goal requests. The id\n"
"# specified must be unique.\n"
"string id\n"
"\n"
"\n"
"================================================================================\n"
"MSG: yocs_msgs/DockingInteractorGoal\n"
"# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"# Request\n"
"int8 command\n"
"float32 distance\n"
"\n"
"int8 WAKE_UP= 10\n"
"int8 REGISTER_DOCK_IN_GLOBAL_FRAME = 20\n"
"int8 RETURN_TO_DOCK = 30\n"
"int8 GOTO_DOCK_FRONT = 40\n"
"int8 CALL_AUTODOCK = 50\n"
;
  }

  static const char* value(const ::yocs_msgs::DockingInteractorActionGoal_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::yocs_msgs::DockingInteractorActionGoal_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.goal_id);
      stream.next(m.goal);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct DockingInteractorActionGoal_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::yocs_msgs::DockingInteractorActionGoal_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::yocs_msgs::DockingInteractorActionGoal_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "goal_id: ";
    s << std::endl;
    Printer< ::actionlib_msgs::GoalID_<ContainerAllocator> >::stream(s, indent + "  ", v.goal_id);
    s << indent << "goal: ";
    s << std::endl;
    Printer< ::yocs_msgs::DockingInteractorGoal_<ContainerAllocator> >::stream(s, indent + "  ", v.goal);
  }
};

} // namespace message_operations
} // namespace ros

#endif // YOCS_MSGS_MESSAGE_DOCKINGINTERACTORACTIONGOAL_H
