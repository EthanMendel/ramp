set(_CATKIN_CURRENT_PACKAGE "robot_model")
set(robot_model_VERSION "1.12.11")
set(robot_model_MAINTAINER "Chris Lalancette <clalancette@osrfoundation.org>, Shane Loretz <sloretz@osrfoundation.org>")
set(robot_model_PACKAGE_FORMAT "1")
set(robot_model_BUILD_DEPENDS )
set(robot_model_BUILD_EXPORT_DEPENDS "liburdfdom-tools" "collada_parser" "collada_urdf" "kdl_parser" "resource_retriever" "urdf" "urdf_parser_plugin" "joint_state_publisher")
set(robot_model_BUILDTOOL_DEPENDS "catkin")
set(robot_model_BUILDTOOL_EXPORT_DEPENDS )
set(robot_model_EXEC_DEPENDS "liburdfdom-tools" "collada_parser" "collada_urdf" "kdl_parser" "resource_retriever" "urdf" "urdf_parser_plugin" "joint_state_publisher")
set(robot_model_RUN_DEPENDS "liburdfdom-tools" "collada_parser" "collada_urdf" "kdl_parser" "resource_retriever" "urdf" "urdf_parser_plugin" "joint_state_publisher")
set(robot_model_TEST_DEPENDS )
set(robot_model_DOC_DEPENDS )
set(robot_model_URL_WEBSITE "http://ros.org/wiki/robot_model")
set(robot_model_URL_BUGTRACKER "https://github.com/ros/robot_model/issues")
set(robot_model_URL_REPOSITORY "https://github.com/ros/robot_model")
set(robot_model_DEPRECATED "This metapackage will be removed in ROS M. Replace all dependencies on
      &quot;robot_model&quot; in your package.xml with dependencies on collada_parser,
      collada_urdf, joint_state_publisher, kdl_parser, resource-retriever, urdf,
      urdf_parser_plugin, and liburdfdom-tools instead.")