# brief: build genral-target-lib
function(TargetBuild)
    message("[${TASKS_LIB_NAME} building] begin")

    # predefine shared or static library
    if(DEFINED MYLIB_SHARED_LIBS)
        message("[INFO] ${TASKS_LIB_NAME} --> SHARED")
        add_library(${TASKS_LIB_NAME} SHARED)
    else()
        message("[INFO] ${TASKS_LIB_NAME} --> STATIC")
        add_library(${TASKS_LIB_NAME} STATIC)
    endif()

    set_target_properties(${TASKS_LIB_NAME} PROPERTIES
        # choose C++ language
        LINKER_LANGUAGE CXX
        # choose target C++ standart
        CXX_STANDARD ${TASKS_LIB_CXX_STANDART}
        # choose the alias for your library
        ALIAS ${TASKS_LIB_NAME}::${TASKS_LIB_NAME}
        # it allows to hide external visibility for all content by default
        CXX_VISIBILITY_PRESET hidden
        # it allows to hide external visibility for inline content by defatul
        VISIBILITY_INLINES_HIDDEN ON
    )
    
    include(GenerateExportHeader)
    generate_export_header(${TASKS_LIB_NAME}
        DEFINE_NO_DEPRECATED
        EXPORT_FILE_NAME "${CMAKE_SOURCE_DIR}/src/${TASKS_LIB_NAME}/autogenerated_export.hpp"
    )
    
    if(NOT DEFINED CMAKE_BUILD_TYPE AND NOT DEFINED CMAKE_CONFIGURATION_TYPES)
        set(CMAKE_BUILD_TYPE Release CACHE STRING "Build type" FORCE)
        set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release" "MinSizeRel" "RelWithDebInfo")
    endif()
    
    # set include directories
    include_directories("${CMAKE_SOURCE_DIR}/src")

    # include specific functions
    include("${CMAKE_SOURCE_DIR}/ComposeFileBySourceGroup.cmake")
    include("${CMAKE_SOURCE_DIR}/FindAllSourceFiles.cmake")

    # find all source files for this project
    set(listAvalibleFilesTemplates ".+\\.h" ".+\\.hpp" ".+\\.cpp")
    set(listIngnoredDirectoryes "${CMAKE_SOURCE_DIR}/tests" "${CMAKE_SOURCE_DIR}/schemes" "${CMAKE_SOURCE_DIR}/build" "${CMAKE_SOURCE_DIR}/.git")
    FindAllSourceFiles("Find all files for the ${TASKS_LIB_NAME}" "${CMAKE_CURRENT_SOURCE_DIR}" "${listIngnoredDirectoryes}" "${listAvalibleFilesTemplates}" listTargetSourceFiles)

    # compose all founded source files by directory
    ComposeFileBySourceGroup("${CMAKE_CURRENT_SOURCE_DIR}" "${listTargetSourceFiles}")

    # create library
    target_sources(${TASKS_LIB_NAME} PRIVATE ${listTargetSourceFiles})

    message("[${TASKS_LIB_NAME} building] end")
endfunction(TargetBuild)
