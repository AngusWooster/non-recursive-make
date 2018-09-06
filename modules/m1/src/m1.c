#include <stdio.h>
#include "m1.h"
#include "a1.h"
#include "b1.h"

void m1(void)

{
    int v;
    printf("%s , %s\n",__func__, M1_NAME);
    v = a1_get_val();
    v += b1_get_val();
    printf("%s , val = %d\n",__func__, v);
}