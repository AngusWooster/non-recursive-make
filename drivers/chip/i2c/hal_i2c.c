#include "common.h"

#ifndef UNIT_TEST
/* This is for unit test demo */
bool hal_i2c_read(uint16_t addr, uint8_t *data, uint8_t len)
{
    int cnt;
    printf("%s\n",__func__);

    for (cnt=0; cnt<len; cnt++) {
        *data = 1;
    }
    return true;
}

bool hal_i2c_write(uint16_t addr,const uint8_t *data, uint8_t len)
{
    printf("%s\n",__func__);
    return true;
}
#endif