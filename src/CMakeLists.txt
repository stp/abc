set(abc_modules "")

###############################################################################
# Macro to propagate changes to list back to this level
###############################################################################
macro(abc_module_propagate)
  set(abc_modules ${abc_modules} PARENT_SCOPE)
endmacro()


###############################################################################
# Macro to add a "module"
###############################################################################
macro(abc_add_module module_name)
  message(STATUS "Adding module abc_${module_name}")
  add_library(abc_${module_name} OBJECT ${ARGN})
  # Check module doesn't already exist
  list(FIND abc_modules abc_${module_name} module_index)
  if (NOT (${module_index} EQUAL -1))
    message(FATAL_ERROR "Module ${module_name} has already been declared")
  endif()
  list(APPEND abc_modules abc_${module_name})
  # When building "object libraries" CMake won't add -fPIC (or the equivalent
  # on on other platforms) for us so do it manually
  if (BUILD_SHARED_LIBS)
    target_compile_options(abc_${module_name} PRIVATE ${CMAKE_SHARED_LIBRARY_C_FLAGS})
  endif()
  abc_module_propagate()
endmacro()


###############################################################################
# Build components
# The subdirectories should append to the "abc_objects" list.
###############################################################################

# FIXME: The layout of the header files sucks because the layout is bad for an
# install
include_directories(${CMAKE_CURRENT_SOURCE_DIR})

add_subdirectory(aig)
add_subdirectory(base)
add_subdirectory(bdd)
add_subdirectory(bool)
add_subdirectory(map)
add_subdirectory(misc)
add_subdirectory(opt)
# FIXME: Broken
#add_subdirectory(phys)
add_subdirectory(proof)
add_subdirectory(sat)

option(BUILD_PYTHON_BINDINGS "Build python bindings using SWIG" OFF)
if (BUILD_PYTHON_BINDINGS)
  add_subdirectory(python)
endif()


###############################################################################
# Build library
###############################################################################
# Collect all the objects from the "modules"
set(abc_objects "")
foreach (abc_module ${abc_modules})
  list(APPEND abc_objects $<TARGET_OBJECTS:${abc_module}>)
endforeach()
add_library(libabc ${abc_objects})
set_target_properties(libabc PROPERTIES
  OUTPUT_NAME abc
)

target_link_libraries(libabc INTERFACE ${ABC_LIB_LIB_DEPS})

if (BUILD_SHARED_LIBS)
    # This assumes that the API changes whenever the major or minor
    # version is incremented
    set_target_properties(libabc PROPERTIES
                            VERSION ${ABC_VERSION}
                            SOVERSION ${ABC_VERSION_MAJOR}.${ABC_VERSION_MINOR}
                         )
endif()

###############################################################################
# Build executable
###############################################################################
# FIXME: The location of the main executable is weird. It's mixed in with
# library code which feels wrong!
# FIXME: Not sure if some of this belongs in the library
add_executable(abc
  base/main/libSupport.c
  base/main/main.c
  base/main/mainFrame.c
  base/main/mainInit.c
  base/main/mainLib.c
  # FIXME: Dead?
  #base/main/mainMC.c
  base/main/mainReal.c
  base/main/mainUtils.c
)

target_link_libraries(abc PRIVATE
  libabc
  ${ABC_EXEC_LIB_DEPS}
)
