cmake_minimum_required(VERSION 3.14)

include(FetchContent)

# brief: add Google tests to current test-project
# note1: the google tests project downloads from its git-repository and builds before building the test-project
# note2: if google tests has been download and build early it not be do again
function(AddGoogleTests)
    FetchContent_Declare(
        googletest
        GIT_REPOSITORY https://github.com/google/googletest.git
        GIT_TAG release-1.12.1
    )

    # For Windows: Prevent overriding the parent project's compiler/linker settings
    set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)

    FetchContent_MakeAvailable(googletest)
endfunction(AddGoogleTests)