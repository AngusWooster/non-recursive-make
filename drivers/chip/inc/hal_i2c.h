#ifndef __HAL_I2C_H__
#define __HAL_I2C_H__

bool hal_i2c_read(uint16_t addr, uint8_t *data, uint8_t len);
bool hal_i2c_write(uint16_t addr,const uint8_t *data, uint8_t len);

#endif