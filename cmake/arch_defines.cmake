include(CheckTypeSize)
# FIXME:
# Eurgh: This whole approach is gross we should be using stdint.h!
set(ABC_ARCH_DEFINES "")
check_type_size("void*" SIZE_OF_VOID_PTR)
message(STATUS "SIZE_OF_VOID_PTR:${SIZE_OF_VOID_PTR}")
check_type_size("long" SIZE_OF_LONG)
message(STATUS "SIZE_OF_LONG:${SIZE_OF_LONG}")
check_type_size("int" SIZE_OF_INT)
message(STATUS "SIZE_OF_INT:${SIZE_OF_INT}")

# Even more eurgh...
if (SIZE_OF_VOID_PTR EQUAL 8)
  # This comment is taken from old code (arch_flags.c).
  # "Assume 64-bit Linux if pointers are 8 bytes."
  list(APPEND ABC_ARCH_DEFINES -DLIN64)
  message(STATUS "Assuming 64-bit")
else()
  list(APPEND ABC_ARCH_DEFINES -DLIN)
  message(STATUS "Assuming not 64-bit")
endif()

list(APPEND ABC_ARCH_DEFINES
  -DSIZEOF_VOID_P=${SIZE_OF_VOID_PTR}
  -DSIZEOF_LONG=${SIZE_OF_LONG}
  -DSIZEOF_INT=${SIZE_OF_INT}
)

# FIXME: This logic was taken from the Makefile build system. Looks like
# a nasty hack to me
if (CMAKE_SYSTEM_PROCESSOR MATCHES "^arm")
  message(AUTHOR_WARNING "FIXME: This looks gross!")
  list(APPEND ABC_ARCH_DEFINES -DABC_MEMALIGN=4)
endif()
