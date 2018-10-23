# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "vn300: 4 messages, 0 services")

set(MSG_I_FLAGS "-Ivn300:/home/geo/autocone/src/vn300/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(vn300_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/geo/autocone/src/vn300/msg/gps.msg" NAME_WE)
add_custom_target(_vn300_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "vn300" "/home/geo/autocone/src/vn300/msg/gps.msg" "vn300/utc_time:std_msgs/Header:geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/geo/autocone/src/vn300/msg/sensors.msg" NAME_WE)
add_custom_target(_vn300_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "vn300" "/home/geo/autocone/src/vn300/msg/sensors.msg" "std_msgs/Header:geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/geo/autocone/src/vn300/msg/ins.msg" NAME_WE)
add_custom_target(_vn300_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "vn300" "/home/geo/autocone/src/vn300/msg/ins.msg" "std_msgs/Header:geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/geo/autocone/src/vn300/msg/utc_time.msg" NAME_WE)
add_custom_target(_vn300_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "vn300" "/home/geo/autocone/src/vn300/msg/utc_time.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(vn300
  "/home/geo/autocone/src/vn300/msg/gps.msg"
  "${MSG_I_FLAGS}"
  "/home/geo/autocone/src/vn300/msg/utc_time.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vn300
)
_generate_msg_cpp(vn300
  "/home/geo/autocone/src/vn300/msg/sensors.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vn300
)
_generate_msg_cpp(vn300
  "/home/geo/autocone/src/vn300/msg/ins.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vn300
)
_generate_msg_cpp(vn300
  "/home/geo/autocone/src/vn300/msg/utc_time.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vn300
)

### Generating Services

