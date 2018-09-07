#include "common.h"

#include "platform.h"
#include "ut.h"
#include "sensor.h"

DEFINE_FFF_GLOBALS;

FAKE_VALUE_FUNC(bool, hal_i2c_read, uint16_t, uint8_t *, uint8_t);
FAKE_VALUE_FUNC(bool, hal_i2c_write, uint16_t, const uint8_t *, uint8_t);

void setup(void) {
	RESET_FAKE(hal_i2c_read);
	RESET_FAKE(hal_i2c_write);
	FFF_RESET_HISTORY();
}

void teardown(void) {
	/* Nothing */
}


MU_TEST(test_sensor_init_failure) {
	hal_i2c_read_fake.return_val = 0xff;
	int ret = init_sensor();
	mu_check(1 == hal_i2c_read_fake.call_count);
	mu_assert(SUCCESS == ret, "Init failed");
}


MU_TEST_SUITE(sensor_test_suite) {
	MU_SUITE_CONFIGURE(&setup, &teardown);
    MU_RUN_TEST(test_sensor_init_failure);
}


int m1_test(void)
{
    printf("m1 test\n");
	MU_RUN_SUITE(sensor_test_suite);
	MU_REPORT();    
    return MU_FAIL_NUM();
}
