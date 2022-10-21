cmake_minimum_required(VERSION 3.21.0)

project(CppProjectTemplate
    VERSION 1.0.0
    DESCRIPTION "Template C++ library"
    LANGUAGES CXX)

    
#----------------------------------------------------------------------------------------------------------------------
# adjusted settings and options
#----------------------------------------------------------------------------------------------------------------------

# choose the name of your library
set(LIB_NAME "${PROJECT_NAME}Lib")

# choose staic or shared build option or allow to set by default
# MYLIB_SHARED_LIBS option (undefined by default) can be used to force shared/static build

# choose should the unit-tests be compilled together
option(MYLIB_BUILD_UNIT_TESTS "Build unit-tests" ON)

# choose should the suit-tests be compilled together
option(MYLIB_BUILD_SUIT_TESTS "Build suit-tests" ON)

# choose should the boost-library be compilled together
option(MYLIB_BUILD_WITH_BOOST "Build with Boost" ON)

add_library(${LIB_NAME})

# choose target c++ standart
set_property(TARGET ${LIB_NAME} PROPERTY CXX_STANDARD 17)

# choose the alias for your library
add_library(${LIB_NAME}::${LIB_NAME} ALIAS ${LIB_NAME})

#----------------------------------------------------------------------------------------------------------------------
# general settings and options
#----------------------------------------------------------------------------------------------------------------------

if(DEFINED MYLIB_SHARED_LIBS)
    set(BUILD_SHARED_LIBS ${MYLIB_SHARED_LIBS})
endif()

if(NOT DEFINED CMAKE_BUILD_TYPE AND NOT DEFINED CMAKE_CONFIGURATION_TYPES)
    set(CMAKE_BUILD_TYPE Release CACHE STRING "Build type" FORCE)
    set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release" "MinSizeRel" "RelWithDebInfo")
endif()

# it allows using of folder-filters in VS-solution
set_property(GLOBAL PROPERTY USE_FOLDERS ON)
# it allows to hide external visibility for all content by default
set_target_properties(${LIB_NAME} PROPERTIES CXX_VISIBILITY_PRESET hidden)
# it allows to hide external visibility for inline content by defatul
set_target_properties(${LIB_NAME} PROPERTIES VISIBILITY_INLINES_HIDDEN ON)

#----------------------------------------------------------------------------------------------------------------------
# dependencies
#----------------------------------------------------------------------------------------------------------------------

# Search for your dependencies here

#----------------------------------------------------------------------------------------------------------------------
# sources
#----------------------------------------------------------------------------------------------------------------------

# include specific functions
include("${CMAKE_SOURCE_DIR}/AddBoost.cmake")
include("${CMAKE_SOURCE_DIR}/ComposeFileBySourceGroup.cmake")
include("${CMAKE_SOURCE_DIR}/FindAllSourceFiles.cmake")

include(GenerateExportHeader)
generate_export_header(${LIB_NAME}
    EXPORT_FILE_NAME "${CMAKE_SOURCE_DIR}/src/export.hpp")


# set include directories
include_directories("${CMAKE_SOURCE_DIR}/")

# find all source files for this project
set(listAvalibleFilesTemplates ".+\\.h" ".+\\.hpp" ".+\\.cpp")
set(listIngnoredDirectoryes "${CMAKE_SOURCE_DIR}/tests" "${CMAKE_SOURCE_DIR}/build" "${CMAKE_SOURCE_DIR}/.git")
FindAllSourceFiles("Find all files for the ${LIB_NAME}" "${CMAKE_CURRENT_SOURCE_DIR}" "${listIngnoredDirectoryes}" "${listAvalibleFilesTemplates}" listTargetSourceFiles)

# compose all founded source files by directory
ComposeFileBySourceGroup("${CMAKE_CURRENT_SOURCE_DIR}" "${listTargetSourceFiles}")

# create library
target_sources(${LIB_NAME} PRIVATE ${listTargetSourceFiles})

if(MYLIB_BUILD_WITH_BOOST)
    AddBoost()
endif()

# add tests
add_subdirectory(./tests)
