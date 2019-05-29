# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "robostilt_common: 4 messages, 7 services")

set(MSG_I_FLAGS "-Irobostilt_common:/home/fernandomierhicks/robostilt/src/robostilt_common/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(robostilt_common_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/RaiseLegsOnFrame.srv" NAME_WE)
add_custom_target(_robostilt_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robostilt_common" "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/RaiseLegsOnFrame.srv" ""
)

get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/RaiseFrame.srv" NAME_WE)
add_custom_target(_robostilt_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robostilt_common" "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/RaiseFrame.srv" ""
)

get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/ActuatorsState.msg" NAME_WE)
add_custom_target(_robostilt_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robostilt_common" "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/ActuatorsState.msg" "robostilt_common/SingleActuator:std_msgs/Header"
)

get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/TriggerFault.srv" NAME_WE)
add_custom_target(_robostilt_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robostilt_common" "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/TriggerFault.srv" ""
)

get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/LowerLegsOnFrame.srv" NAME_WE)
add_custom_target(_robostilt_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robostilt_common" "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/LowerLegsOnFrame.srv" ""
)

get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/SetPosition.srv" NAME_WE)
add_custom_target(_robostilt_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robostilt_common" "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/SetPosition.srv" ""
)

get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/SingleActuator.msg" NAME_WE)
add_custom_target(_robostilt_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robostilt_common" "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/SingleActuator.msg" ""
)

get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/FramesState.msg" NAME_WE)
add_custom_target(_robostilt_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robostilt_common" "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/FramesState.msg" ""
)

get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/StopAll.srv" NAME_WE)
add_custom_target(_robostilt_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robostilt_common" "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/StopAll.srv" ""
)

get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/RobotState.msg" NAME_WE)
add_custom_target(_robostilt_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robostilt_common" "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/RobotState.msg" ""
)

get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/MovePrismatic.srv" NAME_WE)
add_custom_target(_robostilt_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robostilt_common" "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/MovePrismatic.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/SingleActuator.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robostilt_common
)
_generate_msg_cpp(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/ActuatorsState.msg"
  "${MSG_I_FLAGS}"
  "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/SingleActuator.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robostilt_common
)
_generate_msg_cpp(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/FramesState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robostilt_common
)
_generate_msg_cpp(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/RobotState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robostilt_common
)

### Generating Services
_generate_srv_cpp(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/RaiseFrame.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robostilt_common
)
_generate_srv_cpp(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/TriggerFault.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robostilt_common
)
_generate_srv_cpp(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/LowerLegsOnFrame.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robostilt_common
)
_generate_srv_cpp(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/SetPosition.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robostilt_common
)
_generate_srv_cpp(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/RaiseLegsOnFrame.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robostilt_common
)
_generate_srv_cpp(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/StopAll.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robostilt_common
)
_generate_srv_cpp(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/MovePrismatic.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robostilt_common
)

