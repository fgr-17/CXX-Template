/**
 * @file common.cpp
 * @author author (author@domain.com)
 * @brief basic internal common lib for cmake usage
 * @version 0.1
 * @date 2022-12-24
 */

#include <common.h>

#include <iostream>

int Common::talk() {
    std::cout << "hello!" << std::endl;
    return 0;
}

int Common::add(int a, int b) {
    return a + b;
}
