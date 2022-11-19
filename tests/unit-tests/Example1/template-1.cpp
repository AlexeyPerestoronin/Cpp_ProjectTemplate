#include <TasksLib/default.hpp>

#include <gtest/gtest.h>

TEST(TwiceTest, Test1) {
    ASSERT_EQ(twice(5), 10);
}
