#include "common.h"

#include "sensor.h"
#include "math.h"

#define PROJECT_NAME "example_1"
extern void task1(void);

int main(void)
{
    printf("%s\n",PROJECT_NAME);
    task1();

    return 0;
}