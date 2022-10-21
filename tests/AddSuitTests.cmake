include("${CMAKE_SOURCE_DIR}/FindAllSourceFiles.cmake")
include("${CMAKE_SOURCE_DIR}/ComposeFileBySourceGroup.cmake")

# brief: creates suit tests
# note1: one suit test is creates from one code file and presents as unique project
function(AddSuitTests)
    message("[AddSuitTests] begin")

    # find all source files for suit-tests
    set(listAvalibleFilesTemplates "test-suit.+\\.h" "test-suit.+\\.hpp" "test-suit-.+\\.cpp")
    FindAllSourceFiles("Find all files for suit-tests" "${CMAKE_CURRENT_SOURCE_DIR}" "" "${listAvalibleFilesTemplates}" listTargetSourceSuitTestsFiles)

    # find all base files for tests
    set(listAvalibleFilesTemplates "test-common.hpp" "test-main.cpp")
    FindAllSourceFiles("Find base files for tests" "${CMAKE_CURRENT_SOURCE_DIR}" "" "${listAvalibleFilesTemplates}" listTargetTestsFiles)

    # compose all founded files by directory
    ComposeFileBySourceGroup("${CMAKE_CURRENT_SOURCE_DIR}" "${listTargetSourceSuitTestsFiles}")
    ComposeFileBySourceGroup("${CMAKE_CURRENT_SOURCE_DIR}" "${listTargetTestsFiles}")

    foreach(oneSuitTestFile ${listTargetSourceSuitTestsFiles})
        get_filename_component(suitTestFileName ${oneSuitTestFile} NAME_WE)
        set(suitTestExeName ${LIB_NAME}-${suitTestFileName})
        add_executable(${suitTestExeName} ${oneSuitTestFile} ${listTargetTestsFiles})
        target_compile_features(${suitTestExeName} PRIVATE ${PROJECT_CPP_STANDART})
        target_link_libraries(${suitTestExeName} GTest::gtest_main)
        target_link_libraries(${suitTestExeName} GTest::gmock_main)
        target_link_libraries(${suitTestExeName} Boost::coroutine)
        target_link_libraries(${suitTestExeName} ${LIB_NAME})
        set_target_properties(${suitTestExeName} PROPERTIES FOLDER "Tests")
    endforeach()

    message("[AddSuitTests] end")
endfunction(AddSuitTests)
