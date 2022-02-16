# Install script for directory: /Users/ethanmendel/Documents/School/Masters/RAMP/ramp/src/ramp_trial/ramp_planner_new

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/Users/ethanmendel/miniforge-pypy3/envs/robostackenv/bin/llvm-objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ramp_planner_new/msg" TYPE FILE FILES
    "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/src/ramp_trial/ramp_planner_new/msg/Coefficient.msg"
    "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/src/ramp_trial/ramp_planner_new/msg/TrajectoryRepresentation.msg"
    "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/src/ramp_trial/ramp_planner_new/msg/TrajectoryRequest.msg"
    "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/src/ramp_trial/ramp_planner_new/msg/TrajectorySwap.msg"
    "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/src/ramp_trial/ramp_planner_new/msg/PathPoints.msg"
    "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/src/ramp_trial/ramp_planner_new/msg/BezifyRequest.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ramp_planner_new/cmake" TYPE FILE FILES "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/build/ramp_trial/ramp_planner_new/catkin_generated/installspace/ramp_planner_new-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/devel/include/ramp_planner_new")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/devel/share/roseus/ros/ramp_planner_new")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/devel/share/common-lisp/ros/ramp_planner_new")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/devel/share/gennodejs/ros/ramp_planner_new")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/Users/ethanmendel/miniforge-pypy3/envs/robostackenv/bin/python3.8" -m compileall "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/devel/lib/python3.8/site-packages/ramp_planner_new")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3.8/site-packages" TYPE DIRECTORY FILES "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/devel/lib/python3.8/site-packages/ramp_planner_new")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/build/ramp_trial/ramp_planner_new/catkin_generated/installspace/ramp_planner_new.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ramp_planner_new/cmake" TYPE FILE FILES "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/build/ramp_trial/ramp_planner_new/catkin_generated/installspace/ramp_planner_new-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ramp_planner_new/cmake" TYPE FILE FILES
    "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/build/ramp_trial/ramp_planner_new/catkin_generated/installspace/ramp_planner_newConfig.cmake"
    "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/build/ramp_trial/ramp_planner_new/catkin_generated/installspace/ramp_planner_newConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ramp_planner_new" TYPE FILE FILES "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/src/ramp_trial/ramp_planner_new/package.xml")
endif()

