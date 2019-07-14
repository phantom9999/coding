cmake_minimum_required(VERSION 3.8)
project(demo_test)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_FLAGS "-std=c++11")
set(SOURCE_FILES main.cpp)
add_executable(demo_test ${SOURCE_FILES})

