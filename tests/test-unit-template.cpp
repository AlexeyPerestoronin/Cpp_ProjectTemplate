#include <gtest/gtest.h>

TEST(SomeTest, TestTest) {
    ASSERT_TRUE(false);
}

int main(int argc, char *argv[]) {
  ::testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}