cmake_minimum_required(VERSION 3.1.0)

# include specific functions

# set global variables
set(UNIT_TESTS_EXE_NAME ${TASKS_LIB_NAME}-unit-tests)

# set name for unit-test-project(s)
project(${UNIT_TESTS_EXE_NAME} NONE)

# set include directories
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/")
include_directories("${CMAKE_SOURCE_DIR}/")

if(TASKS_LIB_BUILD_UNIT_TESTS OR TASKS_LIB_BUILD_SUIT_TESTS)
    include("${CMAKE_SOURCE_DIR}/AddGoogleTests.cmake")
    AddGoogleTests()
endif()

if(TASKS_LIB_BUILD_UNIT_TESTS)
    include("${CMAKE_CURRENT_SOURCE_DIR}/AddUnitTests.cmake")
    AddUnitTests()
endif()

if(TASKS_LIB_BUILD_SUIT_TESTS)
    include("${CMAKE_CURRENT_SOURCE_DIR}/AddSuitTests.cmake")
    AddSuitTests()
endif()
