# Overview

This repository is a collection of CMake scripts to find packages using CMake's `FindPackageHandleStandardArgs`.

# Requirements

The minimum required version of CMake is 3.8.

# How to Use

Clone this repository under your project, and add the directory to `CMAKE_MODULE_PATH`. For example, if you clone this repository into `cmake` directory under your project root directory, do like:

```cmake
cmake_minimum_required(VERSION 3.8)
project(example CXX)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${PROJECT_SOURCE_DIR}/cmake

# ...
```
