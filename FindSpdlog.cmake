# This module try to find spdlog lib
# Once done this will define
#
#  Spdlog_FOUND - system has spdlog lib
#  SPDLOG_INCLUDE_DIR - the spdlog include directory

find_path(SPDLOG_INCLUDE_DIR spdlog/spdlog.h
  PATHS
    ENV SPDLOG_ROOT
    ENV SPDLOG_INCLUDE_DIR
    ${SPDLOG_ROOT}
    /usr
    /usr/local
  PATH_SUFFIXES
    include
  )
mark_as_advanced(SPDLOG_INCLUDE_DIR)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Spdlog
  REQUIRED_VARS SPDLOG_INCLUDE_DIR
  )

if(Spdlog_FOUND AND NOT TARGET Spdlog::spdlog)
  add_library(Spdlog::spdlog INTERFACE IMPORTED)
  set_target_properties(Spdlog::spdlog PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${SPDLOG_INCLUDE_DIR}"
    )
endif()
