cmake_minimum_required(VERSION 3.14)

include(FetchContent)

# brief: add Google tests to current project
function(AddGoogleTests)
    message("[AddGoogleTests] begin")

    FetchContent_Declare(
        googletest
        GIT_REPOSITORY https://github.com/google/googletest.git
        GIT_TAG release-1.12.1
        GIT_PROGRESS true
    )

    # For Windows: Prevent overriding the parent project's compiler/linker settings
    set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)

    FetchContent_MakeAvailable(googletest)

    set_target_properties(gmock PROPERTIES FOLDER "External/GTests")
    set_target_properties(gmock_main PROPERTIES FOLDER "External/GTests")
    set_target_properties(gtest PROPERTIES FOLDER "External/GTests")
    set_target_properties(gtest_main PROPERTIES FOLDER "External/GTests")

    message("[AddGoogleTests] end")
endfunction(AddGoogleTests)
