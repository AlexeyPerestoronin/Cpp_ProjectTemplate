include("${CMAKE_SOURCE_DIR}/FindAllSourceFiles.cmake")
include("${CMAKE_SOURCE_DIR}/ComposeFileBySourceGroup.cmake")


# brief: creates suit tests
# param: i_targetTestFile - target file for new suit-test
function(AddSuitTest i_targetTestFile)
    message("[add suit-test: ${i_targetTestFile}] begin")
    
    # place the suit-tests in target VS-filter
    get_filename_component(fileDir "${i_targetTestFile}" DIRECTORY)
    string(REPLACE "${CMAKE_CURRENT_SOURCE_DIR}/suit-tests/" "" suitTestGroupe "${fileDir}")
    string(REPLACE "/" "-" suitTestPrefix "${suitTestGroupe}")

    get_filename_component(fileName ${i_targetTestFile} NAME_WE)
    
    set(suitTestExeName ${suitTestPrefix}-${fileName})
    
    add_executable(${suitTestExeName} ${i_targetTestFile} "test-main.cpp")
    
    target_link_libraries(${suitTestExeName}
        GTest::gtest_main
        GTest::gmock_main
        ${TASKS_LIB_NAME}
    )
    
    set_target_properties(${suitTestExeName} PROPERTIES
        # choose C++ language
        LINKER_LANGUAGE CXX
        # choose target C++ standart
        CXX_STANDARD ${TASKS_LIB_CXX_STANDART}
        # define the filter in VS-solution
        FOLDER "Tests/SuitTests/${suitTestGroupe}"
    )
    
    message("[add suit-test: ${i_targetTestFile}] end")
endfunction(AddSuitTest)


# brief: creates suit tests
# note1: one suit test is creates from one code file and presents as unique project
function(AddSuitTests)
    message("[AddSuitTests] begin")

    file(GLOB_RECURSE sources_list "${CMAKE_CURRENT_SOURCE_DIR}/suit-tests/*")
    foreach(source ${sources_list})
        if(NOT IS_DIRECTORY ${source})
            AddSuitTest(${source})
        endif()
    endforeach()

    message("[AddSuitTests] end")
endfunction(AddSuitTests)
