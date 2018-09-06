#include <stdio.h>
#include "m1.h"
#include "m2.h"

#define PROJECT_NAME "example_1"
extern void p1_a(void);

int main(void)
{
    printf("%s\n",PROJECT_NAME);
    p1_a();
    
    m1();
    m2();
    return 0;
}