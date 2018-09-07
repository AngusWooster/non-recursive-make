#include "common.h"
#include "ut.h"
#include "math.h"

#define MODULE_NAME "M2_TEST_MODULE"


void test_setup(void) {
    //printf("%s, %s\n",MODULE_NAME, __func__);
}

void test_teardown(void) {
	//printf("%s, %s\n",MODULE_NAME, __func__);
}

MU_TEST(test_check_nagetive_value) {
	bool ret = m2_isPrime(-1);
	mu_check(ret == false);
}

MU_TEST(test_check_prime_value) {
	bool ret = m2_isPrime(11);
	mu_check(ret == true);
}

MU_TEST(test_check_non_prime_value) {
	bool ret = m2_isPrime(6);
	mu_check(ret == false);
}

MU_TEST_SUITE(calculation_suite) {
	MU_SUITE_CONFIGURE(&test_setup, &test_teardown);
	MU_RUN_TEST(test_check_nagetive_value);
    MU_RUN_TEST(test_check_prime_value);
    MU_RUN_TEST(test_check_non_prime_value);
}

int m2_test(void)
{
    printf("m2 test\n");
    MU_RUN_SUITE(calculation_suite);
    MU_REPORT();

    return MU_FAIL_NUM();
}