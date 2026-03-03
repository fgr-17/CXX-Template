/**
 * @file main_test.cpp
 * @brief Test file for CXX Template project
 * @author rouxfederico@gmail.com
 */

#include <common.h>
#include <gtest/gtest.h>  // NOLINT

/**
 * @brief Test case for Common::add function
 */
TEST(CommonTest, AddTest) {
    Common c;
    EXPECT_EQ(c.add(2, 3), 5);
    EXPECT_EQ(c.add(0, 0), 0);
    EXPECT_EQ(c.add(-1, 1), 0);
    EXPECT_EQ(c.add(10, -5), 5);
}

/**
 * @brief Test case for Common::talk function
 */
TEST(CommonTest, TalkTest) {
    Common c;
    EXPECT_EQ(c.talk(), 0);
}

/**
 * @brief Test case for Common object creation
 */
TEST(CommonTest, ConstructorTest) {
    Common c;
    SUCCEED();
}
