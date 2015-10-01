add_subdirectory(bmc)
add_subdirectory(bsat)

# FIXME: Disabled? This is also C++ code!
#add_subdirectory(bsat2)

add_subdirectory(cnf)
add_subdirectory(csat)
# FIXME
#add_subdirectory(lsat)
add_subdirectory(msat)
# FIXME
#add_subdirectory(proof)
add_subdirectory(psat)
abc_module_propagate()
