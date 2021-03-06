#include "defines.h"
#include "serial.h"
#include "lib.h"

int putc(char c)
{
    if (c == '\n') {
        serial_send_byte(SERIAL_DEFAULT_DEVICE, '\r');
    }
    
    return serial_send_byte(SERIAL_DEFAULT_DEVICE, c);
}

int puts(char* str)
{
    while (*str) {
        putc(*(str++));
    }
    
    return 0;
}


void *memset (void* ptr, int c, long len)
{
    char* p = ptr; 
    for (; len>0;  len--) {
        *(p++) = c; 
    }
    return ptr;
}

void *memcpy (void* dst, const void* src, long len)
{
    char* d = dst;
    const char* s = src;
    for (; len>0; len--) {
        *(d++) = *(s++);
    }
    return dst;
}

int memcmp (const void* s1, const void* s2, long len)
{
    const char* p1 = s1;
    const char* p2 = s2;
    for (; len > 0; len--) {
        if (*(p1++) != *(p2++)) {
            return (*p1 < *p2) ? 1 : -1;
        }
    }
    return 0;
}

int strlen (const char* ptr)
{
    int cnt = 0;
    while ('\0' != *(ptr++)) {
        cnt++;
    }
    return cnt;
}

char* strcpy (char* dst, char* src)
{
    char* d = dst;
    char* s = src;
    
    for (; '\0'!=*d && '\0'!=*s; d++, s++) {
        *d = *s;
    }
    
    return dst;
}

int strcmp (const char* s1, const char* s2)
{
    for (; '\0'!=*s1 && '\0'!=*s2; s1++, s2++) {
         if (*s1 != *s2) {
            return (*s1 < *s2) ? 1 : -1;
        }
    }
    return 0;
}

int strncmp (const char* s1, const char* s2, int len)
{
    for (; '\0'!=*s1 && '\0'!=*s2 && len>0; s1++, s2++, len--) {
         if (*s1 != *s2) {
            return (*s1 < *s2) ? 1 : -1;
        }
    }
    return 0;
}

int putxval(unsigned long value, int column)
{
    char buf[9];
    char *p;

    p = buf + sizeof(buf) - 1;
    *(p--) = '\0';

    if (!value && !column) {
        column++;
    }

    while (value || column) {
        *(p--) = "0123456789abcdef"[value & 0xf];
        value >>=4;
        if (column) column--;
    }

    puts(p+1);

    return 0;
}


