cmake_minimum_required(VERSION 3.21) 

include(FetchContent)

# brief: add Boost to current project
function(AddBoost)
    message("[AddBoost] begin")

    set(BOOST_ENABLE_CMAKE ON)
    FetchContent_Declare(
        build_boost
        GIT_REPOSITORY https://github.com/boostorg/boost.git
        GIT_TAG boost-1.80.0
        GIT_PROGRESS true
    )

    FetchContent_MakeAvailable(build_boost)

    set_target_properties(boost_atomic PROPERTIES FOLDER "External/Boost")
    set_target_properties(boost_coroutine PROPERTIES FOLDER "External/Boost")
    set_target_properties(boost_chrono PROPERTIES FOLDER "External/Boost")
    set_target_properties(boost_container PROPERTIES FOLDER "External/Boost")
    set_target_properties(boost_context PROPERTIES FOLDER "External/Boost")
    set_target_properties(boost_contract PROPERTIES FOLDER "External/Boost")
    set_target_properties(boost_date_time PROPERTIES FOLDER "External/Boost")
    set_target_properties(boost_exception PROPERTIES FOLDER "External/Boost")
    set_target_properties(boost_fiber PROPERTIES FOLDER "External/Boost")
    set_target_properties(boost_fiber_numa PROPERTIES FOLDER "External/Boost")
    set_target_properties(boost_filesystem PROPERTIES FOLDER "External/Boost")
    set_target_properties(boost_graph PROPERTIES FOLDER "External/Boost")
    set_target_properties(boost_iostreams PROPERTIES FOLDER "External/Boost")
    set_target_properties(boost_json PROPERTIES FOLDER "External/Boost")
    set_target_properties(boost_locale PROPERTIES FOLDER "External/Boost")
    set_target_properties(boost_nowide PROPERTIES FOLDER "External/Boost")
    set_target_properties(boost_prg_exec_monitor PROPERTIES FOLDER "External/Boost")
    set_target_properties(boost_test_exec_monitor PROPERTIES FOLDER "External/Boost")
    set_target_properties(boost_program_options PROPERTIES FOLDER "External/Boost")
    set_target_properties(boost_random PROPERTIES FOLDER "External/Boost")
    set_target_properties(boost_serialization PROPERTIES FOLDER "External/Boost")
    set_target_properties(boost_stacktrace_basic PROPERTIES FOLDER "External/Boost")
    set_target_properties(boost_stacktrace_noop PROPERTIES FOLDER "External/Boost")
    set_target_properties(boost_stacktrace_windbg PROPERTIES FOLDER "External/Boost")
    set_target_properties(boost_stacktrace_windbg_cached PROPERTIES FOLDER "External/Boost")
    set_target_properties(boost_thread PROPERTIES FOLDER "External/Boost")
    set_target_properties(boost_timer PROPERTIES FOLDER "External/Boost")
    set_target_properties(boost_type_erasure PROPERTIES FOLDER "External/Boost")
    set_target_properties(boost_unit_test_framework PROPERTIES FOLDER "External/Boost")
    set_target_properties(boost_wave PROPERTIES FOLDER "External/Boost")
    set_target_properties(boost_wserialization PROPERTIES FOLDER "External/Boost")
    set_target_properties(boost_log PROPERTIES FOLDER "External/Boost")
    set_target_properties(boost_log_setup PROPERTIES FOLDER "External/Boost")

    message("[AddBoost] end")
endfunction(AddBoost)
