#include <stdio.h>
#include "m1.h"
#include "m2.h"

#define PROJECT_NAME "example_1"

int main(void)
{
    printf("%s\n",PROJECT_NAME);
    m1();
    m2();
    return 0;
}