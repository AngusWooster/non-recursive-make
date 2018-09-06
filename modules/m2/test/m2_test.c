#include <stdio.h>
#include <stdbool.h>
#include "ut.h"
#include "m2.h"

#define MODULE_NAME "M2_TEST_MODULE"

static int m2_test_v1 = 0;


int m2_test_v2 = 0;
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
    printf("m2 test, UT_VERSION(%d)\n",UT_VERSION);
    MU_RUN_SUITE(calculation_suite);
    MU_REPORT();

    return 0;
}