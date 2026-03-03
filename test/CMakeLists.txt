cmake_minimum_required(VERSION 3.18)

include(FetchContent)
FetchContent_Declare(
  googletest
  GIT_REPOSITORY https://github.com/google/googletest.git
  GIT_TAG        v1.14.0
)
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)

foreach(target IN ITEMS gtest gtest_main gmock gmock_main)
    if(TARGET ${target})
        set_target_properties(${target} PROPERTIES 
        CXX_CLANG_TIDY ""
        CXX_INCLUDE_WHAT_YOU_USE "")
    endif()
endforeach()

add_executable(test_runner main_test.cpp)

target_link_libraries(test_runner 
    PRIVATE 
    common
    GTest::gtest
    GTest::gtest_main
)

target_include_directories(test_runner PRIVATE 
    ${CMAKE_SOURCE_DIR}/src/common
)

set_target_properties(test_runner PROPERTIES
    CXX_CLANG_TIDY ""
    CXX_INCLUDE_WHAT_YOU_USE ""
)

add_test(NAME CXX_Template_Tests COMMAND $<TARGET_FILE:test_runner>)