include("${CMAKE_SOURCE_DIR}/FindAllSourceFiles.cmake")
include("${CMAKE_SOURCE_DIR}/ComposeFileBySourceGroup.cmake")

# brief: creates unit tests as one test project
function(AddUnitTests)
    # find all source files for unit-tests
    set(listAvalibleFilesTemplates "test-unit.+\\.h" "test-unit.+\\.hpp" "test-unit-.+\\.cpp")
    FindAllSourceFiles("Find all files for unit-tests" "${CMAKE_CURRENT_SOURCE_DIR}" "" "${listAvalibleFilesTemplates}" listTargetSourceUnitTestsFiles)

    # find all base files for tests
    set(listAvalibleFilesTemplates "test-common.hpp" "test-main.cpp")
    FindAllSourceFiles("Find base files for tests" "${CMAKE_CURRENT_SOURCE_DIR}" "" "${listAvalibleFilesTemplates}" listTargetTestsFiles)

    # compose all founded files by directory
    ComposeFileBySourceGroup("${CMAKE_CURRENT_SOURCE_DIR}" "${listTargetSourceUnitTestsFiles}")
    ComposeFileBySourceGroup("${CMAKE_CURRENT_SOURCE_DIR}" "${listTargetTestsFiles}")

    set(unitTestsExeName ${LIB_NAME}-unit-tests)
    add_executable(${unitTestsExeName} ${listTargetSourceUnitTestsFiles} ${listTargetTestsFiles})
    target_compile_features(${unitTestsExeName} PRIVATE ${PROJECT_CPP_STANDART})
    target_link_libraries(${unitTestsExeName} GTest::gtest_main)
    target_link_libraries(${unitTestsExeName} GTest::gmock_main)
    target_link_libraries(${unitTestsExeName} Boost::coroutine)
    target_link_libraries(${unitTestsExeName} ${LIB_NAME})
    set_target_properties(${unitTestsExeName} PROPERTIES FOLDER "Tests")
endfunction(AddUnitTests)
