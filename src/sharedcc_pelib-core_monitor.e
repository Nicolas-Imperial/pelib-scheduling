# 1 "monitor.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "monitor.c"
# 21 "monitor.c"
# 1 "../include/pelib/monitor.h" 1
# 24 "../include/pelib/monitor.h"
unsigned long long int
rdtsc();
# 22 "monitor.c" 2
# 35 "monitor.c"
inline
unsigned long long int
rdtsc()
{
  unsigned hi, lo;
  __asm__ __volatile__ ("rdtsc" : "=a"(lo), "=d"(hi));
  return ( (unsigned long long)lo)|( ((unsigned long long)hi)<<32 );
}
