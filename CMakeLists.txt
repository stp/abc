# This overrides the default flags for the different CMAKE_BUILD_TYPEs
set(CMAKE_USER_MAKE_RULES_OVERRIDE ${CMAKE_CURRENT_SOURCE_DIR}/cmake/c_flags_override.cmake)
project(ABC C)
cmake_minimum_required(VERSION 2.8.12)
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

###############################################################################
# Set Project version
# * Incrementing patch should not introduce API change
# * A breaking API change should require a change to minor and/or major version
#   number
###############################################################################
# FIXME: Set **REAL** version number, this one is just made up!
set(ABC_VERSION_MAJOR 1)
set(ABC_VERSION_MINOR 0)
set(ABC_VERSION_PATCH 0)
set(ABC_VERSION "${ABC_VERSION_MAJOR}.${ABC_VERSION_MINOR}.${ABC_VERSION_PATCH}")

###############################################################################
# Set default project BUILD_TYPE
###############################################################################
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE "Release" CACHE STRING
      "Choose the type of build, options are: Debug Release RelWithDebInfo MinSizeRel." FORCE)
endif()
message(STATUS "CMAKE_BUILD_TYPE:${CMAKE_BUILD_TYPE}")

###############################################################################
# Detect architecture features and set appropriate definitions
###############################################################################
include(cmake/arch_defines.cmake)
message(STATUS "ABC_ARCH_DEFINES: ${ABC_ARCH_DEFINES}")
add_definitions(${ABC_ARCH_DEFINES})

###############################################################################
# Set up warnings
###############################################################################
include(cmake/compiler_warnings.cmake)
message(STATUS "ABC_C_COMPILER_WARNING_FLAGS: ${ABC_C_COMPILER_WARNING_FLAGS}")
add_compile_options(${ABC_C_COMPILER_WARNING_FLAGS})

###############################################################################
# Clang Sanitizer support
###############################################################################
include(cmake/clang_sanitizers.cmake)

###############################################################################
# Set C standard to use
# Currently assume GNU C99
###############################################################################
if (("${CMAKE_C_COMPILER_ID}" MATCHES "Clang") OR
    ("${CMAKE_C_COMPILER_ID}" MATCHES "GNU"))
  add_compile_options(-std=gnu99)
endif()

###############################################################################
# Set location for built binaries in build tree
###############################################################################
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")

###############################################################################
# Provide option to control asserts
###############################################################################
# TODO: Do we need expose if we built with assert to clients (i.e. when they 
# include our headers does NDEBUG being defined matter)?
option(ENABLE_ASSERTIONS "Compile with asserts enabled" ON)
if (NOT ENABLE_ASSERTIONS)
  message(STATUS "Asserts disabled")
  add_definitions(-DNDEBUG)
else()
  message(STATUS "Asserts enabled")
endif()

###############################################################################
# CUDD option
# FIXME: What is this?
###############################################################################
option(ENABLE_CUDD "FIXME: Document this" ON)
if (ENABLE_CUDD)
  message(STATUS "CUDD enabled")
  add_definitions(-DABC_USE_CUDD)
else()
  message(STATUS "CUDD disabled")
endif()

###############################################################################
# Library dependencies
###############################################################################
# FIXME: Which are dependencies of the executable
# and which are dependencies of the library?
set(ABC_LIB_LIB_DEPS "")
set(ABC_EXEC_LIB_DEPS "")
if (NOT MSVC)
  list(APPEND ABC_LIB_LIB_DEPS "m" "dl")
endif()

option(ENABLE_READLINE "Use readline library" ON)
if (ENABLE_READLINE)
  find_package(Readline MODULE REQUIRED)
  include_directories(${Readline_INCLUDE_DIR})
  list(APPEND ABC_EXEC_LIB_DEPS ${Readline_LIBRARY})
  message(STATUS "Readline enabled")
  add_definitions(-DABC_USE_READLINE)
else()
  message(STATUS "Readline disabled")
endif()

option(ENABLE_THREADS "Use threads" ON)
if (ENABLE_THREADS)
  set(CMAKE_THREAD_PREFER_PTHREAD 1)
  find_package(Threads MODULE REQUIRED)
  list(APPEND ABC_LIB_LIB_DEPS ${CMAKE_THREAD_LIBS_INIT})
  add_definitions(-DABC_USE_PTHREADS)
  message(STATUS "Threads enabled")
else()
  message(STATUS "Threads disabled")
endif()


###############################################################################
# Provide option to build shared library
###############################################################################
option(BUILD_SHARED_LIBS "Build shared library, if OFF then build static library" OFF)
if (BUILD_SHARED_LIBS)
  message(STATUS "Building shared library")
else()
  message(STATUS "Building static library")
endif()

###############################################################################
# Doxygen documentation
###############################################################################
option(ENABLE_DOXYGEN "Enable doxygen documentation target" OFF)
if (ENABLE_DOXYGEN)
  message(FATAL "TODO")
endif()


###############################################################################
# Build targets
###############################################################################
add_subdirectory(src)
