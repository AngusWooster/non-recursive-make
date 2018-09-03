#include <stdio.h>

#define MODULE_NAME "M2_TEST_MODULE"
extern void a2(char* str);

int m2_test(void)
{
    a2(MODULE_NAME);
    printf("m2 test\n");
    return 0;
}
