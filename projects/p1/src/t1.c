#include "common.h"
#include "sensor.h"
#include "math.h"

void task1(void)
{
    int val;
    printf("%s :\n",__func__);

    m1();
    m2();

    init_sensor();
    val = sensor_get_val();
    if (m2_isPrime(val))
        printf("val(%d) , is prime.\n",val);
    else
        printf("val(%d) , isn't prime.\n",val);
}