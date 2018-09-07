#include "common.h"
#include "math.h"

void m2(void)
{
    printf("%s , %s\n",__func__, M2_NAME);
}

bool m2_isPrime(int n)
{
    int cnt;
    if (n <= 1) {
        return false;
    } else {
        cnt = 2;
        for (; cnt*cnt <= n; cnt++) {
            if (n % cnt == 0)
                return false;
        }
    }
    return true;
}