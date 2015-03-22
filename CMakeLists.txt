project(libabc)
cmake_minimum_required(VERSION 2.8.8 FATAL_ERROR)

# Search paths for custom CMake modules
set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake/modules)

# -----------------------------------------------------------------------------
# Make RelWithDebInfo the default build type if otherwise not set
# -----------------------------------------------------------------------------
set(build_types Debug Release RelWithDebInfo MinSizeRel)
if(NOT CMAKE_BUILD_TYPE)

      message(STATUS "You can choose the type of build, options are:${build_types}")
      set(CMAKE_BUILD_TYPE RelWithDebInfo CACHE String
          "Options are ${build_types}"
          FORCE
         )

      # Provide drop down menu options in cmake-gui
      set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS ${build_types})
endif()
message(STATUS "Doing a ${CMAKE_BUILD_TYPE} build")

# -----------------------------------------------------------------------------
# Option to enable/disable assertions
# -----------------------------------------------------------------------------

# Filter out definition of NDEBUG from the default build configuration flags.
# We will add this ourselves if we want to disable assertions
foreach (build_config ${build_types})
    string(TOUPPER ${build_config} upper_case_build_config)
    foreach (language CXX C)
        set(VAR_TO_MODIFY "CMAKE_${language}_FLAGS_${upper_case_build_config}")
        string(REGEX REPLACE "(^| )[/-]D *NDEBUG($| )"
                             " "
                             replacement
                             "${${VAR_TO_MODIFY}}"
              )
        #message("Original (${VAR_TO_MODIFY}) is ${${VAR_TO_MODIFY}} replacement is ${replacement}")
        set(${VAR_TO_MODIFY} "${replacement}" CACHE STRING "Default flags for ${build_config} configuration" FORCE)
    endforeach()
endforeach()

option(ENABLE_ASSERTIONS "Build with assertions enabled" ON)
if (ENABLE_ASSERTIONS)
  # NDEBUG was already removed.
else()
  # Note this definition doesn't appear in the cache variables.
  add_definitions(-DNDEBUG)
endif()

# -----------------------------------------------------------------------------
# Let the user decide if they want to build shared or static client library.
# ABC will link against this client library
# -----------------------------------------------------------------------------
option(BUILD_SHARED_LIBS "Build client library as a shared library" ON)

if (WIN32)
  # building of shared lib on windows is not done at source level
  set(BUILD_SHARED_LIBS OFF)
  message(WARNING "Disabling building of shared library on Windows")
else()
  option(BUILD_STATIC_BIN "Build a static binary (and no shared libs)" OFF)
  if (BUILD_STATIC_BIN)
    set(BUILD_SHARED_LIBS OFF)
    # Flags for the linker will be set later
  endif()
endif()

if (BUILD_SHARED_LIBS)
  option(ALSO_BUILD_STATIC_LIB "IF building shared library, also build the static library" ON)

  set(ABC_SHARED_LIBRARY libstp) # Used for exporting target

  if (ALSO_BUILD_STATIC_LIB AND NOT WIN32)
    list(APPEND TARGETS_TO_EXPORT libabc_static)
    set(ABC_STATIC_LIBRARY libabc_static) # Used for exporting target
  endif()

else()
  set(STP_STATIC_LIBRARY libstp) # Used for exporting target
  unset(ALSO_BUILD_STATIC_LIB CACHE) # Hide this option for ccmake and cmake-gui users
endif()

if(WIN32)
  set(FLEX_PATH_HINT "e:/cygwin/bin" CACHE STRING "Flex path hints, can be null if on your path")
  set(BISON_PATH_HINT "e:/cygwin/bin" CACHE STRING "Bison path hints, can be null if on your path")
  set(PERL_PATH_HINT "C:/Perl/bin" CACHE STRING "Perl path hints, can be null if on your pat")

  set(PHINTS ${PERL_PATH_HINT} ${FLEX_PATH_HINT} ${BISON_PATH_HINT})

  if(MSVC)
      set(OPTIMIZITION_FLAGS  "/GL /Ox /Oi /Ot /Oy")
      set(STP_DEFS_COMM ${STP_DEFS_COMM} -D_CRT_SECURE_NO_WARNINGS)
      set(STP_INCL_COMM windows/winports windows/winports/msc99hdr ${STP_INCL_COMM})
      include_directories(${STP_INCL_COMM})

      # stack size of MSVC must be specified
      string(REGEX REPLACE "/STACK:[0-9]+" "" CMAKE_EXE_LINKER_FLAGS ${CMAKE_EXE_LINKER_FLAGS})
      set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /STACK:256000000")

      # inline is not a keyword in visual studios old C version, allow its redefinition
      add_definitions("-D_ALLOW_KEYWORD_MACROS")
  else()
      # mingw
      set(STP_DEFS_COMM ${STP_DEFS_COMM} -DEXT_HASH_MAP)
  endif()
  add_definitions(${STP_DEFS_COMM})
