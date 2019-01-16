# - Find CGAL
# Find the CGAL includes and client library
# This module defines
#  CGAL_INCLUDE_DIR, where to find CGAL.h
#  CGAL_LIBRARY, the libraries needed to use CGAL.
#  CGAL_FOUND, If false, do not try to use CGAL.

find_path(CGAL_INCLUDE_DIR CGAL/basic.h
  PATHS
    ENV CGAL_ROOT
    ENV CGAL_INCLUDE_DIR
    ${CGAL_ROOT}
    /usr
    /usr/local
  PATH_SUFFIXES
    include
  )

find_library(CGAL_LIBRARY
  NAMES
    CGAL
  PATHS
    ENV CGAL_ROOT
    ENV CGAL_LIB_DIR
    ${CGAL_ROOT}
    /usr
    /usr/local
  PATH_SUFFIXES
    lib
  )

find_library(CGAL_CORE_LIBRARY
  NAMES
    CGAL_Core
  PATHS
    ENV CGAL_ROOT
    ENV CGAL_LIB_DIR
    ${CGAL_ROOT}
    /usr
    /usr/local
  PATH_SUFFIXES
    lib
  )

find_library(CGAL_IMAGE_IO_LIBRARY
  NAMES
    CGAL_ImageIO
  PATHS
    ENV CGAL_ROOT
    ENV CGAL_LIB_DIR
    ${CGAL_ROOT}
    /usr
    /usr/local
  PATH_SUFFIXES
    lib
  )

mark_as_advanced(
  CGAL_INCLUDE_DIR
  CGAL_LIBRARY
  CGAL_CORE_LIBRARY
  CGAL_IMAGE_IO_LIBRARY
  )

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(CGAL
  REQUIRED_VARS
    CGAL_INCLUDE_DIR
    CGAL_LIBRARY
    CGAL_CORE_LIBRARY
    CGAL_IMAGE_IO_LIBRARY
  )

if (NOT Boost_FOUND OR NOT Boost_THREAD_FOUND)
  find_package(Boost REQUIRED COMPONENTS thread)
endif()

if (NOT MPFR_FOUND)
  find_package(MPFR REQUIRED)
endif()

if(CGAL_FOUND)
  if(NOT TARGET CGAL::CGAL)
    add_library(CGAL::CGAL UNKNOWN IMPORTED)
    set_target_properties(CGAL::CGAL PROPERTIES
      IMPORTED_LINK_INTERFACE_LANGUAGES "CXX"
      IMPORTED_LOCATION "${CGAL_LIBRARY}"
      INTERFACE_INCLUDE_DIRECTORIES "${CGAL_INCLUDE_DIR}"
      INTERFACE_LINK_LIBRARIES Boost::boost Boost::thread MPFR::MPFR
      )
  endif()

  if (NOT TARGET CGAL::Core)
    add_library(CGAL::Core UNKNOWN IMPORTED)
    set_target_properties(CGAL::Core PROPERTIES
      IMPORTED_LINK_INTERFACE_LANGUAGES "CXX"
      IMPORTED_LOCATION "${CGAL_CORE_LIBRARY}"
      INTERFACE_INCLUDE_DIRECTORIES "${CGAL_INCLUDE_DIR}"
      INTERFACE_LINK_LIBRARIES Boost::boost Boost::thread MPFR::MPFR
      )
  endif()

  if (NOT TARGET CGAL::ImageIO)
    add_library(CGAL::ImageIO UNKNOWN IMPORTED)
    set_target_properties(CGAL::ImageIO PROPERTIES
      IMPORTED_LINK_INTERFACE_LANGUAGES "CXX"
      IMPORTED_LOCATION "${CGAL_IMAGE_IO_LIBRARY}"
      INTERFACE_INCLUDE_DIRECTORIES "${CGAL_INCLUDE_DIR}"
      INTERFACE_LINK_LIBRARIES Boost::boost Boost::thread MPFR::MPFR
      )
  endif()
endif()
