#ifndef _LIB_H_INCLUDE_
#define _LIB_H_INCLUDE_

int putc (char c);
int puts (char* str);

void *memset (void* ptr, int c, long len);
void *memcpy (void* dst, const void* src, long len);
int memcmp (const void* b1, const void* b2, long len);

int strlen (const char* ptr);
char* strcpy (char* dst, char* src);
int strcmp (const char* s1, const char* s2);
int strncmp (const char* s1, const char* s2, int len);

int putxval(unsigned long value, int column);

#endif // _LIB_H_INCLUDE_
