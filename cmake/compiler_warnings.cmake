include(CheckCCompilerFlag)
set(ABC_C_COMPILER_WARNING_FLAGS "")
macro(add_flag_if_supported flag name)
  check_c_compiler_flag(${flag} SUPPORTS_WARNING_${name})
  if (SUPPORTS_WARNING_${name})
    list(APPEND ABC_C_COMPILER_WARNING_FLAGS "${flag}")
  else()
    message(WARNING "${flag} not supported")
  endif()
endmacro()

# Warnings to Add
add_flag_if_supported(-Wall all)

# Warnings to avoid
add_flag_if_supported(-Wno-unused-function NO_UNUSED_FUNCTION)
add_flag_if_supported(-Wno-write-strings NO_WRITE_STRINGS)
add_flag_if_supported(-Wno-sign-compare NO_SIGN_COMPARE)
# The Makefile build system seems to make this check. Not sure if it's really necessary
if (${CMAKE_C_COMPILER_ID} MATCHES "GNU")
  if ((${CMAKE_C_COMPILER_VERSION} VERSION_GREATER 4.6) OR
      (${CMAKE_C_COMPILER_VERSION} VERSION_EQUAL 4.6))
    add_flag_if_supported(-Wno-unused-but-set-variable NO_UNUSED_BUT_SET_VARIABLE)
  endif()
endif()
