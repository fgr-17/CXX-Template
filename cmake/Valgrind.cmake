find_program(VALGRIND_EXECUTABLE NAMES valgrind)

set(VALGRIND_SUPPRESSIONS_FILE
    "${CMAKE_SOURCE_DIR}/cmake/valgrind.supp"
    CACHE FILEPATH "Valgrind suppressions file")

set(VALGRIND_OPTIONS
    --error-exitcode=1
    --leak-check=full
    --show-leak-kinds=all
    --track-origins=yes
)

if(EXISTS "${VALGRIND_SUPPRESSIONS_FILE}")
    list(APPEND VALGRIND_OPTIONS --suppressions=${VALGRIND_SUPPRESSIONS_FILE})
endif()

function(add_valgrind_check target)
    if(NOT VALGRIND_EXECUTABLE)
        return()
    endif()

    set(test_name "valgrind_${target}")
    add_test(
        NAME ${test_name}
        COMMAND ${VALGRIND_EXECUTABLE} ${VALGRIND_OPTIONS} $<TARGET_FILE:${target}>
    )
    set_tests_properties(${test_name} PROPERTIES LABELS "valgrind")
endfunction()
