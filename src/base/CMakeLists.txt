add_subdirectory(abc)
add_subdirectory(abci)
add_subdirectory(bac)
add_subdirectory(cba)
add_subdirectory(cmd)
add_subdirectory(io)

# FIXME: Ignoring main
# main function code should not exist in a library!

add_subdirectory(pla)

# FIXME: Does this really belong in the library?
add_subdirectory(test)

add_subdirectory(ver)
add_subdirectory(wlc)
abc_module_propagate()
