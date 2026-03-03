cmake_minimum_required(VERSION 3.18)

project(CXX_PROJECT)

enable_language(CXX)
set(CMAKE_CXX_STANDARD 20 CACHE STRING "C++ standard required for build")
set(CMAKE_CXX_STANDARD_REQUIRED ON CACHE BOOL "is C++ stndard a requirement")
set(CMAKE_CXX_EXTENSIONS OFF CACHE BOOL "enable/disable compiler specific extensions")
set(CMAKE_POSITION_INDEPENDENT_CODE ON)
set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -W -Wall -Wextra -Werror")


set(CMAKE_CXX_CLANG_TIDY "clang-tidy")
set(CMAKE_CXX_CLANG_FORMAT "clang-format")
set(CMAKE_CXX_INCLUDE_WHAT_YOU_USE "iwyu")

set(SRC_DIR src)
set(TEST_DIR test)

file(GLOB_RECURSE ALL_SOURCE_FILES 
    ${CMAKE_SOURCE_DIR}/${SRC_DIR}/*.cpp 
    ${CMAKE_SOURCE_DIR}/${SRC_DIR}/*.c
    ${CMAKE_SOURCE_DIR}/${SRC_DIR}/*.h
    ${CMAKE_SOURCE_DIR}/${TEST_DIR}/*.cpp
    ${CMAKE_SOURCE_DIR}/${TEST_DIR}/*.c
    ${CMAKE_SOURCE_DIR}/${TEST_DIR}/*.h
)

add_custom_target(fix
    COMMAND clang-format -i ${ALL_SOURCE_FILES}
    COMMENT "Running clang-format to fix formatting..."
)

# Enable testing (must be called before add_subdirectory for test)
enable_testing()

add_subdirectory(src)
add_subdirectory(test)

add_dependencies(test_runner fix)