#include "common.h"

#include "platform.h"
#include "sensor.h"
#include "hal_i2c.h"


#define M1_NAME "MODULE 1"

void m1(void)
{
    printf("%s , %s\n",__func__, M1_NAME);
}

uint8_t sensor_get_val(void)
{
	uint8_t val = 0;
	hal_i2c_read(SENSOR_OUTPUT_REG, &val, 1);
	return val;
}


int init_sensor(void)
{
	uint8_t sensor_id;
	hal_i2c_read(SENSOR_ID_REG, &sensor_id, 1);

	if (sensor_id == SENSOR_ID) {
		uint8_t val = SENSOR_ENABLE;
		hal_i2c_write(SENSOR_INIT_REG, &val, 1); //Enable Sensor
		return SUCCESS;
	}
	return FAILURE;
}