#include <stdio.h>

int putxval(unsigned long value, int column)
{
    char buf[9] = {0};
    unsigned int i=sizeof(unsigned long)*8;
    unsigned int j;
    unsigned int shiftWidth = sizeof(unsigned long)*8-4;
    unsigned long mask = 0xFul<<shiftWidth;
    
    buf[0] = '\0';
    
    for (; i>0; i-=4, value<<=4) {
        if (mask & value) {
            break;
        }
    }
    
    for (j=0; i>0; i-=4, value<<=4, j++) {
        buf[j] = "0123456789abcdef"[(mask & value)>>shiftWidth];
    }
    
    puts(buf);

    return 0;
}

int main ()
{
    putxval(16, 0);
}
