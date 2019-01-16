# Overview

This repository is a collection of CMake scripts to find packages using CMake's `FindPackageHandleStandardArgs`.

# Requirements

The minimum required version of CMake is 3.8.

# Available Packages

- CGAL
- GMP
- GMPXX (GMP for C++)
- MPFR
- MSGSL (Microsoft GSL library)
- Spdlog

# How to Use

Clone this repository under your project, and add the directory to `CMAKE_MODULE_PATH`. For example, if you clone this repository into `cmake` directory under your project root directory, do like:

```cmake
cmake_minimum_required(VERSION 3.8)
project(example CXX)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${PROJECT_SOURCE_DIR}/cmake

# ...
```

# Specifying Non-Standard Directories to Search

If you have installed a library under a non-standard directory such as your local directory, you must tell CMake the path to the directory. The root directory of each library without prefix (for instance, include or lib) can be set by:

```terminal
cmake .. -D<PACKAGE>_ROOT=path/to/local/dir
```

Or you can set the following environmental variables:

- `<PACKAGE>_ROOT`: the root directory of a package
- `<PACKAGE>_INCLUDE_DIR`: the include directory of a package
- `<PACKAGE>_LIB_DIR`: the library directory of a package
