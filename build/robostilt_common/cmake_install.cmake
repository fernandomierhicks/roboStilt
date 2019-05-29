# Install script for directory: /home/fernandomierhicks/robostilt/src/robostilt_common

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/fernandomierhicks/robostilt/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
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

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  include("/home/fernandomierhicks/robostilt/build/robostilt_common/catkin_generated/safe_execute_install.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robostilt_common/msg" TYPE FILE FILES
    "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/RobotState.msg"
    "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/FramesState.msg"
    "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/ActuatorsState.msg"
    "/home/fernandomierhicks/robostilt/src/robostilt_common/msg/SingleActuator.msg"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robostilt_common/srv" TYPE FILE FILES
    "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/StopAll.srv"
    "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/TriggerFault.srv"
    "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/RaiseLegsOnFrame.srv"
    "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/MovePrismatic.srv"
    "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/RaiseFrame.srv"
    "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/LowerLegsOnFrame.srv"
    "/home/fernandomierhicks/robostilt/src/robostilt_common/srv/SetPosition.srv"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robostilt_common/cmake" TYPE FILE FILES "/home/fernandomierhicks/robostilt/build/robostilt_common/catkin_generated/installspace/robostilt_common-msg-paths.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/fernandomierhicks/robostilt/devel/include/robostilt_common")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/fernandomierhicks/robostilt/devel/share/roseus/ros/robostilt_common")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/fernandomierhicks/robostilt/devel/share/common-lisp/ros/robostilt_common")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/fernandomierhicks/robostilt/devel/share/gennodejs/ros/robostilt_common")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python" -m compileall "/home/fernandomierhicks/robostilt/devel/lib/python2.7/dist-packages/robostilt_common")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/fernandomierhicks/robostilt/devel/lib/python2.7/dist-packages/robostilt_common" REGEX "/\\_\\_init\\_\\_\\.py$" EXCLUDE REGEX "/\\_\\_init\\_\\_\\.pyc$" EXCLUDE)
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/fernandomierhicks/robostilt/devel/lib/python2.7/dist-packages/robostilt_common" FILES_MATCHING REGEX "/home/fernandomierhicks/robostilt/devel/lib/python2.7/dist-packages/robostilt_common/.+/__init__.pyc?$")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/fernandomierhicks/robostilt/build/robostilt_common/catkin_generated/installspace/robostilt_common.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robostilt_common/cmake" TYPE FILE FILES "/home/fernandomierhicks/robostilt/build/robostilt_common/catkin_generated/installspace/robostilt_common-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robostilt_common/cmake" TYPE FILE FILES
    "/home/fernandomierhicks/robostilt/build/robostilt_common/catkin_generated/installspace/robostilt_commonConfig.cmake"
    "/home/fernandomierhicks/robostilt/build/robostilt_common/catkin_generated/installspace/robostilt_commonConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robostilt_common" TYPE FILE FILES "/home/fernandomierhicks/robostilt/src/robostilt_common/package.xml")
endif()

