
set(app_name cxx_app)
message("App name: " ${app_name})

add_subdirectory(common)

add_executable (${app_name} main.cpp)
target_link_libraries(${app_name} common)

if(VALGRIND_EXECUTABLE)
    add_valgrind_check(${app_name})
endif()