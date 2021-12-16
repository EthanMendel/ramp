# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "ramp_planner_new: 5 messages, 0 services")

set(MSG_I_FLAGS "-Iramp_planner_new:/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Iramp_msgs:/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_msgs/msg;-Ivisualization_msgs:/opt/ros/noetic/share/visualization_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Inav_msgs:/opt/ros/noetic/share/nav_msgs/cmake/../msg;-Itrajectory_msgs:/opt/ros/noetic/share/trajectory_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/noetic/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(ramp_planner_new_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/Coefficient.msg" NAME_WE)
add_custom_target(_ramp_planner_new_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ramp_planner_new" "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/Coefficient.msg" ""
)

get_filename_component(_filename "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/TrajectoryRepresentation.msg" NAME_WE)
add_custom_target(_ramp_planner_new_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ramp_planner_new" "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/TrajectoryRepresentation.msg" "ramp_planner_new/Coefficient"
)

get_filename_component(_filename "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/TrajectoryRequest.msg" NAME_WE)
add_custom_target(_ramp_planner_new_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ramp_planner_new" "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/TrajectoryRequest.msg" "geometry_msgs/Point"
)

get_filename_component(_filename "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/PathPoints.msg" NAME_WE)
add_custom_target(_ramp_planner_new_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ramp_planner_new" "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/PathPoints.msg" "visualization_msgs/Marker:geometry_msgs/Vector3:std_msgs/ColorRGBA:geometry_msgs/Pose:geometry_msgs/Point:std_msgs/Header:geometry_msgs/Quaternion"
)

get_filename_component(_filename "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/BezifyRequest.msg" NAME_WE)
add_custom_target(_ramp_planner_new_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ramp_planner_new" "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/BezifyRequest.msg" "visualization_msgs/Marker:ramp_planner_new/PathPoints:geometry_msgs/Vector3:std_msgs/ColorRGBA:geometry_msgs/Pose:geometry_msgs/Point:std_msgs/Header:geometry_msgs/Quaternion"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(ramp_planner_new
  "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/Coefficient.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ramp_planner_new
)
_generate_msg_cpp(ramp_planner_new
  "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/TrajectoryRepresentation.msg"
  "${MSG_I_FLAGS}"
  "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/Coefficient.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ramp_planner_new
)
_generate_msg_cpp(ramp_planner_new
  "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/TrajectoryRequest.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ramp_planner_new
)
_generate_msg_cpp(ramp_planner_new
  "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/PathPoints.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/visualization_msgs/cmake/../msg/Marker.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/ColorRGBA.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ramp_planner_new
)
_generate_msg_cpp(ramp_planner_new
  "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/BezifyRequest.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/visualization_msgs/cmake/../msg/Marker.msg;/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/PathPoints.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/ColorRGBA.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ramp_planner_new
)

### Generating Services

