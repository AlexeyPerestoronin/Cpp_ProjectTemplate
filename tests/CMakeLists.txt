cmake_minimum_required(VERSION 3.1.0)

# include specific functions
include("${CMAKE_SOURCE_DIR}/AddGoogleTests.cmake")
include("${CMAKE_CURRENT_SOURCE_DIR}/AddUnitTests.cmake")
include("${CMAKE_CURRENT_SOURCE_DIR}/AddSuitTests.cmake")

# set global variables
set(UNIT_TESTS_EXE_NAME ${LIB_NAME}-unit-tests)

# set name for unit-test-project(s)
project(${UNIT_TESTS_EXE_NAME} NONE)

# set include directories
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/")
include_directories("${CMAKE_SOURCE_DIR}/")

if(MYLIB_BUILD_UNIT_TESTS OR MYLIB_BUILD_SUIT_TESTS)
    AddGoogleTests()
endif()

if(MYLIB_BUILD_UNIT_TESTS)
    AddUnitTests()
endif()

if(MYLIB_BUILD_SUIT_TESTS)
    AddSuitTests()
endif()