### Generating Module File
_generate_module_cpp(vn300
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vn300
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(vn300_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(vn300_generate_messages vn300_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/geo/autocone/src/vn300/msg/gps.msg" NAME_WE)
add_dependencies(vn300_generate_messages_cpp _vn300_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/geo/autocone/src/vn300/msg/sensors.msg" NAME_WE)
add_dependencies(vn300_generate_messages_cpp _vn300_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/geo/autocone/src/vn300/msg/ins.msg" NAME_WE)
add_dependencies(vn300_generate_messages_cpp _vn300_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/geo/autocone/src/vn300/msg/utc_time.msg" NAME_WE)
add_dependencies(vn300_generate_messages_cpp _vn300_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(vn300_gencpp)
add_dependencies(vn300_gencpp vn300_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS vn300_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(vn300
  "/home/geo/autocone/src/vn300/msg/gps.msg"
  "${MSG_I_FLAGS}"
  "/home/geo/autocone/src/vn300/msg/utc_time.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vn300
)
_generate_msg_eus(vn300
  "/home/geo/autocone/src/vn300/msg/sensors.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vn300
)
_generate_msg_eus(vn300
  "/home/geo/autocone/src/vn300/msg/ins.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vn300
)
_generate_msg_eus(vn300
  "/home/geo/autocone/src/vn300/msg/utc_time.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vn300
)

### Generating Services

### Generating Module File
_generate_module_eus(vn300
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vn300
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(vn300_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(vn300_generate_messages vn300_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/geo/autocone/src/vn300/msg/gps.msg" NAME_WE)
add_dependencies(vn300_generate_messages_eus _vn300_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/geo/autocone/src/vn300/msg/sensors.msg" NAME_WE)
add_dependencies(vn300_generate_messages_eus _vn300_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/geo/autocone/src/vn300/msg/ins.msg" NAME_WE)
add_dependencies(vn300_generate_messages_eus _vn300_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/geo/autocone/src/vn300/msg/utc_time.msg" NAME_WE)
add_dependencies(vn300_generate_messages_eus _vn300_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(vn300_geneus)
add_dependencies(vn300_geneus vn300_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS vn300_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(vn300
  "/home/geo/autocone/src/vn300/msg/gps.msg"
  "${MSG_I_FLAGS}"
  "/home/geo/autocone/src/vn300/msg/utc_time.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vn300
)
_generate_msg_lisp(vn300
  "/home/geo/autocone/src/vn300/msg/sensors.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vn300
)
_generate_msg_lisp(vn300
  "/home/geo/autocone/src/vn300/msg/ins.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vn300
)
_generate_msg_lisp(vn300
  "/home/geo/autocone/src/vn300/msg/utc_time.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vn300
)

### Generating Services

### Generating Module File
_generate_module_lisp(vn300
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vn300
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(vn300_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(vn300_generate_messages vn300_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/geo/autocone/src/vn300/msg/gps.msg" NAME_WE)
add_dependencies(vn300_generate_messages_lisp _vn300_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/geo/autocone/src/vn300/msg/sensors.msg" NAME_WE)
add_dependencies(vn300_generate_messages_lisp _vn300_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/geo/autocone/src/vn300/msg/ins.msg" NAME_WE)
add_dependencies(vn300_generate_messages_lisp _vn300_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/geo/autocone/src/vn300/msg/utc_time.msg" NAME_WE)
add_dependencies(vn300_generate_messages_lisp _vn300_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(vn300_genlisp)
add_dependencies(vn300_genlisp vn300_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS vn300_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(vn300
  "/home/geo/autocone/src/vn300/msg/gps.msg"
  "${MSG_I_FLAGS}"
  "/home/geo/autocone/src/vn300/msg/utc_time.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vn300
)
_generate_msg_nodejs(vn300
  "/home/geo/autocone/src/vn300/msg/sensors.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vn300
)
_generate_msg_nodejs(vn300
  "/home/geo/autocone/src/vn300/msg/ins.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vn300
)
_generate_msg_nodejs(vn300
  "/home/geo/autocone/src/vn300/msg/utc_time.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vn300
)

### Generating Services

### Generating Module File
_generate_module_nodejs(vn300
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vn300
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(vn300_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(vn300_generate_messages vn300_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/geo/autocone/src/vn300/msg/gps.msg" NAME_WE)
add_dependencies(vn300_generate_messages_nodejs _vn300_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/geo/autocone/src/vn300/msg/sensors.msg" NAME_WE)
add_dependencies(vn300_generate_messages_nodejs _vn300_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/geo/autocone/src/vn300/msg/ins.msg" NAME_WE)
add_dependencies(vn300_generate_messages_nodejs _vn300_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/geo/autocone/src/vn300/msg/utc_time.msg" NAME_WE)
add_dependencies(vn300_generate_messages_nodejs _vn300_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(vn300_gennodejs)
add_dependencies(vn300_gennodejs vn300_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS vn300_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(vn300
  "/home/geo/autocone/src/vn300/msg/gps.msg"
  "${MSG_I_FLAGS}"
  "/home/geo/autocone/src/vn300/msg/utc_time.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vn300
)
_generate_msg_py(vn300
  "/home/geo/autocone/src/vn300/msg/sensors.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vn300
)
_generate_msg_py(vn300
  "/home/geo/autocone/src/vn300/msg/ins.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vn300
)
_generate_msg_py(vn300
  "/home/geo/autocone/src/vn300/msg/utc_time.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vn300
)

### Generating Services

### Generating Module File
_generate_module_py(vn300
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vn300
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(vn300_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(vn300_generate_messages vn300_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/geo/autocone/src/vn300/msg/gps.msg" NAME_WE)
add_dependencies(vn300_generate_messages_py _vn300_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/geo/autocone/src/vn300/msg/sensors.msg" NAME_WE)
add_dependencies(vn300_generate_messages_py _vn300_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/geo/autocone/src/vn300/msg/ins.msg" NAME_WE)
add_dependencies(vn300_generate_messages_py _vn300_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/geo/autocone/src/vn300/msg/utc_time.msg" NAME_WE)
add_dependencies(vn300_generate_messages_py _vn300_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(vn300_genpy)
add_dependencies(vn300_genpy vn300_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS vn300_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vn300)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vn300
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(vn300_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(vn300_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vn300)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vn300
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(vn300_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(vn300_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vn300)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vn300
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(vn300_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(vn300_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vn300)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vn300
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(vn300_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(vn300_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vn300)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vn300\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vn300
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(vn300_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(vn300_generate_messages_py geometry_msgs_generate_messages_py)
endif()
