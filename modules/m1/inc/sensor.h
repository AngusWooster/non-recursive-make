#ifndef __SENSOR_H__
#define __SENSOR_H__

/* sensor configuration details */
#define SENSOR_ID 0xa5
#define SENSOR_ENABLE 0x01
/* sensor register table */
#define SENSOR_OUTPUT_REG 0x0001
#define SENSOR_INPUT_REG  0X0002
#define SENSOR_INIT_REG 0x0003
#define SENSOR_ID_REG 0x0004


/* sensor functions */
void m1(void);
int init_sensor(void);
uint8_t sensor_get_val(void);

#endif