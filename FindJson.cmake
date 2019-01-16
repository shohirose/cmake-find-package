# This module try to find JSON for Modern C++ lib
# Once done this will define
#
#  JSON_FOUND - JSON found
#  JSON_INCLUDE_DIR - the JSON include directory

find_path(JSON_INCLUDE_DIR nlohmann/json.hpp
  HINTS
    ENV JSON_ROOT
    ENV JSON_INCLUDE_DIR
    ${JSON_ROOT}
    /usr
    /usr/local
    $ENV{HOME}/.local
  PATH_SUFFIXES
    include
  )

mark_as_advanced(JSON_INCLUDE_DIR)

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(Json
  REQUIRED_VARS JSON_INCLUDE_DIR
  )

if(Json_FOUND AND NOT TARGET Json::Json)
  add_library(Json::Json INTERFACE IMPORTED)
  target_include_directories(Json::Json
    INTERFACE ${JSON_INCLUDE_DIR}
    )
endif()