endif()

SET(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)


# -----------------------------------------------------------------------------
# Write out the config.h
# -----------------------------------------------------------------------------
# TODO config file should contain the definitions
add_definitions(-DLIN64 -DSIZEOF_VOID_P=8 -DSIZEOF_LONG=8 -DSIZEOF_INT=4)
configure_file(
  "${CMAKE_CURRENT_SOURCE_DIR}/include/config.h.in"
  "${CMAKE_CURRENT_BINARY_DIR}/include/config.h"
)

# -----------------------------------------------------------------------------
# Set up includes
# -----------------------------------------------------------------------------
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/include")
include_directories("${CMAKE_CURRENT_BINARY_DIR}/include")

# -----------------------------------------------------------------------------
# Add Git revision
# -----------------------------------------------------------------------------

include(GetGitRevisionDescription)
get_git_head_revision(GIT_REFSPEC GIT_SHA1)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-unused-but-set-variable")
set(ABC_SHARED_LIBRARY libabc)
set(ABC_STATIC_LIBRARY libabc_static)



# -----------------------------------------------------------------------------
# Setup library build path (this is **not** the library install path)
# -----------------------------------------------------------------------------
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib)

# -----------------------------------------------------------------------------
# Provide an export name to be used by targets that wish to export themselves.
# -----------------------------------------------------------------------------
set(ABC_EXPORT_NAME "ABCTargets")

# -----------------------------------------------------------------------------
# Compile all subdirs
# -----------------------------------------------------------------------------
add_subdirectory(src)

# -----------------------------------------------------------------------------
# Add uninstall target for makefiles
# -----------------------------------------------------------------------------
configure_file(
  "${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules/cmake_uninstall.cmake.in"
  "${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake"
  IMMEDIATE @ONLY
)

add_custom_target(uninstall
  COMMAND ${CMAKE_COMMAND} -P ${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake
)

# -----------------------------------------------------------------------------
# Export our targets so that other CMake based projects can interface with
# the build of ABC in the build-tree
# -----------------------------------------------------------------------------
set(ABC_TARGETS_FILENAME "ABCTargets.cmake")
set(ABC_CONFIG_FILENAME "ABCConfig.cmake")
export(TARGETS abc ${ABC_SHARED_LIBRARY} ${ABC_STATIC_LIBRARY}
  FILE "${PROJECT_BINARY_DIR}/${ABC_TARGETS_FILENAME}"
)

# Create ABCConfig file
set(EXPORT_TYPE "Build-tree")
set(CONF_INCLUDE_DIRS "${PROJECT_BINARY_DIR}/include")
configure_file(ABCConfig.cmake.in
  "${PROJECT_BINARY_DIR}/${ABC_CONFIG_FILENAME}" @ONLY
)

# Export this package to the CMake user package registry
# Now the user can just use find_package(ABC) on their system
export(PACKAGE ABC)

# -----------------------------------------------------------------------------
# Export our targets so that other CMake based projects can interface with
# the build of ABC that is installed.
# -----------------------------------------------------------------------------
if(WIN32 AND NOT CYGWIN)
  set(DEF_INSTALL_CMAKE_DIR CMake)
else()
  set(DEF_INSTALL_CMAKE_DIR lib/cmake/ABC)
endif()
set(ABC_INSTALL_CMAKE_DIR ${DEF_INSTALL_CMAKE_DIR} CACHE PATH
  "Installation directory for ABC CMake files"
)

# Create ABCConfig file
set(EXPORT_TYPE "installed")
set(CONF_INCLUDE_DIRS "${CMAKE_INSTALL_PREFIX}/include")
configure_file(ABCConfig.cmake.in
  "${PROJECT_BINARY_DIR}/${CMAKE_FILES_DIRECTORY}/${ABC_CONFIG_FILENAME}" @ONLY
)

install(FILES
  "${PROJECT_BINARY_DIR}/${CMAKE_FILES_DIRECTORY}/${ABC_CONFIG_FILENAME}"
  DESTINATION "${ABC_INSTALL_CMAKE_DIR}"
)

# Install the export set for use with the install-tree
install(EXPORT ${ABC_EXPORT_NAME} DESTINATION
  "${ABC_INSTALL_CMAKE_DIR}"
)
