include("${CMAKE_SOURCE_DIR}/FindAllSourceFiles.cmake")
include("${CMAKE_SOURCE_DIR}/ComposeFileBySourceGroup.cmake")

# brief: creates unit tests as one test project
function(AddUnitTests)
    message("[AddUnitTests] begin")

    # find all source files for unit-tests
    set(listAvalibleFilesTemplates ".+\\.h" ".+\\.hpp" ".+\\.cpp")
    FindAllSourceFiles("Find all files for unit-tests" "${CMAKE_CURRENT_SOURCE_DIR}/unit-tests" "" "${listAvalibleFilesTemplates}" listTargetSourceUnitTestsFiles)
    ComposeFileBySourceGroup("${CMAKE_CURRENT_SOURCE_DIR}/unit-tests" "${listTargetSourceUnitTestsFiles}")

    set(unitTestsExeName ${TASKS_LIB_NAME}-unit-tests)
    add_executable(${unitTestsExeName} ${listTargetSourceUnitTestsFiles} "test-main.cpp")
    set_property(TARGET ${unitTestsExeName} PROPERTY CXX_STANDARD ${TASKS_LIB_CXX_STANDART})
    target_link_libraries(${unitTestsExeName} GTest::gtest_main)
    target_link_libraries(${unitTestsExeName} GTest::gmock_main)
    target_link_libraries(${unitTestsExeName} ${TASKS_LIB_NAME})
    set_target_properties(${unitTestsExeName} PROPERTIES FOLDER "Tests/UnitTests")

    message("[AddUnitTests] end")
endfunction(AddUnitTests)