### Generating Module File
_generate_module_cpp(robostilt_common
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robostilt_common
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(robostilt_common_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(robostilt_common_generate_messages robostilt_common_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/RaiseLegsOnFrame.srv" NAME_WE)
add_dependencies(robostilt_common_generate_messages_cpp _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/RaiseFrame.srv" NAME_WE)
add_dependencies(robostilt_common_generate_messages_cpp _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/ActuatorsState.msg" NAME_WE)
add_dependencies(robostilt_common_generate_messages_cpp _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/TriggerFault.srv" NAME_WE)
add_dependencies(robostilt_common_generate_messages_cpp _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/LowerLegsOnFrame.srv" NAME_WE)
add_dependencies(robostilt_common_generate_messages_cpp _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/SetPosition.srv" NAME_WE)
add_dependencies(robostilt_common_generate_messages_cpp _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/SingleActuator.msg" NAME_WE)
add_dependencies(robostilt_common_generate_messages_cpp _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/FramesState.msg" NAME_WE)
add_dependencies(robostilt_common_generate_messages_cpp _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/StopAll.srv" NAME_WE)
add_dependencies(robostilt_common_generate_messages_cpp _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/RobotState.msg" NAME_WE)
add_dependencies(robostilt_common_generate_messages_cpp _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/MovePrismatic.srv" NAME_WE)
add_dependencies(robostilt_common_generate_messages_cpp _robostilt_common_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robostilt_common_gencpp)
add_dependencies(robostilt_common_gencpp robostilt_common_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robostilt_common_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/SingleActuator.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robostilt_common
)
_generate_msg_eus(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/ActuatorsState.msg"
  "${MSG_I_FLAGS}"
  "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/SingleActuator.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robostilt_common
)
_generate_msg_eus(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/FramesState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robostilt_common
)
_generate_msg_eus(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/RobotState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robostilt_common
)

### Generating Services
_generate_srv_eus(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/RaiseFrame.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robostilt_common
)
_generate_srv_eus(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/TriggerFault.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robostilt_common
)
_generate_srv_eus(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/LowerLegsOnFrame.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robostilt_common
)
_generate_srv_eus(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/SetPosition.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robostilt_common
)
_generate_srv_eus(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/RaiseLegsOnFrame.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robostilt_common
)
_generate_srv_eus(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/StopAll.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robostilt_common
)
_generate_srv_eus(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/MovePrismatic.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robostilt_common
)

### Generating Module File
_generate_module_eus(robostilt_common
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robostilt_common
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(robostilt_common_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(robostilt_common_generate_messages robostilt_common_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/RaiseLegsOnFrame.srv" NAME_WE)
add_dependencies(robostilt_common_generate_messages_eus _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/RaiseFrame.srv" NAME_WE)
add_dependencies(robostilt_common_generate_messages_eus _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/ActuatorsState.msg" NAME_WE)
add_dependencies(robostilt_common_generate_messages_eus _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/TriggerFault.srv" NAME_WE)
add_dependencies(robostilt_common_generate_messages_eus _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/LowerLegsOnFrame.srv" NAME_WE)
add_dependencies(robostilt_common_generate_messages_eus _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/SetPosition.srv" NAME_WE)
add_dependencies(robostilt_common_generate_messages_eus _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/SingleActuator.msg" NAME_WE)
add_dependencies(robostilt_common_generate_messages_eus _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/FramesState.msg" NAME_WE)
add_dependencies(robostilt_common_generate_messages_eus _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/StopAll.srv" NAME_WE)
add_dependencies(robostilt_common_generate_messages_eus _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/RobotState.msg" NAME_WE)
add_dependencies(robostilt_common_generate_messages_eus _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/MovePrismatic.srv" NAME_WE)
add_dependencies(robostilt_common_generate_messages_eus _robostilt_common_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robostilt_common_geneus)
add_dependencies(robostilt_common_geneus robostilt_common_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robostilt_common_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/SingleActuator.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robostilt_common
)
_generate_msg_lisp(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/ActuatorsState.msg"
  "${MSG_I_FLAGS}"
  "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/SingleActuator.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robostilt_common
)
_generate_msg_lisp(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/FramesState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robostilt_common
)
_generate_msg_lisp(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/RobotState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robostilt_common
)

### Generating Services
_generate_srv_lisp(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/RaiseFrame.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robostilt_common
)
_generate_srv_lisp(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/TriggerFault.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robostilt_common
)
_generate_srv_lisp(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/LowerLegsOnFrame.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robostilt_common
)
_generate_srv_lisp(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/SetPosition.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robostilt_common
)
_generate_srv_lisp(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/RaiseLegsOnFrame.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robostilt_common
)
_generate_srv_lisp(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/StopAll.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robostilt_common
)
_generate_srv_lisp(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/MovePrismatic.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robostilt_common
)

### Generating Module File
_generate_module_lisp(robostilt_common
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robostilt_common
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(robostilt_common_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(robostilt_common_generate_messages robostilt_common_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/RaiseLegsOnFrame.srv" NAME_WE)
add_dependencies(robostilt_common_generate_messages_lisp _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/RaiseFrame.srv" NAME_WE)
add_dependencies(robostilt_common_generate_messages_lisp _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/ActuatorsState.msg" NAME_WE)
add_dependencies(robostilt_common_generate_messages_lisp _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/TriggerFault.srv" NAME_WE)
add_dependencies(robostilt_common_generate_messages_lisp _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/LowerLegsOnFrame.srv" NAME_WE)
add_dependencies(robostilt_common_generate_messages_lisp _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/SetPosition.srv" NAME_WE)
add_dependencies(robostilt_common_generate_messages_lisp _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/SingleActuator.msg" NAME_WE)
add_dependencies(robostilt_common_generate_messages_lisp _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/FramesState.msg" NAME_WE)
add_dependencies(robostilt_common_generate_messages_lisp _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/StopAll.srv" NAME_WE)
add_dependencies(robostilt_common_generate_messages_lisp _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/RobotState.msg" NAME_WE)
add_dependencies(robostilt_common_generate_messages_lisp _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/MovePrismatic.srv" NAME_WE)
add_dependencies(robostilt_common_generate_messages_lisp _robostilt_common_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robostilt_common_genlisp)
add_dependencies(robostilt_common_genlisp robostilt_common_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robostilt_common_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/SingleActuator.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robostilt_common
)
_generate_msg_nodejs(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/ActuatorsState.msg"
  "${MSG_I_FLAGS}"
  "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/SingleActuator.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robostilt_common
)
_generate_msg_nodejs(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/FramesState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robostilt_common
)
_generate_msg_nodejs(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/RobotState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robostilt_common
)

### Generating Services
_generate_srv_nodejs(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/RaiseFrame.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robostilt_common
)
_generate_srv_nodejs(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/TriggerFault.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robostilt_common
)
_generate_srv_nodejs(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/LowerLegsOnFrame.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robostilt_common
)
_generate_srv_nodejs(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/SetPosition.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robostilt_common
)
_generate_srv_nodejs(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/RaiseLegsOnFrame.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robostilt_common
)
_generate_srv_nodejs(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/StopAll.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robostilt_common
)
_generate_srv_nodejs(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/MovePrismatic.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robostilt_common
)

### Generating Module File
_generate_module_nodejs(robostilt_common
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robostilt_common
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(robostilt_common_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(robostilt_common_generate_messages robostilt_common_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/RaiseLegsOnFrame.srv" NAME_WE)
add_dependencies(robostilt_common_generate_messages_nodejs _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/RaiseFrame.srv" NAME_WE)
add_dependencies(robostilt_common_generate_messages_nodejs _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/ActuatorsState.msg" NAME_WE)
add_dependencies(robostilt_common_generate_messages_nodejs _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/TriggerFault.srv" NAME_WE)
add_dependencies(robostilt_common_generate_messages_nodejs _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/LowerLegsOnFrame.srv" NAME_WE)
add_dependencies(robostilt_common_generate_messages_nodejs _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/SetPosition.srv" NAME_WE)
add_dependencies(robostilt_common_generate_messages_nodejs _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/SingleActuator.msg" NAME_WE)
add_dependencies(robostilt_common_generate_messages_nodejs _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/FramesState.msg" NAME_WE)
add_dependencies(robostilt_common_generate_messages_nodejs _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/StopAll.srv" NAME_WE)
add_dependencies(robostilt_common_generate_messages_nodejs _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/RobotState.msg" NAME_WE)
add_dependencies(robostilt_common_generate_messages_nodejs _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/MovePrismatic.srv" NAME_WE)
add_dependencies(robostilt_common_generate_messages_nodejs _robostilt_common_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robostilt_common_gennodejs)
add_dependencies(robostilt_common_gennodejs robostilt_common_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robostilt_common_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/SingleActuator.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robostilt_common
)
_generate_msg_py(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/ActuatorsState.msg"
  "${MSG_I_FLAGS}"
  "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/SingleActuator.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robostilt_common
)
_generate_msg_py(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/FramesState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robostilt_common
)
_generate_msg_py(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/RobotState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robostilt_common
)

### Generating Services
_generate_srv_py(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/RaiseFrame.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robostilt_common
)
_generate_srv_py(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/TriggerFault.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robostilt_common
)
_generate_srv_py(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/LowerLegsOnFrame.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robostilt_common
)
_generate_srv_py(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/SetPosition.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robostilt_common
)
_generate_srv_py(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/RaiseLegsOnFrame.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robostilt_common
)
_generate_srv_py(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/StopAll.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robostilt_common
)
_generate_srv_py(robostilt_common
  "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/MovePrismatic.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robostilt_common
)

### Generating Module File
_generate_module_py(robostilt_common
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robostilt_common
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(robostilt_common_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(robostilt_common_generate_messages robostilt_common_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/RaiseLegsOnFrame.srv" NAME_WE)
add_dependencies(robostilt_common_generate_messages_py _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/RaiseFrame.srv" NAME_WE)
add_dependencies(robostilt_common_generate_messages_py _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/ActuatorsState.msg" NAME_WE)
add_dependencies(robostilt_common_generate_messages_py _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/TriggerFault.srv" NAME_WE)
add_dependencies(robostilt_common_generate_messages_py _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/LowerLegsOnFrame.srv" NAME_WE)
add_dependencies(robostilt_common_generate_messages_py _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/SetPosition.srv" NAME_WE)
add_dependencies(robostilt_common_generate_messages_py _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/SingleActuator.msg" NAME_WE)
add_dependencies(robostilt_common_generate_messages_py _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/FramesState.msg" NAME_WE)
add_dependencies(robostilt_common_generate_messages_py _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/StopAll.srv" NAME_WE)
add_dependencies(robostilt_common_generate_messages_py _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/RobotState.msg" NAME_WE)
add_dependencies(robostilt_common_generate_messages_py _robostilt_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/MovePrismatic.srv" NAME_WE)
add_dependencies(robostilt_common_generate_messages_py _robostilt_common_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robostilt_common_genpy)
add_dependencies(robostilt_common_genpy robostilt_common_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robostilt_common_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robostilt_common)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robostilt_common
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(robostilt_common_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robostilt_common)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robostilt_common
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(robostilt_common_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robostilt_common)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robostilt_common
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(robostilt_common_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robostilt_common)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robostilt_common
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(robostilt_common_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robostilt_common)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robostilt_common\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robostilt_common
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robostilt_common
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robostilt_common/.+/__init__.pyc?$"
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(robostilt_common_generate_messages_py std_msgs_generate_messages_py)
endif()