### Generating Module File
_generate_module_cpp(ramp_planner_new
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ramp_planner_new
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(ramp_planner_new_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(ramp_planner_new_generate_messages ramp_planner_new_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/Coefficient.msg" NAME_WE)
add_dependencies(ramp_planner_new_generate_messages_cpp _ramp_planner_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/TrajectoryRepresentation.msg" NAME_WE)
add_dependencies(ramp_planner_new_generate_messages_cpp _ramp_planner_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/TrajectoryRequest.msg" NAME_WE)
add_dependencies(ramp_planner_new_generate_messages_cpp _ramp_planner_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/PathPoints.msg" NAME_WE)
add_dependencies(ramp_planner_new_generate_messages_cpp _ramp_planner_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/BezifyRequest.msg" NAME_WE)
add_dependencies(ramp_planner_new_generate_messages_cpp _ramp_planner_new_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ramp_planner_new_gencpp)
add_dependencies(ramp_planner_new_gencpp ramp_planner_new_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ramp_planner_new_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(ramp_planner_new
  "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/Coefficient.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ramp_planner_new
)
_generate_msg_eus(ramp_planner_new
  "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/TrajectoryRepresentation.msg"
  "${MSG_I_FLAGS}"
  "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/Coefficient.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ramp_planner_new
)
_generate_msg_eus(ramp_planner_new
  "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/TrajectoryRequest.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ramp_planner_new
)
_generate_msg_eus(ramp_planner_new
  "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/PathPoints.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/visualization_msgs/cmake/../msg/Marker.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/ColorRGBA.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ramp_planner_new
)
_generate_msg_eus(ramp_planner_new
  "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/BezifyRequest.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/visualization_msgs/cmake/../msg/Marker.msg;/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/PathPoints.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/ColorRGBA.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ramp_planner_new
)

### Generating Services

### Generating Module File
_generate_module_eus(ramp_planner_new
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ramp_planner_new
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(ramp_planner_new_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(ramp_planner_new_generate_messages ramp_planner_new_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/Coefficient.msg" NAME_WE)
add_dependencies(ramp_planner_new_generate_messages_eus _ramp_planner_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/TrajectoryRepresentation.msg" NAME_WE)
add_dependencies(ramp_planner_new_generate_messages_eus _ramp_planner_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/TrajectoryRequest.msg" NAME_WE)
add_dependencies(ramp_planner_new_generate_messages_eus _ramp_planner_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/PathPoints.msg" NAME_WE)
add_dependencies(ramp_planner_new_generate_messages_eus _ramp_planner_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/BezifyRequest.msg" NAME_WE)
add_dependencies(ramp_planner_new_generate_messages_eus _ramp_planner_new_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ramp_planner_new_geneus)
add_dependencies(ramp_planner_new_geneus ramp_planner_new_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ramp_planner_new_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(ramp_planner_new
  "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/Coefficient.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ramp_planner_new
)
_generate_msg_lisp(ramp_planner_new
  "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/TrajectoryRepresentation.msg"
  "${MSG_I_FLAGS}"
  "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/Coefficient.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ramp_planner_new
)
_generate_msg_lisp(ramp_planner_new
  "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/TrajectoryRequest.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ramp_planner_new
)
_generate_msg_lisp(ramp_planner_new
  "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/PathPoints.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/visualization_msgs/cmake/../msg/Marker.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/ColorRGBA.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ramp_planner_new
)
_generate_msg_lisp(ramp_planner_new
  "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/BezifyRequest.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/visualization_msgs/cmake/../msg/Marker.msg;/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/PathPoints.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/ColorRGBA.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ramp_planner_new
)

### Generating Services

### Generating Module File
_generate_module_lisp(ramp_planner_new
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ramp_planner_new
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(ramp_planner_new_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(ramp_planner_new_generate_messages ramp_planner_new_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/Coefficient.msg" NAME_WE)
add_dependencies(ramp_planner_new_generate_messages_lisp _ramp_planner_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/TrajectoryRepresentation.msg" NAME_WE)
add_dependencies(ramp_planner_new_generate_messages_lisp _ramp_planner_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/TrajectoryRequest.msg" NAME_WE)
add_dependencies(ramp_planner_new_generate_messages_lisp _ramp_planner_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/PathPoints.msg" NAME_WE)
add_dependencies(ramp_planner_new_generate_messages_lisp _ramp_planner_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/BezifyRequest.msg" NAME_WE)
add_dependencies(ramp_planner_new_generate_messages_lisp _ramp_planner_new_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ramp_planner_new_genlisp)
add_dependencies(ramp_planner_new_genlisp ramp_planner_new_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ramp_planner_new_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(ramp_planner_new
  "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/Coefficient.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ramp_planner_new
)
_generate_msg_nodejs(ramp_planner_new
  "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/TrajectoryRepresentation.msg"
  "${MSG_I_FLAGS}"
  "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/Coefficient.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ramp_planner_new
)
_generate_msg_nodejs(ramp_planner_new
  "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/TrajectoryRequest.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ramp_planner_new
)
_generate_msg_nodejs(ramp_planner_new
  "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/PathPoints.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/visualization_msgs/cmake/../msg/Marker.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/ColorRGBA.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ramp_planner_new
)
_generate_msg_nodejs(ramp_planner_new
  "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/BezifyRequest.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/visualization_msgs/cmake/../msg/Marker.msg;/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/PathPoints.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/ColorRGBA.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ramp_planner_new
)

### Generating Services

### Generating Module File
_generate_module_nodejs(ramp_planner_new
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ramp_planner_new
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(ramp_planner_new_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(ramp_planner_new_generate_messages ramp_planner_new_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/Coefficient.msg" NAME_WE)
add_dependencies(ramp_planner_new_generate_messages_nodejs _ramp_planner_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/TrajectoryRepresentation.msg" NAME_WE)
add_dependencies(ramp_planner_new_generate_messages_nodejs _ramp_planner_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/TrajectoryRequest.msg" NAME_WE)
add_dependencies(ramp_planner_new_generate_messages_nodejs _ramp_planner_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/PathPoints.msg" NAME_WE)
add_dependencies(ramp_planner_new_generate_messages_nodejs _ramp_planner_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/BezifyRequest.msg" NAME_WE)
add_dependencies(ramp_planner_new_generate_messages_nodejs _ramp_planner_new_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ramp_planner_new_gennodejs)
add_dependencies(ramp_planner_new_gennodejs ramp_planner_new_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ramp_planner_new_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(ramp_planner_new
  "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/Coefficient.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ramp_planner_new
)
_generate_msg_py(ramp_planner_new
  "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/TrajectoryRepresentation.msg"
  "${MSG_I_FLAGS}"
  "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/Coefficient.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ramp_planner_new
)
_generate_msg_py(ramp_planner_new
  "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/TrajectoryRequest.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ramp_planner_new
)
_generate_msg_py(ramp_planner_new
  "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/PathPoints.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/visualization_msgs/cmake/../msg/Marker.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/ColorRGBA.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ramp_planner_new
)
_generate_msg_py(ramp_planner_new
  "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/BezifyRequest.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/visualization_msgs/cmake/../msg/Marker.msg;/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/PathPoints.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/ColorRGBA.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ramp_planner_new
)

### Generating Services

### Generating Module File
_generate_module_py(ramp_planner_new
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ramp_planner_new
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(ramp_planner_new_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(ramp_planner_new_generate_messages ramp_planner_new_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/Coefficient.msg" NAME_WE)
add_dependencies(ramp_planner_new_generate_messages_py _ramp_planner_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/TrajectoryRepresentation.msg" NAME_WE)
add_dependencies(ramp_planner_new_generate_messages_py _ramp_planner_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/TrajectoryRequest.msg" NAME_WE)
add_dependencies(ramp_planner_new_generate_messages_py _ramp_planner_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/PathPoints.msg" NAME_WE)
add_dependencies(ramp_planner_new_generate_messages_py _ramp_planner_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_planner_new/msg/BezifyRequest.msg" NAME_WE)
add_dependencies(ramp_planner_new_generate_messages_py _ramp_planner_new_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ramp_planner_new_genpy)
add_dependencies(ramp_planner_new_genpy ramp_planner_new_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ramp_planner_new_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ramp_planner_new)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ramp_planner_new
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(ramp_planner_new_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET ramp_msgs_generate_messages_cpp)
  add_dependencies(ramp_planner_new_generate_messages_cpp ramp_msgs_generate_messages_cpp)
endif()
if(TARGET visualization_msgs_generate_messages_cpp)
  add_dependencies(ramp_planner_new_generate_messages_cpp visualization_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ramp_planner_new)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ramp_planner_new
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(ramp_planner_new_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET ramp_msgs_generate_messages_eus)
  add_dependencies(ramp_planner_new_generate_messages_eus ramp_msgs_generate_messages_eus)
endif()
if(TARGET visualization_msgs_generate_messages_eus)
  add_dependencies(ramp_planner_new_generate_messages_eus visualization_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ramp_planner_new)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ramp_planner_new
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(ramp_planner_new_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET ramp_msgs_generate_messages_lisp)
  add_dependencies(ramp_planner_new_generate_messages_lisp ramp_msgs_generate_messages_lisp)
endif()
if(TARGET visualization_msgs_generate_messages_lisp)
  add_dependencies(ramp_planner_new_generate_messages_lisp visualization_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ramp_planner_new)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ramp_planner_new
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(ramp_planner_new_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET ramp_msgs_generate_messages_nodejs)
  add_dependencies(ramp_planner_new_generate_messages_nodejs ramp_msgs_generate_messages_nodejs)
endif()
if(TARGET visualization_msgs_generate_messages_nodejs)
  add_dependencies(ramp_planner_new_generate_messages_nodejs visualization_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ramp_planner_new)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3.8\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ramp_planner_new\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ramp_planner_new
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(ramp_planner_new_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET ramp_msgs_generate_messages_py)
  add_dependencies(ramp_planner_new_generate_messages_py ramp_msgs_generate_messages_py)
endif()
if(TARGET visualization_msgs_generate_messages_py)
  add_dependencies(ramp_planner_new_generate_messages_py visualization_msgs_generate_messages_py)
endif()
