#include <stdio.h>

extern int m1_test(void);
extern int m2_test(void);

void ut_all(void)
{
    int num_fail = 0;
    num_fail = m1_test();
    num_fail = m2_test();
    printf("%s , UT fail: %d\n",__func__, num_fail);
}

int main(void)
{
    ut_all();
    return 0;
}
