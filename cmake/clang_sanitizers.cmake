# This file is a little different in that it sets compiler
# flags differently. It would be nice if we could check that
# -fsanitize=* works using check_c_compiler_flag()
# but unfortunately it doesn't right now because
# the option needs to be specified for the link step too.

if ("${CMAKE_C_COMPILER_ID}" MATCHES "Clang")
  option(ENABLE_ASAN "Use Clang's address sanitizer" OFF)
  option(ENABLE_MSAN "Use Clang's memory sanitizer" OFF)
  option(ENABLE_UBSAN "Use Clang's undefined behaviour sanitizers" OFF)

  set(sanitizer_enabled FALSE)

  if (ENABLE_ASAN)
    message(STATUS "Building with Address Sanitizer")
    add_compile_options(-fsanitize=address)
    # Linker flag is needed so runtime library gets linked in
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -fsanitize=address")
    set(sanitizer_enabled TRUE)
  endif()

  if (ENABLE_MSAN)
    # FIXME: Doesn't seem to work when running abc executable.
    message(STATUS "Building with Memory Sanitizer")
    add_compile_options(-fsanitize=memory)
    # Linker flag is needed so runtime library gets linked in
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -fsanitize=memory")
    set(sanitizer_enabled TRUE)
  endif()

  if (ENABLE_UBSAN)
    message(STATUS "Building with Undefined behavior Sanitizer")
    add_compile_options(-fsanitize=undefined)
    set(sanitizer_enabled TRUE)
  endif()

  if (sanitizer_enabled)
    # Needed for useful backtraces
    add_compile_options(-fno-omit-frame-pointer)
    add_compile_options(-g)
  endif()
endif()
