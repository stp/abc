# Finds GNU readline
#
# Sets Readline_FOUND to TRUE if it was found and the following variables
#
# Readline_INCLUDE_DIR
# Readline_LIBRARY
find_path(Readline_INCLUDE_DIR
          NAMES readline/readline.h
)

find_library(Readline_LIBRARY
             NAMES readline
)

# Handle standard package args
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Readline DEFAULT_MSG Readline_INCLUDE_DIR Readline_LIBRARY)

if (Readline_INCLUDE_DIR AND Readline_LIBRARY)
  set(Readline_FOUND TRUE)
endif()
