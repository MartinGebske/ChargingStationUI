# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/ChargingStation_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/ChargingStation_autogen.dir/ParseCache.txt"
  "ChargingStation_autogen"
  )
endif()
