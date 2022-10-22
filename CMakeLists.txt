cmake_minimum_required(VERSION 3.21.0)

project(Tasks
    VERSION 1.0.0
    DESCRIPTION "Template C++ library"
    LANGUAGES CXX)

#----------------------------------------------------------------------------------------------------------------------
# adjusted settings and options
#----------------------------------------------------------------------------------------------------------------------

# choose the name of your library
set(TASKS_LIB_NAME "${PROJECT_NAME}Lib")

# choose target c++ standart
set(TASKS_LIB_CXX_STANDART 17)

# choose staic or shared build option or allow to set by default
# MYLIB_SHARED_LIBS option (undefined by default) can be used to force shared/static build

# choose should the general-target-lib be built
option(TASKS_LIB_BUILD_TARGET_LIB "Build target lib" ON)

# choose should the unit-tests be compilled together
option(TASKS_LIB_BUILD_UNIT_TESTS "Build unit-tests" ON)

# choose should the suit-tests be compilled together
option(TASKS_LIB_BUILD_SUIT_TESTS "Build suit-tests" ON)

# choose should the boost-library be compilled together
option(TASKS_LIB_BUILD_WITH_BOOST "Build with Boost" OFF)

#----------------------------------------------------------------------------------------------------------------------
# global settings and options
#----------------------------------------------------------------------------------------------------------------------

# it allows using of folder-filters in VS-solution
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

#----------------------------------------------------------------------------------------------------------------------
# dependencies
#----------------------------------------------------------------------------------------------------------------------

# Search for your dependencies here

#----------------------------------------------------------------------------------------------------------------------
# sources
#----------------------------------------------------------------------------------------------------------------------

if(TASKS_LIB_BUILD_WITH_BOOST)
    include("${CMAKE_SOURCE_DIR}/AddBoost.cmake")
    AddBoost()
endif()

if(TASKS_LIB_BUILD_TARGET_LIB)
    include("${CMAKE_SOURCE_DIR}/TargetBuild.cmake")
    TargetBuild()
endif()

# add tests
add_subdirectory(./tests)
