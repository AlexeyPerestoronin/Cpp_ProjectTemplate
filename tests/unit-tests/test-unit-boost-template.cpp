#include "tests/test-common.hpp"

#include "src/default.hpp"

// #include <boost/coroutine/coroutine.hpp>

TEST(CorutineTesting, Test1) {
    // using ac_int = boost::coroutines::asymmetric_coroutine<int>;

    // ac_int::pull_type source([&](ac_int::push_type& sink) {
    //     sink(10);
    //     sink(20);
    //     sink(30);
    // });

    // ASSERT_EQ(source.get(), 10);
    // ASSERT_EQ(source().get(), 20);
    // ASSERT_EQ(source().get(), 30);
}
