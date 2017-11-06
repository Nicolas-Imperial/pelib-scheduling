# 1 "const_string.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "const_string.c"
# 24 "const_string.c"
# 1 "/usr/include/stdlib.h" 1 3 4
# 25 "/usr/include/stdlib.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h" 1 3 4
# 33 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h" 3 4
# 1 "/usr/include/features.h" 1 3 4
# 419 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 1 3 4
# 419 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 420 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/long-double.h" 1 3 4
# 421 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 2 3 4
# 420 "/usr/include/features.h" 2 3 4
# 443 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 1 3 4
# 10 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs-64.h" 1 3 4
# 11 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 2 3 4
# 444 "/usr/include/features.h" 2 3 4
# 34 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h" 2 3 4
# 26 "/usr/include/stdlib.h" 2 3 4





# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h" 1 3 4
# 216 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h" 3 4

# 216 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h" 3 4
typedef long unsigned int size_t;
# 328 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h" 3 4
typedef int wchar_t;
# 32 "/usr/include/stdlib.h" 2 3 4







# 1 "/usr/include/x86_64-linux-gnu/bits/waitflags.h" 1 3 4
# 52 "/usr/include/x86_64-linux-gnu/bits/waitflags.h" 3 4
typedef enum
{
  P_ALL,
  P_PID,
  P_PGID
} idtype_t;
# 40 "/usr/include/stdlib.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h" 1 3 4
# 41 "/usr/include/stdlib.h" 2 3 4
# 55 "/usr/include/stdlib.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/floatn.h" 1 3 4
# 56 "/usr/include/stdlib.h" 2 3 4


typedef struct
  {
    int quot;
    int rem;
  } div_t;



typedef struct
  {
    long int quot;
    long int rem;
  } ldiv_t;





__extension__ typedef struct
  {
    long long int quot;
    long long int rem;
  } lldiv_t;
# 97 "/usr/include/stdlib.h" 3 4
extern size_t __ctype_get_mb_cur_max (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));



extern double atof (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));

extern int atoi (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));

extern long int atol (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));



__extension__ extern long long int atoll (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));



extern double strtod (const char *__restrict __nptr,
        char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern float strtof (const char *__restrict __nptr,
       char **__restrict __endptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

extern long double strtold (const char *__restrict __nptr,
       char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 139 "/usr/include/stdlib.h" 3 4
extern long int strtol (const char *__restrict __nptr,
   char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

extern unsigned long int strtoul (const char *__restrict __nptr,
      char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



__extension__
extern long long int strtoq (const char *__restrict __nptr,
        char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

__extension__
extern unsigned long long int strtouq (const char *__restrict __nptr,
           char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));




__extension__
extern long long int strtoll (const char *__restrict __nptr,
         char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

__extension__
extern unsigned long long int strtoull (const char *__restrict __nptr,
     char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 245 "/usr/include/stdlib.h" 3 4
extern __inline __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ , __leaf__)) atoi (const char *__nptr)
{
  return (int) strtol (__nptr, (char **) ((void *)0), 10);
}
extern __inline __attribute__ ((__gnu_inline__)) long int
__attribute__ ((__nothrow__ , __leaf__)) atol (const char *__nptr)
{
  return strtol (__nptr, (char **) ((void *)0), 10);
}


__extension__ extern __inline __attribute__ ((__gnu_inline__)) long long int
__attribute__ ((__nothrow__ , __leaf__)) atoll (const char *__nptr)
{
  return strtoll (__nptr, (char **) ((void *)0), 10);
}
# 270 "/usr/include/stdlib.h" 3 4
extern char *l64a (long int __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));


extern long int a64l (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));




# 1 "/usr/include/x86_64-linux-gnu/sys/types.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/types.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/bits/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 28 "/usr/include/x86_64-linux-gnu/bits/types.h" 2 3 4


typedef unsigned char __u_char;
typedef unsigned short int __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;


typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short int __int16_t;
typedef unsigned short int __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;

typedef signed long int __int64_t;
typedef unsigned long int __uint64_t;







typedef long int __quad_t;
typedef unsigned long int __u_quad_t;







typedef long int __intmax_t;
typedef unsigned long int __uintmax_t;
# 130 "/usr/include/x86_64-linux-gnu/bits/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/typesizes.h" 1 3 4
# 131 "/usr/include/x86_64-linux-gnu/bits/types.h" 2 3 4


typedef unsigned long int __dev_t;
typedef unsigned int __uid_t;
typedef unsigned int __gid_t;
typedef unsigned long int __ino_t;
typedef unsigned long int __ino64_t;
typedef unsigned int __mode_t;
typedef unsigned long int __nlink_t;
typedef long int __off_t;
typedef long int __off64_t;
typedef int __pid_t;
typedef struct { int __val[2]; } __fsid_t;
typedef long int __clock_t;
typedef unsigned long int __rlim_t;
typedef unsigned long int __rlim64_t;
typedef unsigned int __id_t;
typedef long int __time_t;
typedef unsigned int __useconds_t;
typedef long int __suseconds_t;

typedef int __daddr_t;
typedef int __key_t;


typedef int __clockid_t;


typedef void * __timer_t;


typedef long int __blksize_t;




typedef long int __blkcnt_t;
typedef long int __blkcnt64_t;


typedef unsigned long int __fsblkcnt_t;
typedef unsigned long int __fsblkcnt64_t;


typedef unsigned long int __fsfilcnt_t;
typedef unsigned long int __fsfilcnt64_t;


typedef long int __fsword_t;

typedef long int __ssize_t;


typedef long int __syscall_slong_t;

typedef unsigned long int __syscall_ulong_t;



typedef __off64_t __loff_t;
typedef __quad_t *__qaddr_t;
typedef char *__caddr_t;


typedef long int __intptr_t;


typedef unsigned int __socklen_t;




typedef int __sig_atomic_t;
# 30 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4



typedef __u_char u_char;
typedef __u_short u_short;
typedef __u_int u_int;
typedef __u_long u_long;
typedef __quad_t quad_t;
typedef __u_quad_t u_quad_t;
typedef __fsid_t fsid_t;




typedef __loff_t loff_t;



typedef __ino_t ino_t;
# 60 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
typedef __dev_t dev_t;




typedef __gid_t gid_t;




typedef __mode_t mode_t;




typedef __nlink_t nlink_t;




typedef __uid_t uid_t;





typedef __off_t off_t;
# 98 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
typedef __pid_t pid_t;





typedef __id_t id_t;




typedef __ssize_t ssize_t;





typedef __daddr_t daddr_t;
typedef __caddr_t caddr_t;





typedef __key_t key_t;




# 1 "/usr/include/x86_64-linux-gnu/bits/types/clock_t.h" 1 3 4






typedef __clock_t clock_t;
# 128 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4

# 1 "/usr/include/x86_64-linux-gnu/bits/types/clockid_t.h" 1 3 4






typedef __clockid_t clockid_t;
# 130 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types/time_t.h" 1 3 4






typedef __time_t time_t;
# 131 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types/timer_t.h" 1 3 4






typedef __timer_t timer_t;
# 132 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4
# 145 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h" 1 3 4
# 146 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4



typedef unsigned long int ulong;
typedef unsigned short int ushort;
typedef unsigned int uint;




# 1 "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h" 3 4
typedef __int8_t int8_t;
typedef __int16_t int16_t;
typedef __int32_t int32_t;
typedef __int64_t int64_t;
# 157 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4
# 178 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
typedef unsigned int u_int8_t __attribute__ ((__mode__ (__QI__)));
typedef unsigned int u_int16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int u_int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int u_int64_t __attribute__ ((__mode__ (__DI__)));

typedef int register_t __attribute__ ((__mode__ (__word__)));
# 194 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
# 1 "/usr/include/endian.h" 1 3 4
# 36 "/usr/include/endian.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/endian.h" 1 3 4
# 37 "/usr/include/endian.h" 2 3 4
# 60 "/usr/include/endian.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 1 3 4
# 28 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 29 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 2 3 4






# 1 "/usr/include/x86_64-linux-gnu/bits/byteswap-16.h" 1 3 4
# 36 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 2 3 4
# 44 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 3 4
static __inline unsigned int
__bswap_32 (unsigned int __bsx)
{
  return __builtin_bswap32 (__bsx);
}
# 108 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 3 4
static __inline __uint64_t
__bswap_64 (__uint64_t __bsx)
{
  return __builtin_bswap64 (__bsx);
}
# 61 "/usr/include/endian.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/uintn-identity.h" 1 3 4
# 32 "/usr/include/x86_64-linux-gnu/bits/uintn-identity.h" 3 4
static __inline __uint16_t
__uint16_identity (__uint16_t __x)
{
  return __x;
}

static __inline __uint32_t
__uint32_identity (__uint32_t __x)
{
  return __x;
}

static __inline __uint64_t
__uint64_identity (__uint64_t __x)
{
  return __x;
}
# 62 "/usr/include/endian.h" 2 3 4
# 195 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/sys/select.h" 1 3 4
# 30 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/select.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/select.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 23 "/usr/include/x86_64-linux-gnu/bits/select.h" 2 3 4
# 31 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/types/sigset_t.h" 1 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/types/__sigset_t.h" 1 3 4




typedef struct
{
  unsigned long int __val[(1024 / (8 * sizeof (unsigned long int)))];
} __sigset_t;
# 5 "/usr/include/x86_64-linux-gnu/bits/types/sigset_t.h" 2 3 4


typedef __sigset_t sigset_t;
# 34 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h" 1 3 4







struct timeval
{
  __time_t tv_sec;
  __suseconds_t tv_usec;
};
# 38 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4

# 1 "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h" 1 3 4







struct timespec
{
  __time_t tv_sec;
  __syscall_slong_t tv_nsec;
};
# 40 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4



typedef __suseconds_t suseconds_t;





typedef long int __fd_mask;
# 59 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
typedef struct
  {






    __fd_mask __fds_bits[1024 / (8 * (int) sizeof (__fd_mask))];


  } fd_set;






typedef __fd_mask fd_mask;
# 91 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4

# 101 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
extern int select (int __nfds, fd_set *__restrict __readfds,
     fd_set *__restrict __writefds,
     fd_set *__restrict __exceptfds,
     struct timeval *__restrict __timeout);
# 113 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
extern int pselect (int __nfds, fd_set *__restrict __readfds,
      fd_set *__restrict __writefds,
      fd_set *__restrict __exceptfds,
      const struct timespec *__restrict __timeout,
      const __sigset_t *__restrict __sigmask);





# 1 "/usr/include/x86_64-linux-gnu/bits/select2.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/select2.h" 3 4
extern long int __fdelt_chk (long int __d);
extern long int __fdelt_warn (long int __d)
  __attribute__((__warning__ ("bit outside of fd_set selected")));
# 124 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4



# 198 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4







# 1 "/usr/include/x86_64-linux-gnu/sys/sysmacros.h" 1 3 4
# 41 "/usr/include/x86_64-linux-gnu/sys/sysmacros.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/sysmacros.h" 1 3 4
# 42 "/usr/include/x86_64-linux-gnu/sys/sysmacros.h" 2 3 4
# 71 "/usr/include/x86_64-linux-gnu/sys/sysmacros.h" 3 4


extern unsigned int gnu_dev_major (__dev_t __dev) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern unsigned int gnu_dev_minor (__dev_t __dev) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern __dev_t gnu_dev_makedev (unsigned int __major, unsigned int __minor) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



__extension__ extern __inline __attribute__ ((__gnu_inline__)) __attribute__ ((__const__)) unsigned int __attribute__ ((__nothrow__ , __leaf__)) gnu_dev_major (__dev_t __dev) { unsigned int __major; __major = ((__dev & (__dev_t) 0x00000000000fff00u) >> 8); __major |= ((__dev & (__dev_t) 0xfffff00000000000u) >> 32); return __major; }
__extension__ extern __inline __attribute__ ((__gnu_inline__)) __attribute__ ((__const__)) unsigned int __attribute__ ((__nothrow__ , __leaf__)) gnu_dev_minor (__dev_t __dev) { unsigned int __minor; __minor = ((__dev & (__dev_t) 0x00000000000000ffu) >> 0); __minor |= ((__dev & (__dev_t) 0x00000ffffff00000u) >> 12); return __minor; }
__extension__ extern __inline __attribute__ ((__gnu_inline__)) __attribute__ ((__const__)) __dev_t __attribute__ ((__nothrow__ , __leaf__)) gnu_dev_makedev (unsigned int __major, unsigned int __minor) { __dev_t __dev; __dev = (((__dev_t) (__major & 0x00000fffu)) << 8); __dev |= (((__dev_t) (__major & 0xfffff000u)) << 32); __dev |= (((__dev_t) (__minor & 0x000000ffu)) << 0); __dev |= (((__dev_t) (__minor & 0xffffff00u)) << 12); return __dev; }




# 206 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4






typedef __blksize_t blksize_t;






typedef __blkcnt_t blkcnt_t;



typedef __fsblkcnt_t fsblkcnt_t;



typedef __fsfilcnt_t fsfilcnt_t;
# 254 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 1 3 4
# 23 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h" 1 3 4
# 58 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h" 1 3 4
# 21 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h" 2 3 4
# 58 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h" 3 4
struct __pthread_rwlock_arch_t
{
  unsigned int __readers;
  unsigned int __writers;
  unsigned int __wrphase_futex;
  unsigned int __writers_futex;
  unsigned int __pad3;
  unsigned int __pad4;

  int __cur_writer;
  int __shared;
  signed char __rwelision;




  unsigned char __pad1[7];


  unsigned long int __pad2;


  unsigned int __flags;
# 92 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h" 3 4
};
# 59 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h" 2 3 4




typedef struct __pthread_internal_list
{
  struct __pthread_internal_list *__prev;
  struct __pthread_internal_list *__next;
} __pthread_list_t;
# 99 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h" 3 4
struct __pthread_mutex_s
{
  int __lock ;
  unsigned int __count;
  int __owner;

  unsigned int __nusers;



  int __kind;
 

  short __spins; short __elision;
  __pthread_list_t __list;
# 123 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h" 3 4
 
};




struct __pthread_cond_s
{
  __extension__ union
  {
    __extension__ unsigned long long int __wseq;
    struct
    {
      unsigned int __low;
      unsigned int __high;
    } __wseq32;
  };
  __extension__ union
  {
    __extension__ unsigned long long int __g1_start;
    struct
    {
      unsigned int __low;
      unsigned int __high;
    } __g1_start32;
  };
  unsigned int __g_refs[2] ;
  unsigned int __g_size[2];
  unsigned int __g1_orig_size;
  unsigned int __wrefs;
  unsigned int __g_signals[2];
};
# 24 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 2 3 4



typedef unsigned long int pthread_t;




typedef union
{
  char __size[4];
  int __align;
} pthread_mutexattr_t;




typedef union
{
  char __size[4];
  int __align;
} pthread_condattr_t;



typedef unsigned int pthread_key_t;



typedef int pthread_once_t;


union pthread_attr_t
{
  char __size[56];
  long int __align;
};

typedef union pthread_attr_t pthread_attr_t;




typedef union
{
  struct __pthread_mutex_s __data;
  char __size[40];
  long int __align;
} pthread_mutex_t;


typedef union
{
  struct __pthread_cond_s __data;
  char __size[48];
  __extension__ long long int __align;
} pthread_cond_t;





typedef union
{
  struct __pthread_rwlock_arch_t __data;
  char __size[56];
  long int __align;
} pthread_rwlock_t;

typedef union
{
  char __size[8];
  long int __align;
} pthread_rwlockattr_t;





typedef volatile int pthread_spinlock_t;




typedef union
{
  char __size[32];
  long int __align;
} pthread_barrier_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_barrierattr_t;
# 255 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4



# 280 "/usr/include/stdlib.h" 2 3 4






extern long int random (void) __attribute__ ((__nothrow__ , __leaf__));


extern void srandom (unsigned int __seed) __attribute__ ((__nothrow__ , __leaf__));





extern char *initstate (unsigned int __seed, char *__statebuf,
   size_t __statelen) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));



extern char *setstate (char *__statebuf) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));







struct random_data
  {
    int32_t *fptr;
    int32_t *rptr;
    int32_t *state;
    int rand_type;
    int rand_deg;
    int rand_sep;
    int32_t *end_ptr;
  };

extern int random_r (struct random_data *__restrict __buf,
       int32_t *__restrict __result) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern int srandom_r (unsigned int __seed, struct random_data *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));

extern int initstate_r (unsigned int __seed, char *__restrict __statebuf,
   size_t __statelen,
   struct random_data *__restrict __buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 4)));

extern int setstate_r (char *__restrict __statebuf,
         struct random_data *__restrict __buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));





extern int rand (void) __attribute__ ((__nothrow__ , __leaf__));

extern void srand (unsigned int __seed) __attribute__ ((__nothrow__ , __leaf__));



extern int rand_r (unsigned int *__seed) __attribute__ ((__nothrow__ , __leaf__));







extern double drand48 (void) __attribute__ ((__nothrow__ , __leaf__));
extern double erand48 (unsigned short int __xsubi[3]) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern long int lrand48 (void) __attribute__ ((__nothrow__ , __leaf__));
extern long int nrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern long int mrand48 (void) __attribute__ ((__nothrow__ , __leaf__));
extern long int jrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern void srand48 (long int __seedval) __attribute__ ((__nothrow__ , __leaf__));
extern unsigned short int *seed48 (unsigned short int __seed16v[3])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern void lcong48 (unsigned short int __param[7]) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





struct drand48_data
  {
    unsigned short int __x[3];
    unsigned short int __old_x[3];
    unsigned short int __c;
    unsigned short int __init;
    __extension__ unsigned long long int __a;

  };


extern int drand48_r (struct drand48_data *__restrict __buffer,
        double *__restrict __result) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int erand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        double *__restrict __result) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int lrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int nrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int mrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int jrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int srand48_r (long int __seedval, struct drand48_data *__buffer)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));

extern int seed48_r (unsigned short int __seed16v[3],
       struct drand48_data *__buffer) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern int lcong48_r (unsigned short int __param[7],
        struct drand48_data *__buffer)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));




extern void *malloc (size_t __size) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__warn_unused_result__));

extern void *calloc (size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__warn_unused_result__));






extern void *realloc (void *__ptr, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));
# 448 "/usr/include/stdlib.h" 3 4
extern void free (void *__ptr) __attribute__ ((__nothrow__ , __leaf__));


# 1 "/usr/include/alloca.h" 1 3 4
# 24 "/usr/include/alloca.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h" 1 3 4
# 25 "/usr/include/alloca.h" 2 3 4







extern void *alloca (size_t __size) __attribute__ ((__nothrow__ , __leaf__));






# 452 "/usr/include/stdlib.h" 2 3 4





extern void *valloc (size_t __size) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__warn_unused_result__));




extern int posix_memalign (void **__memptr, size_t __alignment, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));




extern void *aligned_alloc (size_t __alignment, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__alloc_size__ (2))) __attribute__ ((__warn_unused_result__));



extern void abort (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));



extern int atexit (void (*__func) (void)) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));







extern int at_quick_exit (void (*__func) (void)) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));






extern int on_exit (void (*__func) (int __status, void *__arg), void *__arg)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





extern void exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));





extern void quick_exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));





extern void _Exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));




extern char *getenv (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));
# 529 "/usr/include/stdlib.h" 3 4
extern int putenv (char *__string) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





extern int setenv (const char *__name, const char *__value, int __replace)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));


extern int unsetenv (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));






extern int clearenv (void) __attribute__ ((__nothrow__ , __leaf__));
# 557 "/usr/include/stdlib.h" 3 4
extern char *mktemp (char *__template) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 570 "/usr/include/stdlib.h" 3 4
extern int mkstemp (char *__template) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));
# 592 "/usr/include/stdlib.h" 3 4
extern int mkstemps (char *__template, int __suffixlen) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));
# 613 "/usr/include/stdlib.h" 3 4
extern char *mkdtemp (char *__template) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));
# 666 "/usr/include/stdlib.h" 3 4
extern int system (const char *__command) __attribute__ ((__warn_unused_result__));
# 682 "/usr/include/stdlib.h" 3 4
extern char *realpath (const char *__restrict __name,
         char *__restrict __resolved) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));






typedef int (*__compar_fn_t) (const void *, const void *);
# 702 "/usr/include/stdlib.h" 3 4
extern void *bsearch (const void *__key, const void *__base,
        size_t __nmemb, size_t __size, __compar_fn_t __compar)
     __attribute__ ((__nonnull__ (1, 2, 5))) __attribute__ ((__warn_unused_result__));


# 1 "/usr/include/x86_64-linux-gnu/bits/stdlib-bsearch.h" 1 3 4
# 19 "/usr/include/x86_64-linux-gnu/bits/stdlib-bsearch.h" 3 4
extern __inline __attribute__ ((__gnu_inline__)) void *
bsearch (const void *__key, const void *__base, size_t __nmemb, size_t __size,
  __compar_fn_t __compar)
{
  size_t __l, __u, __idx;
  const void *__p;
  int __comparison;

  __l = 0;
  __u = __nmemb;
  while (__l < __u)
    {
      __idx = (__l + __u) / 2;
      __p = (void *) (((const char *) __base) + (__idx * __size));
      __comparison = (*__compar) (__key, __p);
      if (__comparison < 0)
 __u = __idx;
      else if (__comparison > 0)
 __l = __idx + 1;
      else
 return (void *) __p;
    }

  return ((void *)0);
}
# 708 "/usr/include/stdlib.h" 2 3 4




extern void qsort (void *__base, size_t __nmemb, size_t __size,
     __compar_fn_t __compar) __attribute__ ((__nonnull__ (1, 4)));
# 722 "/usr/include/stdlib.h" 3 4
extern int abs (int __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) __attribute__ ((__warn_unused_result__));
extern long int labs (long int __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) __attribute__ ((__warn_unused_result__));


__extension__ extern long long int llabs (long long int __x)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) __attribute__ ((__warn_unused_result__));






extern div_t div (int __numer, int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) __attribute__ ((__warn_unused_result__));
extern ldiv_t ldiv (long int __numer, long int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) __attribute__ ((__warn_unused_result__));


__extension__ extern lldiv_t lldiv (long long int __numer,
        long long int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) __attribute__ ((__warn_unused_result__));
# 754 "/usr/include/stdlib.h" 3 4
extern char *ecvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) __attribute__ ((__warn_unused_result__));




extern char *fcvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) __attribute__ ((__warn_unused_result__));




extern char *gcvt (double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3))) __attribute__ ((__warn_unused_result__));




extern char *qecvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) __attribute__ ((__warn_unused_result__));
extern char *qfcvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) __attribute__ ((__warn_unused_result__));
extern char *qgcvt (long double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3))) __attribute__ ((__warn_unused_result__));




extern int ecvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int fcvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));

extern int qecvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int qfcvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));





extern int mblen (const char *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));


extern int mbtowc (wchar_t *__restrict __pwc,
     const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));


extern int wctomb (char *__s, wchar_t __wchar) __attribute__ ((__nothrow__ , __leaf__));



extern size_t mbstowcs (wchar_t *__restrict __pwcs,
   const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));

extern size_t wcstombs (char *__restrict __s,
   const wchar_t *__restrict __pwcs, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__));







extern int rpmatch (const char *__response) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));
# 839 "/usr/include/stdlib.h" 3 4
extern int getsubopt (char **__restrict __optionp,
        char *const *__restrict __tokens,
        char **__restrict __valuep)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2, 3))) __attribute__ ((__warn_unused_result__));
# 891 "/usr/include/stdlib.h" 3 4
extern int getloadavg (double __loadavg[], int __nelem)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 901 "/usr/include/stdlib.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h" 3 4
extern __inline __attribute__ ((__gnu_inline__)) double
__attribute__ ((__nothrow__ , __leaf__)) atof (const char *__nptr)
{
  return strtod (__nptr, (char **) ((void *)0));
}
# 902 "/usr/include/stdlib.h" 2 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/stdlib.h" 1 3 4
# 23 "/usr/include/x86_64-linux-gnu/bits/stdlib.h" 3 4
extern char *__realpath_chk (const char *__restrict __name,
        char *__restrict __resolved,
        size_t __resolvedlen) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));
extern char *__realpath_alias (const char *__restrict __name, char *__restrict __resolved) __asm__ ("" "realpath") __attribute__ ((__nothrow__ , __leaf__))

                                                 __attribute__ ((__warn_unused_result__));
extern char *__realpath_chk_warn (const char *__restrict __name, char *__restrict __resolved, size_t __resolvedlen) __asm__ ("" "__realpath_chk") __attribute__ ((__nothrow__ , __leaf__))


                                                __attribute__ ((__warn_unused_result__))
     __attribute__((__warning__ ("second argument of realpath must be either NULL or at " "least PATH_MAX bytes long buffer")))
                                      ;

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) __attribute__ ((__warn_unused_result__)) char *
__attribute__ ((__nothrow__ , __leaf__)) realpath (const char *__restrict __name, char *__restrict __resolved)
{
  if (__builtin_object_size (__resolved, 2 > 1) != (size_t) -1)
    {




      return __realpath_chk (__name, __resolved, __builtin_object_size (__resolved, 2 > 1));
    }

  return __realpath_alias (__name, __resolved);
}


extern int __ptsname_r_chk (int __fd, char *__buf, size_t __buflen,
       size_t __nreal) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
extern int __ptsname_r_alias (int __fd, char *__buf, size_t __buflen) __asm__ ("" "ptsname_r") __attribute__ ((__nothrow__ , __leaf__))

     __attribute__ ((__nonnull__ (2)));
extern int __ptsname_r_chk_warn (int __fd, char *__buf, size_t __buflen, size_t __nreal) __asm__ ("" "__ptsname_r_chk") __attribute__ ((__nothrow__ , __leaf__))


     __attribute__ ((__nonnull__ (2))) __attribute__((__warning__ ("ptsname_r called with buflen bigger than " "size of buf")))
                   ;

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
__attribute__ ((__nothrow__ , __leaf__)) ptsname_r (int __fd, char *__buf, size_t __buflen)
{
  if (__builtin_object_size (__buf, 2 > 1) != (size_t) -1)
    {
      if (!__builtin_constant_p (__buflen))
 return __ptsname_r_chk (__fd, __buf, __buflen, __builtin_object_size (__buf, 2 > 1));
      if (__buflen > __builtin_object_size (__buf, 2 > 1))
 return __ptsname_r_chk_warn (__fd, __buf, __buflen, __builtin_object_size (__buf, 2 > 1));
    }
  return __ptsname_r_alias (__fd, __buf, __buflen);
}


extern int __wctomb_chk (char *__s, wchar_t __wchar, size_t __buflen)
  __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));
extern int __wctomb_alias (char *__s, wchar_t __wchar) __asm__ ("" "wctomb") __attribute__ ((__nothrow__ , __leaf__))
              __attribute__ ((__warn_unused_result__));

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) __attribute__ ((__warn_unused_result__)) int
__attribute__ ((__nothrow__ , __leaf__)) wctomb (char *__s, wchar_t __wchar)
{







  if (__builtin_object_size (__s, 2 > 1) != (size_t) -1 && 16 > __builtin_object_size (__s, 2 > 1))
    return __wctomb_chk (__s, __wchar, __builtin_object_size (__s, 2 > 1));
  return __wctomb_alias (__s, __wchar);
}


extern size_t __mbstowcs_chk (wchar_t *__restrict __dst,
         const char *__restrict __src,
         size_t __len, size_t __dstlen) __attribute__ ((__nothrow__ , __leaf__));
extern size_t __mbstowcs_alias (wchar_t *__restrict __dst, const char *__restrict __src, size_t __len) __asm__ ("" "mbstowcs") __attribute__ ((__nothrow__ , __leaf__))


                                  ;
extern size_t __mbstowcs_chk_warn (wchar_t *__restrict __dst, const char *__restrict __src, size_t __len, size_t __dstlen) __asm__ ("" "__mbstowcs_chk") __attribute__ ((__nothrow__ , __leaf__))



     __attribute__((__warning__ ("mbstowcs called with dst buffer smaller than len " "* sizeof (wchar_t)")))
                        ;

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) size_t
__attribute__ ((__nothrow__ , __leaf__)) mbstowcs (wchar_t *__restrict __dst, const char *__restrict __src, size_t __len)

{
  if (__builtin_object_size (__dst, 2 > 1) != (size_t) -1)
    {
      if (!__builtin_constant_p (__len))
 return __mbstowcs_chk (__dst, __src, __len,
          __builtin_object_size (__dst, 2 > 1) / sizeof (wchar_t));

      if (__len > __builtin_object_size (__dst, 2 > 1) / sizeof (wchar_t))
 return __mbstowcs_chk_warn (__dst, __src, __len,
         __builtin_object_size (__dst, 2 > 1) / sizeof (wchar_t));
    }
  return __mbstowcs_alias (__dst, __src, __len);
}


extern size_t __wcstombs_chk (char *__restrict __dst,
         const wchar_t *__restrict __src,
         size_t __len, size_t __dstlen) __attribute__ ((__nothrow__ , __leaf__));
extern size_t __wcstombs_alias (char *__restrict __dst, const wchar_t *__restrict __src, size_t __len) __asm__ ("" "wcstombs") __attribute__ ((__nothrow__ , __leaf__))


                                  ;
extern size_t __wcstombs_chk_warn (char *__restrict __dst, const wchar_t *__restrict __src, size_t __len, size_t __dstlen) __asm__ ("" "__wcstombs_chk") __attribute__ ((__nothrow__ , __leaf__))



     __attribute__((__warning__ ("wcstombs called with dst buffer smaller than len")));

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) size_t
__attribute__ ((__nothrow__ , __leaf__)) wcstombs (char *__restrict __dst, const wchar_t *__restrict __src, size_t __len)

{
  if (__builtin_object_size (__dst, 2 > 1) != (size_t) -1)
    {
      if (!__builtin_constant_p (__len))
 return __wcstombs_chk (__dst, __src, __len, __builtin_object_size (__dst, 2 > 1));
      if (__len > __builtin_object_size (__dst, 2 > 1))
 return __wcstombs_chk_warn (__dst, __src, __len, __builtin_object_size (__dst, 2 > 1));
    }
  return __wcstombs_alias (__dst, __src, __len);
}
# 906 "/usr/include/stdlib.h" 2 3 4






# 25 "const_string.c" 2
# 1 "/usr/include/math.h" 1 3 4
# 27 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h" 1 3 4
# 28 "/usr/include/math.h" 2 3 4







# 1 "/usr/include/x86_64-linux-gnu/bits/math-vector.h" 1 3 4
# 25 "/usr/include/x86_64-linux-gnu/bits/math-vector.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/libm-simd-decl-stubs.h" 1 3 4
# 26 "/usr/include/x86_64-linux-gnu/bits/math-vector.h" 2 3 4
# 36 "/usr/include/math.h" 2 3 4






# 1 "/usr/include/x86_64-linux-gnu/bits/huge_val.h" 1 3 4
# 43 "/usr/include/math.h" 2 3 4






# 1 "/usr/include/x86_64-linux-gnu/bits/huge_valf.h" 1 3 4
# 50 "/usr/include/math.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/huge_vall.h" 1 3 4
# 51 "/usr/include/math.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/inf.h" 1 3 4
# 54 "/usr/include/math.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/nan.h" 1 3 4
# 57 "/usr/include/math.h" 2 3 4
# 72 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/flt-eval-method.h" 1 3 4
# 73 "/usr/include/math.h" 2 3 4
# 83 "/usr/include/math.h" 3 4
typedef float float_t;
typedef double double_t;
# 124 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/fp-logb.h" 1 3 4
# 125 "/usr/include/math.h" 2 3 4
# 167 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/fp-fast.h" 1 3 4
# 168 "/usr/include/math.h" 2 3 4
# 223 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls-helper-functions.h" 1 3 4
# 21 "/usr/include/x86_64-linux-gnu/bits/mathcalls-helper-functions.h" 3 4
extern int __fpclassify (double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));


extern int __signbit (double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));



extern int __isinf (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int __finite (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int __isnan (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int __iseqsig (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));


extern int __issignaling (double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
# 224 "/usr/include/math.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 1 3 4
# 53 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern double acos (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __acos (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double asin (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __asin (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double atan (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __atan (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double atan2 (double __y, double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __atan2 (double __y, double __x) __attribute__ ((__nothrow__ , __leaf__));


 extern double cos (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __cos (double __x) __attribute__ ((__nothrow__ , __leaf__));

 extern double sin (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __sin (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double tan (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __tan (double __x) __attribute__ ((__nothrow__ , __leaf__));




extern double cosh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __cosh (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double sinh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __sinh (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double tanh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __tanh (double __x) __attribute__ ((__nothrow__ , __leaf__));
# 85 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern double acosh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __acosh (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double asinh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __asinh (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double atanh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __atanh (double __x) __attribute__ ((__nothrow__ , __leaf__));





 extern double exp (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __exp (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double frexp (double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern double __frexp (double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));


extern double ldexp (double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern double __ldexp (double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));


 extern double log (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double log10 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log10 (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double modf (double __x, double *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern double __modf (double __x, double *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
# 125 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern double expm1 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __expm1 (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double log1p (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log1p (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double logb (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __logb (double __x) __attribute__ ((__nothrow__ , __leaf__));




extern double exp2 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __exp2 (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double log2 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log2 (double __x) __attribute__ ((__nothrow__ , __leaf__));






 extern double pow (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __pow (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));


extern double sqrt (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __sqrt (double __x) __attribute__ ((__nothrow__ , __leaf__));



extern double hypot (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __hypot (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));




extern double cbrt (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __cbrt (double __x) __attribute__ ((__nothrow__ , __leaf__));






extern double ceil (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __ceil (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern double fabs (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fabs (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern double floor (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __floor (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern double fmod (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __fmod (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));
# 183 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern int isinf (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern int finite (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern double drem (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __drem (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));



extern double significand (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __significand (double __x) __attribute__ ((__nothrow__ , __leaf__));






extern double copysign (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __copysign (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern double nan (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __nan (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
# 217 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern int isnan (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));





extern double j0 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __j0 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double j1 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __j1 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double jn (int, double) __attribute__ ((__nothrow__ , __leaf__)); extern double __jn (int, double) __attribute__ ((__nothrow__ , __leaf__));
extern double y0 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __y0 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double y1 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __y1 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double yn (int, double) __attribute__ ((__nothrow__ , __leaf__)); extern double __yn (int, double) __attribute__ ((__nothrow__ , __leaf__));





extern double erf (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __erf (double) __attribute__ ((__nothrow__ , __leaf__));
extern double erfc (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __erfc (double) __attribute__ ((__nothrow__ , __leaf__));
extern double lgamma (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __lgamma (double) __attribute__ ((__nothrow__ , __leaf__));




extern double tgamma (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __tgamma (double) __attribute__ ((__nothrow__ , __leaf__));





extern double gamma (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __gamma (double) __attribute__ ((__nothrow__ , __leaf__));







extern double lgamma_r (double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern double __lgamma_r (double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));






extern double rint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __rint (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double nextafter (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __nextafter (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

extern double nexttoward (double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __nexttoward (double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
# 278 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern double remainder (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __remainder (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));



extern double scalbn (double __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern double __scalbn (double __x, int __n) __attribute__ ((__nothrow__ , __leaf__));



extern int ilogb (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogb (double __x) __attribute__ ((__nothrow__ , __leaf__));
# 296 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern double scalbln (double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern double __scalbln (double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));



extern double nearbyint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __nearbyint (double __x) __attribute__ ((__nothrow__ , __leaf__));



extern double round (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __round (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern double trunc (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __trunc (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern double remquo (double __x, double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern double __remquo (double __x, double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));






extern long int lrint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrint (double __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llrint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrint (double __x) __attribute__ ((__nothrow__ , __leaf__));



extern long int lround (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lround (double __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llround (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llround (double __x) __attribute__ ((__nothrow__ , __leaf__));



extern double fdim (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __fdim (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));


extern double fmax (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fmax (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern double fmin (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fmin (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern double fma (double __x, double __y, double __z) __attribute__ ((__nothrow__ , __leaf__)); extern double __fma (double __x, double __y, double __z) __attribute__ ((__nothrow__ , __leaf__));
# 402 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern double scalb (double __x, double __n) __attribute__ ((__nothrow__ , __leaf__)); extern double __scalb (double __x, double __n) __attribute__ ((__nothrow__ , __leaf__));
# 225 "/usr/include/math.h" 2 3 4
# 243 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls-helper-functions.h" 1 3 4
# 21 "/usr/include/x86_64-linux-gnu/bits/mathcalls-helper-functions.h" 3 4
extern int __fpclassifyf (float __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));


extern int __signbitf (float __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));



extern int __isinff (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int __finitef (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int __isnanf (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int __iseqsigf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));


extern int __issignalingf (float __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
# 244 "/usr/include/math.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 1 3 4
# 53 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern float acosf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __acosf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float asinf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __asinf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float atanf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __atanf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float atan2f (float __y, float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __atan2f (float __y, float __x) __attribute__ ((__nothrow__ , __leaf__));


 extern float cosf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __cosf (float __x) __attribute__ ((__nothrow__ , __leaf__));

 extern float sinf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __sinf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float tanf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __tanf (float __x) __attribute__ ((__nothrow__ , __leaf__));




extern float coshf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __coshf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float sinhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __sinhf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float tanhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __tanhf (float __x) __attribute__ ((__nothrow__ , __leaf__));
# 85 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern float acoshf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __acoshf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float asinhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __asinhf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float atanhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __atanhf (float __x) __attribute__ ((__nothrow__ , __leaf__));





 extern float expf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __expf (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float frexpf (float __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern float __frexpf (float __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));


extern float ldexpf (float __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern float __ldexpf (float __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));


 extern float logf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __logf (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float log10f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __log10f (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float modff (float __x, float *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern float __modff (float __x, float *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
# 125 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern float expm1f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __expm1f (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float log1pf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __log1pf (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float logbf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __logbf (float __x) __attribute__ ((__nothrow__ , __leaf__));




extern float exp2f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __exp2f (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float log2f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __log2f (float __x) __attribute__ ((__nothrow__ , __leaf__));






 extern float powf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __powf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));


extern float sqrtf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __sqrtf (float __x) __attribute__ ((__nothrow__ , __leaf__));



extern float hypotf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __hypotf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));




extern float cbrtf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __cbrtf (float __x) __attribute__ ((__nothrow__ , __leaf__));






extern float ceilf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __ceilf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern float fabsf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fabsf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern float floorf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __floorf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern float fmodf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __fmodf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));
# 183 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern int isinff (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern int finitef (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern float dremf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __dremf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));



extern float significandf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __significandf (float __x) __attribute__ ((__nothrow__ , __leaf__));






extern float copysignf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __copysignf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern float nanf (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __nanf (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
# 217 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern int isnanf (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));





extern float j0f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __j0f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float j1f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __j1f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float jnf (int, float) __attribute__ ((__nothrow__ , __leaf__)); extern float __jnf (int, float) __attribute__ ((__nothrow__ , __leaf__));
extern float y0f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __y0f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float y1f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __y1f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float ynf (int, float) __attribute__ ((__nothrow__ , __leaf__)); extern float __ynf (int, float) __attribute__ ((__nothrow__ , __leaf__));





extern float erff (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __erff (float) __attribute__ ((__nothrow__ , __leaf__));
extern float erfcf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __erfcf (float) __attribute__ ((__nothrow__ , __leaf__));
extern float lgammaf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __lgammaf (float) __attribute__ ((__nothrow__ , __leaf__));




extern float tgammaf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __tgammaf (float) __attribute__ ((__nothrow__ , __leaf__));





extern float gammaf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __gammaf (float) __attribute__ ((__nothrow__ , __leaf__));







extern float lgammaf_r (float, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern float __lgammaf_r (float, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));






extern float rintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __rintf (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float nextafterf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __nextafterf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

extern float nexttowardf (float __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __nexttowardf (float __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
# 278 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern float remainderf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __remainderf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));



extern float scalbnf (float __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern float __scalbnf (float __x, int __n) __attribute__ ((__nothrow__ , __leaf__));



extern int ilogbf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogbf (float __x) __attribute__ ((__nothrow__ , __leaf__));
# 296 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern float scalblnf (float __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern float __scalblnf (float __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));



extern float nearbyintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __nearbyintf (float __x) __attribute__ ((__nothrow__ , __leaf__));



extern float roundf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __roundf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern float truncf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __truncf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern float remquof (float __x, float __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern float __remquof (float __x, float __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));






extern long int lrintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrintf (float __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llrintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrintf (float __x) __attribute__ ((__nothrow__ , __leaf__));



extern long int lroundf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lroundf (float __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llroundf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llroundf (float __x) __attribute__ ((__nothrow__ , __leaf__));



extern float fdimf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __fdimf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));


extern float fmaxf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fmaxf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern float fminf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fminf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern float fmaf (float __x, float __y, float __z) __attribute__ ((__nothrow__ , __leaf__)); extern float __fmaf (float __x, float __y, float __z) __attribute__ ((__nothrow__ , __leaf__));
# 402 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern float scalbf (float __x, float __n) __attribute__ ((__nothrow__ , __leaf__)); extern float __scalbf (float __x, float __n) __attribute__ ((__nothrow__ , __leaf__));
# 245 "/usr/include/math.h" 2 3 4
# 289 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls-helper-functions.h" 1 3 4
# 21 "/usr/include/x86_64-linux-gnu/bits/mathcalls-helper-functions.h" 3 4
extern int __fpclassifyl (long double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));


extern int __signbitl (long double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));



extern int __isinfl (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int __finitel (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int __isnanl (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int __iseqsigl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));


extern int __issignalingl (long double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
# 290 "/usr/include/math.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 1 3 4
# 53 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern long double acosl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __acosl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double asinl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __asinl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double atanl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __atanl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double atan2l (long double __y, long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __atan2l (long double __y, long double __x) __attribute__ ((__nothrow__ , __leaf__));


 extern long double cosl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __cosl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

 extern long double sinl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __sinl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double tanl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __tanl (long double __x) __attribute__ ((__nothrow__ , __leaf__));




extern long double coshl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __coshl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double sinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __sinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double tanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __tanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
# 85 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern long double acoshl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __acoshl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double asinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __asinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double atanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __atanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));





 extern long double expl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __expl (long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double frexpl (long double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern long double __frexpl (long double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));


extern long double ldexpl (long double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern long double __ldexpl (long double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));


 extern long double logl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __logl (long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double log10l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __log10l (long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double modfl (long double __x, long double *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern long double __modfl (long double __x, long double *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
# 125 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern long double expm1l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __expm1l (long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double log1pl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __log1pl (long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double logbl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __logbl (long double __x) __attribute__ ((__nothrow__ , __leaf__));




extern long double exp2l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __exp2l (long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double log2l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __log2l (long double __x) __attribute__ ((__nothrow__ , __leaf__));






 extern long double powl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __powl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));


extern long double sqrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __sqrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__));



extern long double hypotl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __hypotl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));




extern long double cbrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __cbrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__));






extern long double ceill (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __ceill (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern long double fabsl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fabsl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern long double floorl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __floorl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern long double fmodl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __fmodl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
# 183 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern int isinfl (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern int finitel (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern long double dreml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __dreml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));



extern long double significandl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __significandl (long double __x) __attribute__ ((__nothrow__ , __leaf__));






extern long double copysignl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __copysignl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern long double nanl (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __nanl (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
# 217 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern int isnanl (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));





extern long double j0l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __j0l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double j1l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __j1l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double jnl (int, long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __jnl (int, long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double y0l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __y0l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double y1l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __y1l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double ynl (int, long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __ynl (int, long double) __attribute__ ((__nothrow__ , __leaf__));





extern long double erfl (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __erfl (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double erfcl (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __erfcl (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double lgammal (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __lgammal (long double) __attribute__ ((__nothrow__ , __leaf__));




extern long double tgammal (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __tgammal (long double) __attribute__ ((__nothrow__ , __leaf__));





extern long double gammal (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __gammal (long double) __attribute__ ((__nothrow__ , __leaf__));







extern long double lgammal_r (long double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern long double __lgammal_r (long double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));






extern long double rintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __rintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double nextafterl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __nextafterl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

extern long double nexttowardl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __nexttowardl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
# 278 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern long double remainderl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __remainderl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));



extern long double scalbnl (long double __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern long double __scalbnl (long double __x, int __n) __attribute__ ((__nothrow__ , __leaf__));



extern int ilogbl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogbl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
# 296 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern long double scalblnl (long double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern long double __scalblnl (long double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));



extern long double nearbyintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __nearbyintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));



extern long double roundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __roundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern long double truncl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __truncl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern long double remquol (long double __x, long double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern long double __remquol (long double __x, long double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));






extern long int lrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));



extern long int lroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__));



extern long double fdiml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __fdiml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));


extern long double fmaxl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fmaxl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern long double fminl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fminl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern long double fmal (long double __x, long double __y, long double __z) __attribute__ ((__nothrow__ , __leaf__)); extern long double __fmal (long double __x, long double __y, long double __z) __attribute__ ((__nothrow__ , __leaf__));
# 402 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern long double scalbl (long double __x, long double __n) __attribute__ ((__nothrow__ , __leaf__)); extern long double __scalbl (long double __x, long double __n) __attribute__ ((__nothrow__ , __leaf__));
# 291 "/usr/include/math.h" 2 3 4
# 312 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls-helper-functions.h" 1 3 4
# 21 "/usr/include/x86_64-linux-gnu/bits/mathcalls-helper-functions.h" 3 4
extern int __fpclassifyf128 (_Float128 __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));


extern int __signbitf128 (_Float128 __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));



extern int __isinff128 (_Float128 __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int __finitef128 (_Float128 __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int __isnanf128 (_Float128 __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int __iseqsigf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__));


extern int __issignalingf128 (_Float128 __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
# 313 "/usr/include/math.h" 2 3 4
# 330 "/usr/include/math.h" 3 4
extern int signgam;
# 380 "/usr/include/math.h" 3 4
enum
  {
    FP_NAN =

      0,
    FP_INFINITE =

      1,
    FP_ZERO =

      2,
    FP_SUBNORMAL =

      3,
    FP_NORMAL =

      4
  };
# 562 "/usr/include/math.h" 3 4
typedef enum
{
  _IEEE_ = -1,
  _SVID_,
  _XOPEN_,
  _POSIX_,
  _ISOC_
} _LIB_VERSION_TYPE;




extern _LIB_VERSION_TYPE _LIB_VERSION;
# 587 "/usr/include/math.h" 3 4
struct exception

  {
    int type;
    char *name;
    double arg1;
    double arg2;
    double retval;
  };




extern int matherr (struct exception *__exc);
# 702 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathinline.h" 1 3 4
# 125 "/usr/include/x86_64-linux-gnu/bits/mathinline.h" 3 4
extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ , __leaf__)) __signbitf (float __x)
{

  int __m;
  __asm ("pmovmskb %1, %0" : "=r" (__m) : "x" (__x));
  return (__m & 0x8) != 0;




}
extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ , __leaf__)) __signbit (double __x)
{

  int __m;
  __asm ("pmovmskb %1, %0" : "=r" (__m) : "x" (__x));
  return (__m & 0x80) != 0;




}
extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ , __leaf__)) __signbitl (long double __x)
{
  __extension__ union { long double __l; int __i[3]; } __u = { __l: __x };
  return (__u.__i[2] & 0x8000) != 0;
}
# 703 "/usr/include/math.h" 2 3 4
# 843 "/usr/include/math.h" 3 4

# 26 "const_string.c" 2
# 1 "/usr/include/string.h" 1 3 4
# 26 "/usr/include/string.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h" 1 3 4
# 27 "/usr/include/string.h" 2 3 4






# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h" 1 3 4
# 34 "/usr/include/string.h" 2 3 4
# 42 "/usr/include/string.h" 3 4
extern void *memcpy (void *__restrict __dest, const void *__restrict __src,
       size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern void *memmove (void *__dest, const void *__src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));





extern void *memccpy (void *__restrict __dest, const void *__restrict __src,
        int __c, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));




extern void *memset (void *__s, int __c, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int memcmp (const void *__s1, const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 90 "/usr/include/string.h" 3 4
extern void *memchr (const void *__s, int __c, size_t __n)
      __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 121 "/usr/include/string.h" 3 4
extern char *strcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern char *strncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern char *strcat (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern char *strncat (char *__restrict __dest, const char *__restrict __src,
        size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strcmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern int strncmp (const char *__s1, const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strcoll (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern size_t strxfrm (char *__restrict __dest,
         const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));



# 1 "/usr/include/x86_64-linux-gnu/bits/types/locale_t.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/types/locale_t.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types/__locale_t.h" 1 3 4
# 28 "/usr/include/x86_64-linux-gnu/bits/types/__locale_t.h" 3 4
struct __locale_struct
{

  struct __locale_data *__locales[13];


  const unsigned short int *__ctype_b;
  const int *__ctype_tolower;
  const int *__ctype_toupper;


  const char *__names[13];
};

typedef struct __locale_struct *__locale_t;
# 23 "/usr/include/x86_64-linux-gnu/bits/types/locale_t.h" 2 3 4

typedef __locale_t locale_t;
# 153 "/usr/include/string.h" 2 3 4


extern int strcoll_l (const char *__s1, const char *__s2, locale_t __l)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));


extern size_t strxfrm_l (char *__dest, const char *__src, size_t __n,
    locale_t __l) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 4)));





extern char *strdup (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));






extern char *strndup (const char *__string, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));
# 225 "/usr/include/string.h" 3 4
extern char *strchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 252 "/usr/include/string.h" 3 4
extern char *strrchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 272 "/usr/include/string.h" 3 4
extern size_t strcspn (const char *__s, const char *__reject)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern size_t strspn (const char *__s, const char *__accept)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 302 "/usr/include/string.h" 3 4
extern char *strpbrk (const char *__s, const char *__accept)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 329 "/usr/include/string.h" 3 4
extern char *strstr (const char *__haystack, const char *__needle)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));




extern char *strtok (char *__restrict __s, const char *__restrict __delim)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));



extern char *__strtok_r (char *__restrict __s,
    const char *__restrict __delim,
    char **__restrict __save_ptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));

extern char *strtok_r (char *__restrict __s, const char *__restrict __delim,
         char **__restrict __save_ptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));
# 384 "/usr/include/string.h" 3 4
extern size_t strlen (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));




extern size_t strnlen (const char *__string, size_t __maxlen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));




extern char *strerror (int __errnum) __attribute__ ((__nothrow__ , __leaf__));
# 409 "/usr/include/string.h" 3 4
extern int strerror_r (int __errnum, char *__buf, size_t __buflen) __asm__ ("" "__xpg_strerror_r") __attribute__ ((__nothrow__ , __leaf__))

                        __attribute__ ((__nonnull__ (2)));
# 427 "/usr/include/string.h" 3 4
extern char *strerror_l (int __errnum, locale_t __l) __attribute__ ((__nothrow__ , __leaf__));



# 1 "/usr/include/strings.h" 1 3 4
# 23 "/usr/include/strings.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h" 1 3 4
# 24 "/usr/include/strings.h" 2 3 4










extern int bcmp (const void *__s1, const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern void bcopy (const void *__src, void *__dest, size_t __n)
  __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern void bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 68 "/usr/include/strings.h" 3 4
extern char *index (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 96 "/usr/include/strings.h" 3 4
extern char *rindex (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));






extern int ffs (int __i) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
# 116 "/usr/include/strings.h" 3 4
extern int strcasecmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strncasecmp (const char *__s1, const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));






extern int strcasecmp_l (const char *__s1, const char *__s2, locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));



extern int strncasecmp_l (const char *__s1, const char *__s2,
     size_t __n, locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 4)));








# 1 "/usr/include/x86_64-linux-gnu/bits/strings_fortified.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/strings_fortified.h" 3 4
extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) void
__attribute__ ((__nothrow__ , __leaf__)) bcopy (const void *__src, void *__dest, size_t __len)
{
  (void) __builtin___memmove_chk (__dest, __src, __len, __builtin_object_size (__dest, 0));
}

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) void
__attribute__ ((__nothrow__ , __leaf__)) bzero (void *__dest, size_t __len)
{
  (void) __builtin___memset_chk (__dest, '\0', __len, __builtin_object_size (__dest, 0));
}
# 145 "/usr/include/strings.h" 2 3 4
# 432 "/usr/include/string.h" 2 3 4



extern void explicit_bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern char *strsep (char **__restrict __stringp,
       const char *__restrict __delim)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));




extern char *strsignal (int __sig) __attribute__ ((__nothrow__ , __leaf__));


extern char *__stpcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



extern char *__stpncpy (char *__restrict __dest,
   const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
# 494 "/usr/include/string.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/string_fortified.h" 1 3 4
# 30 "/usr/include/x86_64-linux-gnu/bits/string_fortified.h" 3 4
extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) void *
__attribute__ ((__nothrow__ , __leaf__)) memcpy (void *__restrict __dest, const void *__restrict __src, size_t __len)

{
  return __builtin___memcpy_chk (__dest, __src, __len, __builtin_object_size (__dest, 0));
}

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) void *
__attribute__ ((__nothrow__ , __leaf__)) memmove (void *__dest, const void *__src, size_t __len)
{
  return __builtin___memmove_chk (__dest, __src, __len, __builtin_object_size (__dest, 0));
}
# 58 "/usr/include/x86_64-linux-gnu/bits/string_fortified.h" 3 4
extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) void *
__attribute__ ((__nothrow__ , __leaf__)) memset (void *__dest, int __ch, size_t __len)
{
# 71 "/usr/include/x86_64-linux-gnu/bits/string_fortified.h" 3 4
  return __builtin___memset_chk (__dest, __ch, __len, __builtin_object_size (__dest, 0));
}




void __explicit_bzero_chk (void *__dest, size_t __len, size_t __destlen)
  __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) void
__attribute__ ((__nothrow__ , __leaf__)) explicit_bzero (void *__dest, size_t __len)
{
  __explicit_bzero_chk (__dest, __len, __builtin_object_size (__dest, 0));
}


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) char *
__attribute__ ((__nothrow__ , __leaf__)) strcpy (char *__restrict __dest, const char *__restrict __src)
{
  return __builtin___strcpy_chk (__dest, __src, __builtin_object_size (__dest, 2 > 1));
}
# 102 "/usr/include/x86_64-linux-gnu/bits/string_fortified.h" 3 4
extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) char *
__attribute__ ((__nothrow__ , __leaf__)) strncpy (char *__restrict __dest, const char *__restrict __src, size_t __len)

{
  return __builtin___strncpy_chk (__dest, __src, __len, __builtin_object_size (__dest, 2 > 1));
}


extern char *__stpncpy_chk (char *__dest, const char *__src, size_t __n,
       size_t __destlen) __attribute__ ((__nothrow__ , __leaf__));
extern char *__stpncpy_alias (char *__dest, const char *__src, size_t __n) __asm__ ("" "stpncpy") __attribute__ ((__nothrow__ , __leaf__))
                                 ;

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) char *
__attribute__ ((__nothrow__ , __leaf__)) stpncpy (char *__dest, const char *__src, size_t __n)
{
  if (__builtin_object_size (__dest, 2 > 1) != (size_t) -1
      && (!__builtin_constant_p (__n) || __n > __builtin_object_size (__dest, 2 > 1)))
    return __stpncpy_chk (__dest, __src, __n, __builtin_object_size (__dest, 2 > 1));
  return __stpncpy_alias (__dest, __src, __n);
}


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) char *
__attribute__ ((__nothrow__ , __leaf__)) strcat (char *__restrict __dest, const char *__restrict __src)
{
  return __builtin___strcat_chk (__dest, __src, __builtin_object_size (__dest, 2 > 1));
}


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) char *
__attribute__ ((__nothrow__ , __leaf__)) strncat (char *__restrict __dest, const char *__restrict __src, size_t __len)

{
  return __builtin___strncat_chk (__dest, __src, __len, __builtin_object_size (__dest, 2 > 1));
}
# 495 "/usr/include/string.h" 2 3 4




# 27 "const_string.c" 2

# 1 "../include/pelib/string.h" 1
# 27 "../include/pelib/string.h"

# 27 "../include/pelib/string.h"
typedef char* string;


# 1 "../include/pelib/structure.h" 1
# 24 "../include/pelib/structure.h"
# 1 "/usr/include/stdio.h" 1 3 4
# 27 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h" 1 3 4
# 28 "/usr/include/stdio.h" 2 3 4





# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h" 1 3 4
# 34 "/usr/include/stdio.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/types/__FILE.h" 1 3 4




# 4 "/usr/include/x86_64-linux-gnu/bits/types/__FILE.h" 3 4
struct _IO_FILE;
typedef struct _IO_FILE __FILE;
# 37 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h" 1 3 4



struct _IO_FILE;


typedef struct _IO_FILE FILE;
# 38 "/usr/include/stdio.h" 2 3 4



# 1 "/usr/include/libio.h" 1 3 4
# 31 "/usr/include/libio.h" 3 4
# 1 "/usr/include/_G_config.h" 1 3 4
# 15 "/usr/include/_G_config.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h" 1 3 4
# 16 "/usr/include/_G_config.h" 2 3 4

# 1 "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h" 1 3 4
# 13 "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h" 3 4
typedef struct
{
  int __count;
  union
  {
    unsigned int __wch;
    char __wchb[4];
  } __value;
} __mbstate_t;
# 18 "/usr/include/_G_config.h" 2 3 4




typedef struct
{
  __off_t __pos;
  __mbstate_t __state;
} _G_fpos_t;
typedef struct
{
  __off64_t __pos;
  __mbstate_t __state;
} _G_fpos64_t;
# 32 "/usr/include/libio.h" 2 3 4
# 49 "/usr/include/libio.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stdarg.h" 1 3 4
# 40 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 50 "/usr/include/libio.h" 2 3 4
# 145 "/usr/include/libio.h" 3 4
struct _IO_jump_t; struct _IO_FILE;




typedef void _IO_lock_t;





struct _IO_marker {
  struct _IO_marker *_next;
  struct _IO_FILE *_sbuf;



  int _pos;
# 173 "/usr/include/libio.h" 3 4
};


enum __codecvt_result
{
  __codecvt_ok,
  __codecvt_partial,
  __codecvt_error,
  __codecvt_noconv
};
# 241 "/usr/include/libio.h" 3 4
struct _IO_FILE {
  int _flags;




  char* _IO_read_ptr;
  char* _IO_read_end;
  char* _IO_read_base;
  char* _IO_write_base;
  char* _IO_write_ptr;
  char* _IO_write_end;
  char* _IO_buf_base;
  char* _IO_buf_end;

  char *_IO_save_base;
  char *_IO_backup_base;
  char *_IO_save_end;

  struct _IO_marker *_markers;

  struct _IO_FILE *_chain;

  int _fileno;



  int _flags2;

  __off_t _old_offset;



  unsigned short _cur_column;
  signed char _vtable_offset;
  char _shortbuf[1];



  _IO_lock_t *_lock;
# 289 "/usr/include/libio.h" 3 4
  __off64_t _offset;







  void *__pad1;
  void *__pad2;
  void *__pad3;
  void *__pad4;

  size_t __pad5;
  int _mode;

  char _unused2[15 * sizeof (int) - 4 * sizeof (void *) - sizeof (size_t)];

};


typedef struct _IO_FILE _IO_FILE;


struct _IO_FILE_plus;

extern struct _IO_FILE_plus _IO_2_1_stdin_;
extern struct _IO_FILE_plus _IO_2_1_stdout_;
extern struct _IO_FILE_plus _IO_2_1_stderr_;
# 333 "/usr/include/libio.h" 3 4
typedef __ssize_t __io_read_fn (void *__cookie, char *__buf, size_t __nbytes);







typedef __ssize_t __io_write_fn (void *__cookie, const char *__buf,
     size_t __n);







typedef int __io_seek_fn (void *__cookie, __off64_t *__pos, int __w);


typedef int __io_close_fn (void *__cookie);
# 385 "/usr/include/libio.h" 3 4
extern int __underflow (_IO_FILE *);
extern int __uflow (_IO_FILE *);
extern int __overflow (_IO_FILE *, int);
# 429 "/usr/include/libio.h" 3 4
extern int _IO_getc (_IO_FILE *__fp);
extern int _IO_putc (int __c, _IO_FILE *__fp);
extern int _IO_feof (_IO_FILE *__fp) __attribute__ ((__nothrow__ , __leaf__));
extern int _IO_ferror (_IO_FILE *__fp) __attribute__ ((__nothrow__ , __leaf__));

extern int _IO_peekc_locked (_IO_FILE *__fp);





extern void _IO_flockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
extern void _IO_funlockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
extern int _IO_ftrylockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
# 458 "/usr/include/libio.h" 3 4
extern int _IO_vfscanf (_IO_FILE * __restrict, const char * __restrict,
   __gnuc_va_list, int *__restrict);
extern int _IO_vfprintf (_IO_FILE *__restrict, const char *__restrict,
    __gnuc_va_list);
extern __ssize_t _IO_padn (_IO_FILE *, int, __ssize_t);
extern size_t _IO_sgetn (_IO_FILE *, void *, size_t);

extern __off64_t _IO_seekoff (_IO_FILE *, __off64_t, int, int);
extern __off64_t _IO_seekpos (_IO_FILE *, __off64_t, int);

extern void _IO_free_backup_area (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
# 42 "/usr/include/stdio.h" 2 3 4




typedef __gnuc_va_list va_list;
# 78 "/usr/include/stdio.h" 3 4
typedef _G_fpos_t fpos_t;
# 131 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/stdio_lim.h" 1 3 4
# 132 "/usr/include/stdio.h" 2 3 4



extern struct _IO_FILE *stdin;
extern struct _IO_FILE *stdout;
extern struct _IO_FILE *stderr;






extern int remove (const char *__filename) __attribute__ ((__nothrow__ , __leaf__));

extern int rename (const char *__old, const char *__new) __attribute__ ((__nothrow__ , __leaf__));



extern int renameat (int __oldfd, const char *__old, int __newfd,
       const char *__new) __attribute__ ((__nothrow__ , __leaf__));







extern FILE *tmpfile (void) __attribute__ ((__warn_unused_result__));
# 173 "/usr/include/stdio.h" 3 4
extern char *tmpnam (char *__s) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));




extern char *tmpnam_r (char *__s) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));
# 190 "/usr/include/stdio.h" 3 4
extern char *tempnam (const char *__dir, const char *__pfx)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__warn_unused_result__));







extern int fclose (FILE *__stream);




extern int fflush (FILE *__stream);
# 213 "/usr/include/stdio.h" 3 4
extern int fflush_unlocked (FILE *__stream);
# 232 "/usr/include/stdio.h" 3 4
extern FILE *fopen (const char *__restrict __filename,
      const char *__restrict __modes) __attribute__ ((__warn_unused_result__));




extern FILE *freopen (const char *__restrict __filename,
        const char *__restrict __modes,
        FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));
# 265 "/usr/include/stdio.h" 3 4
extern FILE *fdopen (int __fd, const char *__modes) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));
# 278 "/usr/include/stdio.h" 3 4
extern FILE *fmemopen (void *__s, size_t __len, const char *__modes)
  __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));




extern FILE *open_memstream (char **__bufloc, size_t *__sizeloc) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));





extern void setbuf (FILE *__restrict __stream, char *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__));



extern int setvbuf (FILE *__restrict __stream, char *__restrict __buf,
      int __modes, size_t __n) __attribute__ ((__nothrow__ , __leaf__));




extern void setbuffer (FILE *__restrict __stream, char *__restrict __buf,
         size_t __size) __attribute__ ((__nothrow__ , __leaf__));


extern void setlinebuf (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));







extern int fprintf (FILE *__restrict __stream,
      const char *__restrict __format, ...);




extern int printf (const char *__restrict __format, ...);

extern int sprintf (char *__restrict __s,
      const char *__restrict __format, ...) __attribute__ ((__nothrow__));





extern int vfprintf (FILE *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg);




extern int vprintf (const char *__restrict __format, __gnuc_va_list __arg);

extern int vsprintf (char *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg) __attribute__ ((__nothrow__));



extern int snprintf (char *__restrict __s, size_t __maxlen,
       const char *__restrict __format, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 4)));

extern int vsnprintf (char *__restrict __s, size_t __maxlen,
        const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 0)));
# 365 "/usr/include/stdio.h" 3 4
extern int vdprintf (int __fd, const char *__restrict __fmt,
       __gnuc_va_list __arg)
     __attribute__ ((__format__ (__printf__, 2, 0)));
extern int dprintf (int __fd, const char *__restrict __fmt, ...)
     __attribute__ ((__format__ (__printf__, 2, 3)));







extern int fscanf (FILE *__restrict __stream,
     const char *__restrict __format, ...) __attribute__ ((__warn_unused_result__));




extern int scanf (const char *__restrict __format, ...) __attribute__ ((__warn_unused_result__));

extern int sscanf (const char *__restrict __s,
     const char *__restrict __format, ...) __attribute__ ((__nothrow__ , __leaf__));
# 395 "/usr/include/stdio.h" 3 4
extern int fscanf (FILE *__restrict __stream, const char *__restrict __format, ...) __asm__ ("" "__isoc99_fscanf")

                          __attribute__ ((__warn_unused_result__));
extern int scanf (const char *__restrict __format, ...) __asm__ ("" "__isoc99_scanf")
                         __attribute__ ((__warn_unused_result__));
extern int sscanf (const char *__restrict __s, const char *__restrict __format, ...) __asm__ ("" "__isoc99_sscanf") __attribute__ ((__nothrow__ , __leaf__))

                      ;
# 420 "/usr/include/stdio.h" 3 4
extern int vfscanf (FILE *__restrict __s, const char *__restrict __format,
      __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 2, 0))) __attribute__ ((__warn_unused_result__));





extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 1, 0))) __attribute__ ((__warn_unused_result__));


extern int vsscanf (const char *__restrict __s,
      const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__format__ (__scanf__, 2, 0)));
# 443 "/usr/include/stdio.h" 3 4
extern int vfscanf (FILE *__restrict __s, const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vfscanf")



     __attribute__ ((__format__ (__scanf__, 2, 0))) __attribute__ ((__warn_unused_result__));
extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vscanf")

     __attribute__ ((__format__ (__scanf__, 1, 0))) __attribute__ ((__warn_unused_result__));
extern int vsscanf (const char *__restrict __s, const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vsscanf") __attribute__ ((__nothrow__ , __leaf__))



     __attribute__ ((__format__ (__scanf__, 2, 0)));
# 477 "/usr/include/stdio.h" 3 4
extern int fgetc (FILE *__stream);
extern int getc (FILE *__stream);





extern int getchar (void);
# 495 "/usr/include/stdio.h" 3 4
extern int getc_unlocked (FILE *__stream);
extern int getchar_unlocked (void);
# 506 "/usr/include/stdio.h" 3 4
extern int fgetc_unlocked (FILE *__stream);
# 517 "/usr/include/stdio.h" 3 4
extern int fputc (int __c, FILE *__stream);
extern int putc (int __c, FILE *__stream);





extern int putchar (int __c);
# 537 "/usr/include/stdio.h" 3 4
extern int fputc_unlocked (int __c, FILE *__stream);







extern int putc_unlocked (int __c, FILE *__stream);
extern int putchar_unlocked (int __c);






extern int getw (FILE *__stream);


extern int putw (int __w, FILE *__stream);







extern char *fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
     __attribute__ ((__warn_unused_result__));
# 603 "/usr/include/stdio.h" 3 4
extern __ssize_t __getdelim (char **__restrict __lineptr,
          size_t *__restrict __n, int __delimiter,
          FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));
extern __ssize_t getdelim (char **__restrict __lineptr,
        size_t *__restrict __n, int __delimiter,
        FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));







extern __ssize_t getline (char **__restrict __lineptr,
       size_t *__restrict __n,
       FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));







extern int fputs (const char *__restrict __s, FILE *__restrict __stream);





extern int puts (const char *__s);






extern int ungetc (int __c, FILE *__stream);






extern size_t fread (void *__restrict __ptr, size_t __size,
       size_t __n, FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));




extern size_t fwrite (const void *__restrict __ptr, size_t __size,
        size_t __n, FILE *__restrict __s);
# 673 "/usr/include/stdio.h" 3 4
extern size_t fread_unlocked (void *__restrict __ptr, size_t __size,
         size_t __n, FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));
extern size_t fwrite_unlocked (const void *__restrict __ptr, size_t __size,
          size_t __n, FILE *__restrict __stream);







extern int fseek (FILE *__stream, long int __off, int __whence);




extern long int ftell (FILE *__stream) __attribute__ ((__warn_unused_result__));




extern void rewind (FILE *__stream);
# 707 "/usr/include/stdio.h" 3 4
extern int fseeko (FILE *__stream, __off_t __off, int __whence);




extern __off_t ftello (FILE *__stream) __attribute__ ((__warn_unused_result__));
# 731 "/usr/include/stdio.h" 3 4
extern int fgetpos (FILE *__restrict __stream, fpos_t *__restrict __pos);




extern int fsetpos (FILE *__stream, const fpos_t *__pos);
# 757 "/usr/include/stdio.h" 3 4
extern void clearerr (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));

extern int feof (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));

extern int ferror (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));



extern void clearerr_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
extern int feof_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));
extern int ferror_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));







extern void perror (const char *__s);





# 1 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h" 1 3 4
# 26 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h" 3 4
extern int sys_nerr;
extern const char *const sys_errlist[];
# 782 "/usr/include/stdio.h" 2 3 4




extern int fileno (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));




extern int fileno_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));
# 800 "/usr/include/stdio.h" 3 4
extern FILE *popen (const char *__command, const char *__modes) __attribute__ ((__warn_unused_result__));





extern int pclose (FILE *__stream);





extern char *ctermid (char *__s) __attribute__ ((__nothrow__ , __leaf__));
# 840 "/usr/include/stdio.h" 3 4
extern void flockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));



extern int ftrylockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));


extern void funlockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
# 859 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/stdio.h" 1 3 4
# 43 "/usr/include/x86_64-linux-gnu/bits/stdio.h" 3 4
extern __inline __attribute__ ((__gnu_inline__)) int
getchar (void)
{
  return _IO_getc (stdin);
}




extern __inline __attribute__ ((__gnu_inline__)) int
fgetc_unlocked (FILE *__fp)
{
  return (__builtin_expect (((__fp)->_IO_read_ptr >= (__fp)->_IO_read_end), 0) ? __uflow (__fp) : *(unsigned char *) (__fp)->_IO_read_ptr++);
}





extern __inline __attribute__ ((__gnu_inline__)) int
getc_unlocked (FILE *__fp)
{
  return (__builtin_expect (((__fp)->_IO_read_ptr >= (__fp)->_IO_read_end), 0) ? __uflow (__fp) : *(unsigned char *) (__fp)->_IO_read_ptr++);
}


extern __inline __attribute__ ((__gnu_inline__)) int
getchar_unlocked (void)
{
  return (__builtin_expect (((stdin)->_IO_read_ptr >= (stdin)->_IO_read_end), 0) ? __uflow (stdin) : *(unsigned char *) (stdin)->_IO_read_ptr++);
}




extern __inline __attribute__ ((__gnu_inline__)) int
putchar (int __c)
{
  return _IO_putc (__c, stdout);
}




extern __inline __attribute__ ((__gnu_inline__)) int
fputc_unlocked (int __c, FILE *__stream)
{
  return (__builtin_expect (((__stream)->_IO_write_ptr >= (__stream)->_IO_write_end), 0) ? __overflow (__stream, (unsigned char) (__c)) : (unsigned char) (*(__stream)->_IO_write_ptr++ = (__c)));
}





extern __inline __attribute__ ((__gnu_inline__)) int
putc_unlocked (int __c, FILE *__stream)
{
  return (__builtin_expect (((__stream)->_IO_write_ptr >= (__stream)->_IO_write_end), 0) ? __overflow (__stream, (unsigned char) (__c)) : (unsigned char) (*(__stream)->_IO_write_ptr++ = (__c)));
}


extern __inline __attribute__ ((__gnu_inline__)) int
putchar_unlocked (int __c)
{
  return (__builtin_expect (((stdout)->_IO_write_ptr >= (stdout)->_IO_write_end), 0) ? __overflow (stdout, (unsigned char) (__c)) : (unsigned char) (*(stdout)->_IO_write_ptr++ = (__c)));
}
# 124 "/usr/include/x86_64-linux-gnu/bits/stdio.h" 3 4
extern __inline __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ , __leaf__)) feof_unlocked (FILE *__stream)
{
  return (((__stream)->_flags & 0x10) != 0);
}


extern __inline __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ , __leaf__)) ferror_unlocked (FILE *__stream)
{
  return (((__stream)->_flags & 0x20) != 0);
}
# 860 "/usr/include/stdio.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/stdio2.h" 1 3 4
# 23 "/usr/include/x86_64-linux-gnu/bits/stdio2.h" 3 4
extern int __sprintf_chk (char *__restrict __s, int __flag, size_t __slen,
     const char *__restrict __format, ...) __attribute__ ((__nothrow__ , __leaf__));
extern int __vsprintf_chk (char *__restrict __s, int __flag, size_t __slen,
      const char *__restrict __format,
      __gnuc_va_list __ap) __attribute__ ((__nothrow__ , __leaf__));


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
__attribute__ ((__nothrow__ , __leaf__)) sprintf (char *__restrict __s, const char *__restrict __fmt, ...)
{
  return __builtin___sprintf_chk (__s, 2 - 1,
      __builtin_object_size (__s, 2 > 1), __fmt, __builtin_va_arg_pack ());
}






extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
__attribute__ ((__nothrow__ , __leaf__)) vsprintf (char *__restrict __s, const char *__restrict __fmt, __gnuc_va_list __ap)

{
  return __builtin___vsprintf_chk (__s, 2 - 1,
       __builtin_object_size (__s, 2 > 1), __fmt, __ap);
}



extern int __snprintf_chk (char *__restrict __s, size_t __n, int __flag,
      size_t __slen, const char *__restrict __format,
      ...) __attribute__ ((__nothrow__ , __leaf__));
extern int __vsnprintf_chk (char *__restrict __s, size_t __n, int __flag,
       size_t __slen, const char *__restrict __format,
       __gnuc_va_list __ap) __attribute__ ((__nothrow__ , __leaf__));


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
__attribute__ ((__nothrow__ , __leaf__)) snprintf (char *__restrict __s, size_t __n, const char *__restrict __fmt, ...)

{
  return __builtin___snprintf_chk (__s, __n, 2 - 1,
       __builtin_object_size (__s, 2 > 1), __fmt, __builtin_va_arg_pack ());
}






extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
__attribute__ ((__nothrow__ , __leaf__)) vsnprintf (char *__restrict __s, size_t __n, const char *__restrict __fmt, __gnuc_va_list __ap)

{
  return __builtin___vsnprintf_chk (__s, __n, 2 - 1,
        __builtin_object_size (__s, 2 > 1), __fmt, __ap);
}





extern int __fprintf_chk (FILE *__restrict __stream, int __flag,
     const char *__restrict __format, ...);
extern int __printf_chk (int __flag, const char *__restrict __format, ...);
extern int __vfprintf_chk (FILE *__restrict __stream, int __flag,
      const char *__restrict __format, __gnuc_va_list __ap);
extern int __vprintf_chk (int __flag, const char *__restrict __format,
     __gnuc_va_list __ap);


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
fprintf (FILE *__restrict __stream, const char *__restrict __fmt, ...)
{
  return __fprintf_chk (__stream, 2 - 1, __fmt,
   __builtin_va_arg_pack ());
}

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
printf (const char *__restrict __fmt, ...)
{
  return __printf_chk (2 - 1, __fmt, __builtin_va_arg_pack ());
}







extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
vprintf (const char *__restrict __fmt, __gnuc_va_list __ap)
{

  return __vfprintf_chk (stdout, 2 - 1, __fmt, __ap);



}

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
vfprintf (FILE *__restrict __stream,
   const char *__restrict __fmt, __gnuc_va_list __ap)
{
  return __vfprintf_chk (__stream, 2 - 1, __fmt, __ap);
}


extern int __dprintf_chk (int __fd, int __flag, const char *__restrict __fmt,
     ...) __attribute__ ((__format__ (__printf__, 3, 4)));
extern int __vdprintf_chk (int __fd, int __flag,
      const char *__restrict __fmt, __gnuc_va_list __arg)
     __attribute__ ((__format__ (__printf__, 3, 0)));


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
dprintf (int __fd, const char *__restrict __fmt, ...)
{
  return __dprintf_chk (__fd, 2 - 1, __fmt,
   __builtin_va_arg_pack ());
}





extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
vdprintf (int __fd, const char *__restrict __fmt, __gnuc_va_list __ap)
{
  return __vdprintf_chk (__fd, 2 - 1, __fmt, __ap);
}
# 240 "/usr/include/x86_64-linux-gnu/bits/stdio2.h" 3 4
extern char *__fgets_chk (char *__restrict __s, size_t __size, int __n,
     FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));
extern char *__fgets_alias (char *__restrict __s, int __n, FILE *__restrict __stream) __asm__ ("" "fgets")

                                        __attribute__ ((__warn_unused_result__));
extern char *__fgets_chk_warn (char *__restrict __s, size_t __size, int __n, FILE *__restrict __stream) __asm__ ("" "__fgets_chk")


     __attribute__ ((__warn_unused_result__)) __attribute__((__warning__ ("fgets called with bigger size than length " "of destination buffer")))
                                 ;

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) __attribute__ ((__warn_unused_result__)) char *
fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
{
  if (__builtin_object_size (__s, 2 > 1) != (size_t) -1)
    {
      if (!__builtin_constant_p (__n) || __n <= 0)
 return __fgets_chk (__s, __builtin_object_size (__s, 2 > 1), __n, __stream);

      if ((size_t) __n > __builtin_object_size (__s, 2 > 1))
 return __fgets_chk_warn (__s, __builtin_object_size (__s, 2 > 1), __n, __stream);
    }
  return __fgets_alias (__s, __n, __stream);
}

extern size_t __fread_chk (void *__restrict __ptr, size_t __ptrlen,
      size_t __size, size_t __n,
      FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));
extern size_t __fread_alias (void *__restrict __ptr, size_t __size, size_t __n, FILE *__restrict __stream) __asm__ ("" "fread")


            __attribute__ ((__warn_unused_result__));
extern size_t __fread_chk_warn (void *__restrict __ptr, size_t __ptrlen, size_t __size, size_t __n, FILE *__restrict __stream) __asm__ ("" "__fread_chk")




     __attribute__ ((__warn_unused_result__)) __attribute__((__warning__ ("fread called with bigger size * nmemb than length " "of destination buffer")))
                                 ;

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) __attribute__ ((__warn_unused_result__)) size_t
fread (void *__restrict __ptr, size_t __size, size_t __n,
       FILE *__restrict __stream)
{
  if (__builtin_object_size (__ptr, 0) != (size_t) -1)
    {
      if (!__builtin_constant_p (__size)
   || !__builtin_constant_p (__n)
   || (__size | __n) >= (((size_t) 1) << (8 * sizeof (size_t) / 2)))
 return __fread_chk (__ptr, __builtin_object_size (__ptr, 0), __size, __n, __stream);

      if (__size * __n > __builtin_object_size (__ptr, 0))
 return __fread_chk_warn (__ptr, __builtin_object_size (__ptr, 0), __size, __n, __stream);
    }
  return __fread_alias (__ptr, __size, __n, __stream);
}
# 326 "/usr/include/x86_64-linux-gnu/bits/stdio2.h" 3 4
extern size_t __fread_unlocked_chk (void *__restrict __ptr, size_t __ptrlen,
        size_t __size, size_t __n,
        FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));
extern size_t __fread_unlocked_alias (void *__restrict __ptr, size_t __size, size_t __n, FILE *__restrict __stream) __asm__ ("" "fread_unlocked")


                     __attribute__ ((__warn_unused_result__));
extern size_t __fread_unlocked_chk_warn (void *__restrict __ptr, size_t __ptrlen, size_t __size, size_t __n, FILE *__restrict __stream) __asm__ ("" "__fread_unlocked_chk")




     __attribute__ ((__warn_unused_result__)) __attribute__((__warning__ ("fread_unlocked called with bigger size * nmemb than " "length of destination buffer")))
                                        ;

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) __attribute__ ((__warn_unused_result__)) size_t
fread_unlocked (void *__restrict __ptr, size_t __size, size_t __n,
  FILE *__restrict __stream)
{
  if (__builtin_object_size (__ptr, 0) != (size_t) -1)
    {
      if (!__builtin_constant_p (__size)
   || !__builtin_constant_p (__n)
   || (__size | __n) >= (((size_t) 1) << (8 * sizeof (size_t) / 2)))
 return __fread_unlocked_chk (__ptr, __builtin_object_size (__ptr, 0), __size, __n,
         __stream);

      if (__size * __n > __builtin_object_size (__ptr, 0))
 return __fread_unlocked_chk_warn (__ptr, __builtin_object_size (__ptr, 0), __size, __n,
       __stream);
    }


  if (__builtin_constant_p (__size)
      && __builtin_constant_p (__n)
      && (__size | __n) < (((size_t) 1) << (8 * sizeof (size_t) / 2))
      && __size * __n <= 8)
    {
      size_t __cnt = __size * __n;
      char *__cptr = (char *) __ptr;
      if (__cnt == 0)
 return 0;

      for (; __cnt > 0; --__cnt)
 {
   int __c = (__builtin_expect (((__stream)->_IO_read_ptr >= (__stream)->_IO_read_end), 0) ? __uflow (__stream) : *(unsigned char *) (__stream)->_IO_read_ptr++);
   if (__c == (-1))
     break;
   *__cptr++ = __c;
 }
      return (__cptr - (char *) __ptr) / __size;
    }

  return __fread_unlocked_alias (__ptr, __size, __n, __stream);
}
# 863 "/usr/include/stdio.h" 2 3 4






# 25 "../include/pelib/structure.h" 2
# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h" 1 3 4
# 149 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h" 3 4
typedef long int ptrdiff_t;
# 426 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h" 3 4
typedef struct {
  long long __max_align_ll __attribute__((__aligned__(__alignof__(long long))));
  long double __max_align_ld __attribute__((__aligned__(__alignof__(long double))));
# 437 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h" 3 4
} max_align_t;
# 26 "../include/pelib/structure.h" 2

# 1 "../include/pelib/template.h" 1
# 28 "../include/pelib/structure.h" 2
# 59 "../include/pelib/structure.h"

# 59 "../include/pelib/structure.h"
string *
pelib_string_alloc_struct();





int
pelib_string_alloc_buffer(string* obj, size_t n);







int
pelib_string_set_buffer(string* obj, void* buffer, size_t n);



string *
pelib_string_alloc();





string *
pelib_string_alloc_collection(size_t n);






string *
pelib_string_alloc_from(void* buffer, size_t n);





int
pelib_string_init(string *obj);





int
pelib_string_copy(string src, string* dst);





int
pelib_string_free_struct(string *obj);





int
pelib_string_free_buffer(string *);




int
pelib_string_free(string *);




int
pelib_string_destroy(string);




int
pelib_string_compare(string a, string b);






FILE*
pelib_string_printf(FILE* str, string obj);







FILE*
pelib_string_printf_detail(FILE* str, string obj, int lvl);






size_t
pelib_string_fwrite(string obj, FILE* str);






size_t
pelib_string_fread(string* obj, FILE* str);


char*
pelib_string_string(string);





char*
pelib_string_string_detail(string, int);
# 31 "../include/pelib/string.h" 2



# 1 "../include/pelib/iterator.h" 1
# 40 "../include/pelib/iterator.h"
struct pelib_iterator_string
{
 struct pelib_iterator_string *previous, *next;
 string value;
};
typedef struct pelib_iterator_string pelib_iterator_string_t;

pelib_iterator_string_t*
pelib_pelib_iterator_string_next(pelib_iterator_string_t*);

string
pelib_pelib_iterator_string_read(pelib_iterator_string_t*);

size_t
pelib_pelib_iterator_string_distance(pelib_iterator_string_t *start, pelib_iterator_string_t *stop);


# 1 "../include/pelib/structure.h" 1
# 25 "../include/pelib/structure.h"
# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h" 1 3 4
# 26 "../include/pelib/structure.h" 2
# 59 "../include/pelib/structure.h"
pelib_iterator_string_t *
pelib_pelib_iterator_string_t_alloc_struct();





int
pelib_pelib_iterator_string_t_alloc_buffer(pelib_iterator_string_t* obj, size_t n);







int
pelib_pelib_iterator_string_t_set_buffer(pelib_iterator_string_t* obj, void* buffer, size_t n);



pelib_iterator_string_t *
pelib_pelib_iterator_string_t_alloc();





pelib_iterator_string_t *
pelib_pelib_iterator_string_t_alloc_collection(size_t n);






pelib_iterator_string_t *
pelib_pelib_iterator_string_t_alloc_from(void* buffer, size_t n);





int
pelib_pelib_iterator_string_t_init(pelib_iterator_string_t *obj);





int
pelib_pelib_iterator_string_t_copy(pelib_iterator_string_t src, pelib_iterator_string_t* dst);





int
pelib_pelib_iterator_string_t_free_struct(pelib_iterator_string_t *obj);





int
pelib_pelib_iterator_string_t_free_buffer(pelib_iterator_string_t *);




int
pelib_pelib_iterator_string_t_free(pelib_iterator_string_t *);




int
pelib_pelib_iterator_string_t_destroy(pelib_iterator_string_t);




int
pelib_pelib_iterator_string_t_compare(pelib_iterator_string_t a, pelib_iterator_string_t b);






FILE*
pelib_pelib_iterator_string_t_printf(FILE* str, pelib_iterator_string_t obj);







FILE*
pelib_pelib_iterator_string_t_printf_detail(FILE* str, pelib_iterator_string_t obj, int lvl);






size_t
pelib_pelib_iterator_string_t_fwrite(pelib_iterator_string_t obj, FILE* str);






size_t
pelib_pelib_iterator_string_t_fread(pelib_iterator_string_t* obj, FILE* str);


char*
pelib_pelib_iterator_string_t_string(pelib_iterator_string_t);





char*
pelib_pelib_iterator_string_t_string_detail(pelib_iterator_string_t, int);
# 58 "../include/pelib/iterator.h" 2
# 35 "../include/pelib/string.h" 2



# 1 "../include/pelib/set.h" 1
# 40 "../include/pelib/set.h"
struct pelib_set_string
{
 pelib_iterator_string_t *first, *last, *middle;
};
typedef struct pelib_set_string pelib_set_string_t;


# 1 "../include/pelib/structure.h" 1
# 25 "../include/pelib/structure.h"
# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h" 1 3 4
# 26 "../include/pelib/structure.h" 2
# 59 "../include/pelib/structure.h"
pelib_set_string_t *
pelib_pelib_set_string_t_alloc_struct();





int
pelib_pelib_set_string_t_alloc_buffer(pelib_set_string_t* obj, size_t n);







int
pelib_pelib_set_string_t_set_buffer(pelib_set_string_t* obj, void* buffer, size_t n);



pelib_set_string_t *
pelib_pelib_set_string_t_alloc();





pelib_set_string_t *
pelib_pelib_set_string_t_alloc_collection(size_t n);






pelib_set_string_t *
pelib_pelib_set_string_t_alloc_from(void* buffer, size_t n);





int
pelib_pelib_set_string_t_init(pelib_set_string_t *obj);





int
pelib_pelib_set_string_t_copy(pelib_set_string_t src, pelib_set_string_t* dst);





int
pelib_pelib_set_string_t_free_struct(pelib_set_string_t *obj);





int
pelib_pelib_set_string_t_free_buffer(pelib_set_string_t *);




int
pelib_pelib_set_string_t_free(pelib_set_string_t *);




int
pelib_pelib_set_string_t_destroy(pelib_set_string_t);




int
pelib_pelib_set_string_t_compare(pelib_set_string_t a, pelib_set_string_t b);






FILE*
pelib_pelib_set_string_t_printf(FILE* str, pelib_set_string_t obj);







FILE*
pelib_pelib_set_string_t_printf_detail(FILE* str, pelib_set_string_t obj, int lvl);






size_t
pelib_pelib_set_string_t_fwrite(pelib_set_string_t obj, FILE* str);






size_t
pelib_pelib_set_string_t_fread(pelib_set_string_t* obj, FILE* str);


char*
pelib_pelib_set_string_t_string(pelib_set_string_t);





char*
pelib_pelib_set_string_t_string_detail(pelib_set_string_t, int);
# 48 "../include/pelib/set.h" 2


string*
pelib_pelib_set_string_first(pelib_set_string_t*);


string*
pelib_pelib_set_string_last(pelib_set_string_t*);


int
pelib_pelib_set_string_insert(pelib_set_string_t*, string);


string*
pelib_pelib_set_string_find(pelib_set_string_t*, string);




int
pelib_pelib_set_string_compare(pelib_set_string_t* a1, pelib_set_string_t* a2);
# 39 "../include/pelib/string.h" 2




# 1 "../include/pelib/pair.h" 1
# 36 "../include/pelib/pair.h"
struct pelib_pair_string_string
{
 string key;
 string value;
};
typedef struct pelib_pair_string_string pelib_pair_string_string_t;


# 1 "../include/pelib/structure.h" 1
# 25 "../include/pelib/structure.h"
# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h" 1 3 4
# 26 "../include/pelib/structure.h" 2
# 59 "../include/pelib/structure.h"
pelib_pair_string_string_t *
pelib_pelib_pair_string_string_t_alloc_struct();





int
pelib_pelib_pair_string_string_t_alloc_buffer(pelib_pair_string_string_t* obj, size_t n);







int
pelib_pelib_pair_string_string_t_set_buffer(pelib_pair_string_string_t* obj, void* buffer, size_t n);



pelib_pair_string_string_t *
pelib_pelib_pair_string_string_t_alloc();





pelib_pair_string_string_t *
pelib_pelib_pair_string_string_t_alloc_collection(size_t n);






pelib_pair_string_string_t *
pelib_pelib_pair_string_string_t_alloc_from(void* buffer, size_t n);





int
pelib_pelib_pair_string_string_t_init(pelib_pair_string_string_t *obj);





int
pelib_pelib_pair_string_string_t_copy(pelib_pair_string_string_t src, pelib_pair_string_string_t* dst);





int
pelib_pelib_pair_string_string_t_free_struct(pelib_pair_string_string_t *obj);





int
pelib_pelib_pair_string_string_t_free_buffer(pelib_pair_string_string_t *);




int
pelib_pelib_pair_string_string_t_free(pelib_pair_string_string_t *);




int
pelib_pelib_pair_string_string_t_destroy(pelib_pair_string_string_t);




int
pelib_pelib_pair_string_string_t_compare(pelib_pair_string_string_t a, pelib_pair_string_string_t b);






FILE*
pelib_pelib_pair_string_string_t_printf(FILE* str, pelib_pair_string_string_t obj);







FILE*
pelib_pelib_pair_string_string_t_printf_detail(FILE* str, pelib_pair_string_string_t obj, int lvl);






size_t
pelib_pelib_pair_string_string_t_fwrite(pelib_pair_string_string_t obj, FILE* str);






size_t
pelib_pelib_pair_string_string_t_fread(pelib_pair_string_string_t* obj, FILE* str);


char*
pelib_pelib_pair_string_string_t_string(pelib_pair_string_string_t);





char*
pelib_pelib_pair_string_string_t_string_detail(pelib_pair_string_string_t, int);
# 45 "../include/pelib/pair.h" 2
# 44 "../include/pelib/string.h" 2



# 1 "../include/pelib/iterator.h" 1
# 40 "../include/pelib/iterator.h"
struct pelib_iterator_pelib_pair_string_string_t
{
 struct pelib_iterator_pelib_pair_string_string_t *previous, *next;
 pelib_pair_string_string_t value;
};
typedef struct pelib_iterator_pelib_pair_string_string_t pelib_iterator_pelib_pair_string_string_t_t;

pelib_iterator_pelib_pair_string_string_t_t*
pelib_pelib_iterator_pelib_pair_string_string_t_next(pelib_iterator_pelib_pair_string_string_t_t*);

pelib_pair_string_string_t
pelib_pelib_iterator_pelib_pair_string_string_t_read(pelib_iterator_pelib_pair_string_string_t_t*);

size_t
pelib_pelib_iterator_pelib_pair_string_string_t_distance(pelib_iterator_pelib_pair_string_string_t_t *start, pelib_iterator_pelib_pair_string_string_t_t *stop);


# 1 "../include/pelib/structure.h" 1
# 25 "../include/pelib/structure.h"
# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h" 1 3 4
# 26 "../include/pelib/structure.h" 2
# 59 "../include/pelib/structure.h"
pelib_iterator_pelib_pair_string_string_t_t *
pelib_pelib_iterator_pelib_pair_string_string_t_t_alloc_struct();





int
pelib_pelib_iterator_pelib_pair_string_string_t_t_alloc_buffer(pelib_iterator_pelib_pair_string_string_t_t* obj, size_t n);







int
pelib_pelib_iterator_pelib_pair_string_string_t_t_set_buffer(pelib_iterator_pelib_pair_string_string_t_t* obj, void* buffer, size_t n);



pelib_iterator_pelib_pair_string_string_t_t *
pelib_pelib_iterator_pelib_pair_string_string_t_t_alloc();





pelib_iterator_pelib_pair_string_string_t_t *
pelib_pelib_iterator_pelib_pair_string_string_t_t_alloc_collection(size_t n);






pelib_iterator_pelib_pair_string_string_t_t *
pelib_pelib_iterator_pelib_pair_string_string_t_t_alloc_from(void* buffer, size_t n);





int
pelib_pelib_iterator_pelib_pair_string_string_t_t_init(pelib_iterator_pelib_pair_string_string_t_t *obj);





int
pelib_pelib_iterator_pelib_pair_string_string_t_t_copy(pelib_iterator_pelib_pair_string_string_t_t src, pelib_iterator_pelib_pair_string_string_t_t* dst);





int
pelib_pelib_iterator_pelib_pair_string_string_t_t_free_struct(pelib_iterator_pelib_pair_string_string_t_t *obj);





int
pelib_pelib_iterator_pelib_pair_string_string_t_t_free_buffer(pelib_iterator_pelib_pair_string_string_t_t *);




int
pelib_pelib_iterator_pelib_pair_string_string_t_t_free(pelib_iterator_pelib_pair_string_string_t_t *);




int
pelib_pelib_iterator_pelib_pair_string_string_t_t_destroy(pelib_iterator_pelib_pair_string_string_t_t);




int
pelib_pelib_iterator_pelib_pair_string_string_t_t_compare(pelib_iterator_pelib_pair_string_string_t_t a, pelib_iterator_pelib_pair_string_string_t_t b);






FILE*
pelib_pelib_iterator_pelib_pair_string_string_t_t_printf(FILE* str, pelib_iterator_pelib_pair_string_string_t_t obj);







FILE*
pelib_pelib_iterator_pelib_pair_string_string_t_t_printf_detail(FILE* str, pelib_iterator_pelib_pair_string_string_t_t obj, int lvl);






size_t
pelib_pelib_iterator_pelib_pair_string_string_t_t_fwrite(pelib_iterator_pelib_pair_string_string_t_t obj, FILE* str);






size_t
pelib_pelib_iterator_pelib_pair_string_string_t_t_fread(pelib_iterator_pelib_pair_string_string_t_t* obj, FILE* str);


char*
pelib_pelib_iterator_pelib_pair_string_string_t_t_string(pelib_iterator_pelib_pair_string_string_t_t);





char*
pelib_pelib_iterator_pelib_pair_string_string_t_t_string_detail(pelib_iterator_pelib_pair_string_string_t_t, int);
# 58 "../include/pelib/iterator.h" 2
# 48 "../include/pelib/string.h" 2




# 1 "../include/pelib/map.h" 1
# 58 "../include/pelib/map.h"
struct map_string_string
{
 pelib_iterator_pelib_pair_string_string_t_t *first, *last, *middle;
};
typedef struct map_string_string map_string_string_t;
typedef struct pelib_iterator_pelib_pair_string_string_t map_pelib_iterator_pelib_pair_string_string_t_t;


# 1 "../include/pelib/structure.h" 1
# 25 "../include/pelib/structure.h"
# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h" 1 3 4
# 26 "../include/pelib/structure.h" 2
# 59 "../include/pelib/structure.h"
map_string_string_t *
pelib_map_string_string_t_alloc_struct();





int
pelib_map_string_string_t_alloc_buffer(map_string_string_t* obj, size_t n);







int
pelib_map_string_string_t_set_buffer(map_string_string_t* obj, void* buffer, size_t n);



map_string_string_t *
pelib_map_string_string_t_alloc();





map_string_string_t *
pelib_map_string_string_t_alloc_collection(size_t n);






map_string_string_t *
pelib_map_string_string_t_alloc_from(void* buffer, size_t n);





int
pelib_map_string_string_t_init(map_string_string_t *obj);





int
pelib_map_string_string_t_copy(map_string_string_t src, map_string_string_t* dst);





int
pelib_map_string_string_t_free_struct(map_string_string_t *obj);





int
pelib_map_string_string_t_free_buffer(map_string_string_t *);




int
pelib_map_string_string_t_free(map_string_string_t *);




int
pelib_map_string_string_t_destroy(map_string_string_t);




int
pelib_map_string_string_t_compare(map_string_string_t a, map_string_string_t b);






FILE*
pelib_map_string_string_t_printf(FILE* str, map_string_string_t obj);







FILE*
pelib_map_string_string_t_printf_detail(FILE* str, map_string_string_t obj, int lvl);






size_t
pelib_map_string_string_t_fwrite(map_string_string_t obj, FILE* str);






size_t
pelib_map_string_string_t_fread(map_string_string_t* obj, FILE* str);


char*
pelib_map_string_string_t_string(map_string_string_t);





char*
pelib_map_string_string_t_string_detail(map_string_string_t, int);
# 67 "../include/pelib/map.h" 2


pelib_iterator_pelib_pair_string_string_t_t*
pelib_map_string_string_begin(map_string_string_t*);


pelib_iterator_pelib_pair_string_string_t_t*
pelib_map_string_string_end(map_string_string_t*);


int
pelib_map_string_string_insert(map_string_string_t*, pelib_pair_string_string_t);


pelib_iterator_pelib_pair_string_string_t_t*
pelib_map_string_string_find(map_string_string_t*, string);




int
pelib_map_string_string_compare(map_string_string_t* a1, map_string_string_t* a2);

pelib_iterator_pelib_pair_string_string_t_t*
pelib_map_string_string_next(pelib_iterator_pelib_pair_string_string_t_t*);

pelib_pair_string_string_t
pelib_map_string_string_read(pelib_iterator_pelib_pair_string_string_t_t*);

size_t
pelib_map_string_string_size(map_string_string_t*);
# 53 "../include/pelib/string.h" 2



# 1 "../include/pelib/set.h" 1
# 40 "../include/pelib/set.h"
struct pelib_set_pelib_pair_string_string_t
{
 pelib_iterator_pelib_pair_string_string_t_t *first, *last, *middle;
};
typedef struct pelib_set_pelib_pair_string_string_t pelib_set_pelib_pair_string_string_t_t;


# 1 "../include/pelib/structure.h" 1
# 25 "../include/pelib/structure.h"
# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h" 1 3 4
# 26 "../include/pelib/structure.h" 2
# 59 "../include/pelib/structure.h"
pelib_set_pelib_pair_string_string_t_t *
pelib_pelib_set_pelib_pair_string_string_t_t_alloc_struct();





int
pelib_pelib_set_pelib_pair_string_string_t_t_alloc_buffer(pelib_set_pelib_pair_string_string_t_t* obj, size_t n);







int
pelib_pelib_set_pelib_pair_string_string_t_t_set_buffer(pelib_set_pelib_pair_string_string_t_t* obj, void* buffer, size_t n);



pelib_set_pelib_pair_string_string_t_t *
pelib_pelib_set_pelib_pair_string_string_t_t_alloc();





pelib_set_pelib_pair_string_string_t_t *
pelib_pelib_set_pelib_pair_string_string_t_t_alloc_collection(size_t n);






pelib_set_pelib_pair_string_string_t_t *
pelib_pelib_set_pelib_pair_string_string_t_t_alloc_from(void* buffer, size_t n);





int
pelib_pelib_set_pelib_pair_string_string_t_t_init(pelib_set_pelib_pair_string_string_t_t *obj);





int
pelib_pelib_set_pelib_pair_string_string_t_t_copy(pelib_set_pelib_pair_string_string_t_t src, pelib_set_pelib_pair_string_string_t_t* dst);





int
pelib_pelib_set_pelib_pair_string_string_t_t_free_struct(pelib_set_pelib_pair_string_string_t_t *obj);





int
pelib_pelib_set_pelib_pair_string_string_t_t_free_buffer(pelib_set_pelib_pair_string_string_t_t *);




int
pelib_pelib_set_pelib_pair_string_string_t_t_free(pelib_set_pelib_pair_string_string_t_t *);




int
pelib_pelib_set_pelib_pair_string_string_t_t_destroy(pelib_set_pelib_pair_string_string_t_t);




int
pelib_pelib_set_pelib_pair_string_string_t_t_compare(pelib_set_pelib_pair_string_string_t_t a, pelib_set_pelib_pair_string_string_t_t b);






FILE*
pelib_pelib_set_pelib_pair_string_string_t_t_printf(FILE* str, pelib_set_pelib_pair_string_string_t_t obj);







FILE*
pelib_pelib_set_pelib_pair_string_string_t_t_printf_detail(FILE* str, pelib_set_pelib_pair_string_string_t_t obj, int lvl);






size_t
pelib_pelib_set_pelib_pair_string_string_t_t_fwrite(pelib_set_pelib_pair_string_string_t_t obj, FILE* str);






size_t
pelib_pelib_set_pelib_pair_string_string_t_t_fread(pelib_set_pelib_pair_string_string_t_t* obj, FILE* str);


char*
pelib_pelib_set_pelib_pair_string_string_t_t_string(pelib_set_pelib_pair_string_string_t_t);





char*
pelib_pelib_set_pelib_pair_string_string_t_t_string_detail(pelib_set_pelib_pair_string_string_t_t, int);
# 48 "../include/pelib/set.h" 2


pelib_pair_string_string_t*
pelib_pelib_set_pelib_pair_string_string_t_first(pelib_set_pelib_pair_string_string_t_t*);


pelib_pair_string_string_t*
pelib_pelib_set_pelib_pair_string_string_t_last(pelib_set_pelib_pair_string_string_t_t*);


int
pelib_pelib_set_pelib_pair_string_string_t_insert(pelib_set_pelib_pair_string_string_t_t*, pelib_pair_string_string_t);


pelib_pair_string_string_t*
pelib_pelib_set_pelib_pair_string_string_t_find(pelib_set_pelib_pair_string_string_t_t*, pelib_pair_string_string_t);




int
pelib_pelib_set_pelib_pair_string_string_t_compare(pelib_set_pelib_pair_string_string_t_t* a1, pelib_set_pelib_pair_string_string_t_t* a2);
# 57 "../include/pelib/string.h" 2
# 29 "const_string.c" 2
# 1 "../include/pelib/const_string.h" 1
# 27 "../include/pelib/const_string.h"
typedef const char* const_string;


# 1 "../include/pelib/structure.h" 1
# 25 "../include/pelib/structure.h"
# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h" 1 3 4
# 26 "../include/pelib/structure.h" 2
# 59 "../include/pelib/structure.h"
const_string *
pelib_const_string_alloc_struct();





int
pelib_const_string_alloc_buffer(const_string* obj, size_t n);







int
pelib_const_string_set_buffer(const_string* obj, void* buffer, size_t n);



const_string *
pelib_const_string_alloc();





const_string *
pelib_const_string_alloc_collection(size_t n);






const_string *
pelib_const_string_alloc_from(void* buffer, size_t n);





int
pelib_const_string_init(const_string *obj);





int
pelib_const_string_copy(const_string src, const_string* dst);





int
pelib_const_string_free_struct(const_string *obj);





int
pelib_const_string_free_buffer(const_string *);




int
pelib_const_string_free(const_string *);




int
pelib_const_string_destroy(const_string);




int
pelib_const_string_compare(const_string a, const_string b);






FILE*
pelib_const_string_printf(FILE* str, const_string obj);







FILE*
pelib_const_string_printf_detail(FILE* str, const_string obj, int lvl);






size_t
pelib_const_string_fwrite(const_string obj, FILE* str);






size_t
pelib_const_string_fread(const_string* obj, FILE* str);


char*
pelib_const_string_string(const_string);





char*
pelib_const_string_string_detail(const_string, int);
# 31 "../include/pelib/const_string.h" 2



# 1 "../include/pelib/iterator.h" 1
# 40 "../include/pelib/iterator.h"
struct pelib_iterator_const_string
{
 struct pelib_iterator_const_string *previous, *next;
 const_string value;
};
typedef struct pelib_iterator_const_string pelib_iterator_const_string_t;

pelib_iterator_const_string_t*
pelib_pelib_iterator_const_string_next(pelib_iterator_const_string_t*);

const_string
pelib_pelib_iterator_const_string_read(pelib_iterator_const_string_t*);

size_t
pelib_pelib_iterator_const_string_distance(pelib_iterator_const_string_t *start, pelib_iterator_const_string_t *stop);


# 1 "../include/pelib/structure.h" 1
# 25 "../include/pelib/structure.h"
# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h" 1 3 4
# 26 "../include/pelib/structure.h" 2
# 59 "../include/pelib/structure.h"
pelib_iterator_const_string_t *
pelib_pelib_iterator_const_string_t_alloc_struct();





int
pelib_pelib_iterator_const_string_t_alloc_buffer(pelib_iterator_const_string_t* obj, size_t n);







int
pelib_pelib_iterator_const_string_t_set_buffer(pelib_iterator_const_string_t* obj, void* buffer, size_t n);



pelib_iterator_const_string_t *
pelib_pelib_iterator_const_string_t_alloc();





pelib_iterator_const_string_t *
pelib_pelib_iterator_const_string_t_alloc_collection(size_t n);






pelib_iterator_const_string_t *
pelib_pelib_iterator_const_string_t_alloc_from(void* buffer, size_t n);





int
pelib_pelib_iterator_const_string_t_init(pelib_iterator_const_string_t *obj);





int
pelib_pelib_iterator_const_string_t_copy(pelib_iterator_const_string_t src, pelib_iterator_const_string_t* dst);





int
pelib_pelib_iterator_const_string_t_free_struct(pelib_iterator_const_string_t *obj);





int
pelib_pelib_iterator_const_string_t_free_buffer(pelib_iterator_const_string_t *);




int
pelib_pelib_iterator_const_string_t_free(pelib_iterator_const_string_t *);




int
pelib_pelib_iterator_const_string_t_destroy(pelib_iterator_const_string_t);




int
pelib_pelib_iterator_const_string_t_compare(pelib_iterator_const_string_t a, pelib_iterator_const_string_t b);






FILE*
pelib_pelib_iterator_const_string_t_printf(FILE* str, pelib_iterator_const_string_t obj);







FILE*
pelib_pelib_iterator_const_string_t_printf_detail(FILE* str, pelib_iterator_const_string_t obj, int lvl);






size_t
pelib_pelib_iterator_const_string_t_fwrite(pelib_iterator_const_string_t obj, FILE* str);






size_t
pelib_pelib_iterator_const_string_t_fread(pelib_iterator_const_string_t* obj, FILE* str);


char*
pelib_pelib_iterator_const_string_t_string(pelib_iterator_const_string_t);





char*
pelib_pelib_iterator_const_string_t_string_detail(pelib_iterator_const_string_t, int);
# 58 "../include/pelib/iterator.h" 2
# 35 "../include/pelib/const_string.h" 2



# 1 "../include/pelib/set.h" 1
# 40 "../include/pelib/set.h"
struct pelib_set_const_string
{
 pelib_iterator_const_string_t *first, *last, *middle;
};
typedef struct pelib_set_const_string pelib_set_const_string_t;


# 1 "../include/pelib/structure.h" 1
# 25 "../include/pelib/structure.h"
# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h" 1 3 4
# 26 "../include/pelib/structure.h" 2
# 59 "../include/pelib/structure.h"
pelib_set_const_string_t *
pelib_pelib_set_const_string_t_alloc_struct();





int
pelib_pelib_set_const_string_t_alloc_buffer(pelib_set_const_string_t* obj, size_t n);







int
pelib_pelib_set_const_string_t_set_buffer(pelib_set_const_string_t* obj, void* buffer, size_t n);



pelib_set_const_string_t *
pelib_pelib_set_const_string_t_alloc();





pelib_set_const_string_t *
pelib_pelib_set_const_string_t_alloc_collection(size_t n);






pelib_set_const_string_t *
pelib_pelib_set_const_string_t_alloc_from(void* buffer, size_t n);





int
pelib_pelib_set_const_string_t_init(pelib_set_const_string_t *obj);





int
pelib_pelib_set_const_string_t_copy(pelib_set_const_string_t src, pelib_set_const_string_t* dst);





int
pelib_pelib_set_const_string_t_free_struct(pelib_set_const_string_t *obj);





int
pelib_pelib_set_const_string_t_free_buffer(pelib_set_const_string_t *);




int
pelib_pelib_set_const_string_t_free(pelib_set_const_string_t *);




int
pelib_pelib_set_const_string_t_destroy(pelib_set_const_string_t);




int
pelib_pelib_set_const_string_t_compare(pelib_set_const_string_t a, pelib_set_const_string_t b);






FILE*
pelib_pelib_set_const_string_t_printf(FILE* str, pelib_set_const_string_t obj);







FILE*
pelib_pelib_set_const_string_t_printf_detail(FILE* str, pelib_set_const_string_t obj, int lvl);






size_t
pelib_pelib_set_const_string_t_fwrite(pelib_set_const_string_t obj, FILE* str);






size_t
pelib_pelib_set_const_string_t_fread(pelib_set_const_string_t* obj, FILE* str);


char*
pelib_pelib_set_const_string_t_string(pelib_set_const_string_t);





char*
pelib_pelib_set_const_string_t_string_detail(pelib_set_const_string_t, int);
# 48 "../include/pelib/set.h" 2


const_string*
pelib_pelib_set_const_string_first(pelib_set_const_string_t*);


const_string*
pelib_pelib_set_const_string_last(pelib_set_const_string_t*);


int
pelib_pelib_set_const_string_insert(pelib_set_const_string_t*, const_string);


const_string*
pelib_pelib_set_const_string_find(pelib_set_const_string_t*, const_string);




int
pelib_pelib_set_const_string_compare(pelib_set_const_string_t* a1, pelib_set_const_string_t* a2);
# 39 "../include/pelib/const_string.h" 2




# 1 "../include/pelib/pair.h" 1
# 36 "../include/pelib/pair.h"
struct pelib_pair_const_string_const_string
{
 const_string key;
 const_string value;
};
typedef struct pelib_pair_const_string_const_string pelib_pair_const_string_const_string_t;


# 1 "../include/pelib/structure.h" 1
# 25 "../include/pelib/structure.h"
# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h" 1 3 4
# 26 "../include/pelib/structure.h" 2
# 59 "../include/pelib/structure.h"
pelib_pair_const_string_const_string_t *
pelib_pelib_pair_const_string_const_string_t_alloc_struct();





int
pelib_pelib_pair_const_string_const_string_t_alloc_buffer(pelib_pair_const_string_const_string_t* obj, size_t n);







int
pelib_pelib_pair_const_string_const_string_t_set_buffer(pelib_pair_const_string_const_string_t* obj, void* buffer, size_t n);



pelib_pair_const_string_const_string_t *
pelib_pelib_pair_const_string_const_string_t_alloc();





pelib_pair_const_string_const_string_t *
pelib_pelib_pair_const_string_const_string_t_alloc_collection(size_t n);






pelib_pair_const_string_const_string_t *
pelib_pelib_pair_const_string_const_string_t_alloc_from(void* buffer, size_t n);





int
pelib_pelib_pair_const_string_const_string_t_init(pelib_pair_const_string_const_string_t *obj);





int
pelib_pelib_pair_const_string_const_string_t_copy(pelib_pair_const_string_const_string_t src, pelib_pair_const_string_const_string_t* dst);





int
pelib_pelib_pair_const_string_const_string_t_free_struct(pelib_pair_const_string_const_string_t *obj);





int
pelib_pelib_pair_const_string_const_string_t_free_buffer(pelib_pair_const_string_const_string_t *);




int
pelib_pelib_pair_const_string_const_string_t_free(pelib_pair_const_string_const_string_t *);




int
pelib_pelib_pair_const_string_const_string_t_destroy(pelib_pair_const_string_const_string_t);




int
pelib_pelib_pair_const_string_const_string_t_compare(pelib_pair_const_string_const_string_t a, pelib_pair_const_string_const_string_t b);






FILE*
pelib_pelib_pair_const_string_const_string_t_printf(FILE* str, pelib_pair_const_string_const_string_t obj);







FILE*
pelib_pelib_pair_const_string_const_string_t_printf_detail(FILE* str, pelib_pair_const_string_const_string_t obj, int lvl);






size_t
pelib_pelib_pair_const_string_const_string_t_fwrite(pelib_pair_const_string_const_string_t obj, FILE* str);






size_t
pelib_pelib_pair_const_string_const_string_t_fread(pelib_pair_const_string_const_string_t* obj, FILE* str);


char*
pelib_pelib_pair_const_string_const_string_t_string(pelib_pair_const_string_const_string_t);





char*
pelib_pelib_pair_const_string_const_string_t_string_detail(pelib_pair_const_string_const_string_t, int);
# 45 "../include/pelib/pair.h" 2
# 44 "../include/pelib/const_string.h" 2



# 1 "../include/pelib/iterator.h" 1
# 40 "../include/pelib/iterator.h"
struct pelib_iterator_pelib_pair_const_string_const_string_t
{
 struct pelib_iterator_pelib_pair_const_string_const_string_t *previous, *next;
 pelib_pair_const_string_const_string_t value;
};
typedef struct pelib_iterator_pelib_pair_const_string_const_string_t pelib_iterator_pelib_pair_const_string_const_string_t_t;

pelib_iterator_pelib_pair_const_string_const_string_t_t*
pelib_pelib_iterator_pelib_pair_const_string_const_string_t_next(pelib_iterator_pelib_pair_const_string_const_string_t_t*);

pelib_pair_const_string_const_string_t
pelib_pelib_iterator_pelib_pair_const_string_const_string_t_read(pelib_iterator_pelib_pair_const_string_const_string_t_t*);

size_t
pelib_pelib_iterator_pelib_pair_const_string_const_string_t_distance(pelib_iterator_pelib_pair_const_string_const_string_t_t *start, pelib_iterator_pelib_pair_const_string_const_string_t_t *stop);


# 1 "../include/pelib/structure.h" 1
# 25 "../include/pelib/structure.h"
# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h" 1 3 4
# 26 "../include/pelib/structure.h" 2
# 59 "../include/pelib/structure.h"
pelib_iterator_pelib_pair_const_string_const_string_t_t *
pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_alloc_struct();





int
pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_alloc_buffer(pelib_iterator_pelib_pair_const_string_const_string_t_t* obj, size_t n);







int
pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_set_buffer(pelib_iterator_pelib_pair_const_string_const_string_t_t* obj, void* buffer, size_t n);



pelib_iterator_pelib_pair_const_string_const_string_t_t *
pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_alloc();





pelib_iterator_pelib_pair_const_string_const_string_t_t *
pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_alloc_collection(size_t n);






pelib_iterator_pelib_pair_const_string_const_string_t_t *
pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_alloc_from(void* buffer, size_t n);





int
pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_init(pelib_iterator_pelib_pair_const_string_const_string_t_t *obj);





int
pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_copy(pelib_iterator_pelib_pair_const_string_const_string_t_t src, pelib_iterator_pelib_pair_const_string_const_string_t_t* dst);





int
pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_free_struct(pelib_iterator_pelib_pair_const_string_const_string_t_t *obj);





int
pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_free_buffer(pelib_iterator_pelib_pair_const_string_const_string_t_t *);




int
pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_free(pelib_iterator_pelib_pair_const_string_const_string_t_t *);




int
pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_destroy(pelib_iterator_pelib_pair_const_string_const_string_t_t);




int
pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_compare(pelib_iterator_pelib_pair_const_string_const_string_t_t a, pelib_iterator_pelib_pair_const_string_const_string_t_t b);






FILE*
pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_printf(FILE* str, pelib_iterator_pelib_pair_const_string_const_string_t_t obj);







FILE*
pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_printf_detail(FILE* str, pelib_iterator_pelib_pair_const_string_const_string_t_t obj, int lvl);






size_t
pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_fwrite(pelib_iterator_pelib_pair_const_string_const_string_t_t obj, FILE* str);






size_t
pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_fread(pelib_iterator_pelib_pair_const_string_const_string_t_t* obj, FILE* str);


char*
pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_string(pelib_iterator_pelib_pair_const_string_const_string_t_t);





char*
pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_string_detail(pelib_iterator_pelib_pair_const_string_const_string_t_t, int);
# 58 "../include/pelib/iterator.h" 2
# 48 "../include/pelib/const_string.h" 2




# 1 "../include/pelib/map.h" 1
# 58 "../include/pelib/map.h"
struct map_const_string_const_string
{
 pelib_iterator_pelib_pair_const_string_const_string_t_t *first, *last, *middle;
};
typedef struct map_const_string_const_string map_const_string_const_string_t;
typedef struct pelib_iterator_pelib_pair_const_string_const_string_t map_pelib_iterator_pelib_pair_const_string_const_string_t_t;


# 1 "../include/pelib/structure.h" 1
# 25 "../include/pelib/structure.h"
# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h" 1 3 4
# 26 "../include/pelib/structure.h" 2
# 59 "../include/pelib/structure.h"
map_const_string_const_string_t *
pelib_map_const_string_const_string_t_alloc_struct();





int
pelib_map_const_string_const_string_t_alloc_buffer(map_const_string_const_string_t* obj, size_t n);







int
pelib_map_const_string_const_string_t_set_buffer(map_const_string_const_string_t* obj, void* buffer, size_t n);



map_const_string_const_string_t *
pelib_map_const_string_const_string_t_alloc();





map_const_string_const_string_t *
pelib_map_const_string_const_string_t_alloc_collection(size_t n);






map_const_string_const_string_t *
pelib_map_const_string_const_string_t_alloc_from(void* buffer, size_t n);





int
pelib_map_const_string_const_string_t_init(map_const_string_const_string_t *obj);





int
pelib_map_const_string_const_string_t_copy(map_const_string_const_string_t src, map_const_string_const_string_t* dst);





int
pelib_map_const_string_const_string_t_free_struct(map_const_string_const_string_t *obj);





int
pelib_map_const_string_const_string_t_free_buffer(map_const_string_const_string_t *);




int
pelib_map_const_string_const_string_t_free(map_const_string_const_string_t *);




int
pelib_map_const_string_const_string_t_destroy(map_const_string_const_string_t);




int
pelib_map_const_string_const_string_t_compare(map_const_string_const_string_t a, map_const_string_const_string_t b);






FILE*
pelib_map_const_string_const_string_t_printf(FILE* str, map_const_string_const_string_t obj);







FILE*
pelib_map_const_string_const_string_t_printf_detail(FILE* str, map_const_string_const_string_t obj, int lvl);






size_t
pelib_map_const_string_const_string_t_fwrite(map_const_string_const_string_t obj, FILE* str);






size_t
pelib_map_const_string_const_string_t_fread(map_const_string_const_string_t* obj, FILE* str);


char*
pelib_map_const_string_const_string_t_string(map_const_string_const_string_t);





char*
pelib_map_const_string_const_string_t_string_detail(map_const_string_const_string_t, int);
# 67 "../include/pelib/map.h" 2


pelib_iterator_pelib_pair_const_string_const_string_t_t*
pelib_map_const_string_const_string_begin(map_const_string_const_string_t*);


pelib_iterator_pelib_pair_const_string_const_string_t_t*
pelib_map_const_string_const_string_end(map_const_string_const_string_t*);


int
pelib_map_const_string_const_string_insert(map_const_string_const_string_t*, pelib_pair_const_string_const_string_t);


pelib_iterator_pelib_pair_const_string_const_string_t_t*
pelib_map_const_string_const_string_find(map_const_string_const_string_t*, const_string);




int
pelib_map_const_string_const_string_compare(map_const_string_const_string_t* a1, map_const_string_const_string_t* a2);

pelib_iterator_pelib_pair_const_string_const_string_t_t*
pelib_map_const_string_const_string_next(pelib_iterator_pelib_pair_const_string_const_string_t_t*);

pelib_pair_const_string_const_string_t
pelib_map_const_string_const_string_read(pelib_iterator_pelib_pair_const_string_const_string_t_t*);

size_t
pelib_map_const_string_const_string_size(map_const_string_const_string_t*);
# 53 "../include/pelib/const_string.h" 2



# 1 "../include/pelib/set.h" 1
# 40 "../include/pelib/set.h"
struct pelib_set_pelib_pair_const_string_const_string_t
{
 pelib_iterator_pelib_pair_const_string_const_string_t_t *first, *last, *middle;
};
typedef struct pelib_set_pelib_pair_const_string_const_string_t pelib_set_pelib_pair_const_string_const_string_t_t;


# 1 "../include/pelib/structure.h" 1
# 25 "../include/pelib/structure.h"
# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h" 1 3 4
# 26 "../include/pelib/structure.h" 2
# 59 "../include/pelib/structure.h"
pelib_set_pelib_pair_const_string_const_string_t_t *
pelib_pelib_set_pelib_pair_const_string_const_string_t_t_alloc_struct();





int
pelib_pelib_set_pelib_pair_const_string_const_string_t_t_alloc_buffer(pelib_set_pelib_pair_const_string_const_string_t_t* obj, size_t n);







int
pelib_pelib_set_pelib_pair_const_string_const_string_t_t_set_buffer(pelib_set_pelib_pair_const_string_const_string_t_t* obj, void* buffer, size_t n);



pelib_set_pelib_pair_const_string_const_string_t_t *
pelib_pelib_set_pelib_pair_const_string_const_string_t_t_alloc();





pelib_set_pelib_pair_const_string_const_string_t_t *
pelib_pelib_set_pelib_pair_const_string_const_string_t_t_alloc_collection(size_t n);






pelib_set_pelib_pair_const_string_const_string_t_t *
pelib_pelib_set_pelib_pair_const_string_const_string_t_t_alloc_from(void* buffer, size_t n);





int
pelib_pelib_set_pelib_pair_const_string_const_string_t_t_init(pelib_set_pelib_pair_const_string_const_string_t_t *obj);





int
pelib_pelib_set_pelib_pair_const_string_const_string_t_t_copy(pelib_set_pelib_pair_const_string_const_string_t_t src, pelib_set_pelib_pair_const_string_const_string_t_t* dst);





int
pelib_pelib_set_pelib_pair_const_string_const_string_t_t_free_struct(pelib_set_pelib_pair_const_string_const_string_t_t *obj);





int
pelib_pelib_set_pelib_pair_const_string_const_string_t_t_free_buffer(pelib_set_pelib_pair_const_string_const_string_t_t *);




int
pelib_pelib_set_pelib_pair_const_string_const_string_t_t_free(pelib_set_pelib_pair_const_string_const_string_t_t *);




int
pelib_pelib_set_pelib_pair_const_string_const_string_t_t_destroy(pelib_set_pelib_pair_const_string_const_string_t_t);




int
pelib_pelib_set_pelib_pair_const_string_const_string_t_t_compare(pelib_set_pelib_pair_const_string_const_string_t_t a, pelib_set_pelib_pair_const_string_const_string_t_t b);






FILE*
pelib_pelib_set_pelib_pair_const_string_const_string_t_t_printf(FILE* str, pelib_set_pelib_pair_const_string_const_string_t_t obj);







FILE*
pelib_pelib_set_pelib_pair_const_string_const_string_t_t_printf_detail(FILE* str, pelib_set_pelib_pair_const_string_const_string_t_t obj, int lvl);






size_t
pelib_pelib_set_pelib_pair_const_string_const_string_t_t_fwrite(pelib_set_pelib_pair_const_string_const_string_t_t obj, FILE* str);






size_t
pelib_pelib_set_pelib_pair_const_string_const_string_t_t_fread(pelib_set_pelib_pair_const_string_const_string_t_t* obj, FILE* str);


char*
pelib_pelib_set_pelib_pair_const_string_const_string_t_t_string(pelib_set_pelib_pair_const_string_const_string_t_t);





char*
pelib_pelib_set_pelib_pair_const_string_const_string_t_t_string_detail(pelib_set_pelib_pair_const_string_const_string_t_t, int);
# 48 "../include/pelib/set.h" 2


pelib_pair_const_string_const_string_t*
pelib_pelib_set_pelib_pair_const_string_const_string_t_first(pelib_set_pelib_pair_const_string_const_string_t_t*);


pelib_pair_const_string_const_string_t*
pelib_pelib_set_pelib_pair_const_string_const_string_t_last(pelib_set_pelib_pair_const_string_const_string_t_t*);


int
pelib_pelib_set_pelib_pair_const_string_const_string_t_insert(pelib_set_pelib_pair_const_string_const_string_t_t*, pelib_pair_const_string_const_string_t);


pelib_pair_const_string_const_string_t*
pelib_pelib_set_pelib_pair_const_string_const_string_t_find(pelib_set_pelib_pair_const_string_const_string_t_t*, pelib_pair_const_string_const_string_t);




int
pelib_pelib_set_pelib_pair_const_string_const_string_t_compare(pelib_set_pelib_pair_const_string_const_string_t_t* a1, pelib_set_pelib_pair_const_string_const_string_t_t* a2);
# 57 "../include/pelib/const_string.h" 2
# 30 "const_string.c" 2
# 51 "const_string.c"
int
pelib_const_string_alloc_buffer(const_string *str, size_t n)
{
 *str = malloc(sizeof(char) * n);
 return (*str != 
# 55 "const_string.c" 3 4
                ((void *)0)
# 55 "const_string.c"
                    );
}

int
pelib_const_string_set_buffer(const_string *str, void* buffer, size_t n)
{
 *str = buffer;
 return 1;
}

int
pelib_const_string_init(const_string *val)
{
 *val = 
# 68 "const_string.c" 3 4
       ((void *)0)
# 68 "const_string.c"
           ;
 return 1;
}

int
pelib_const_string_destroy(const_string val)
{

 return 1;
}

int
pelib_const_string_compare(const_string a, const_string b)
{
 return strcmp(a, b);
}

int
pelib_const_string_copy(const_string a, const_string *b)
{

 return pelib_string_copy((string)a, (string*)b);
}

char*
pelib_const_string_string(const_string a)
{
 string cpy;
 pelib_string_alloc_buffer(&cpy, 1 + strlen(a) + 1 + 1);
 cpy[0] = '"';
 string cpy_ptr = &(cpy[1]);
 pelib_string_copy((string)a, &cpy_ptr);
 cpy[1 + strlen(a)] = '"';
 cpy[1 + strlen(a) + 1] = '\0';
 return cpy;
}

char*
pelib_const_string_string_detail(const_string a, int level)
{
 return pelib_const_string_string(a);
}

FILE*
pelib_const_string_printf(FILE* stream, const_string a)
{
 fprintf(stream, "%s\n", a);
 return stream;
}



# 1 "../include/pelib/set.c" 1
# 26 "../include/pelib/set.c"
# 1 "/usr/include/assert.h" 1 3 4
# 27 "../include/pelib/set.c" 2


# 1 "../include/pelib/size_t.h" 1
# 28 "../include/pelib/size_t.h"
# 1 "../include/pelib/structure.h" 1
# 25 "../include/pelib/structure.h"
# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h" 1 3 4
# 26 "../include/pelib/structure.h" 2
# 59 "../include/pelib/structure.h"
size_t *
pelib_size_t_alloc_struct();





int
pelib_size_t_alloc_buffer(size_t* obj, size_t n);







int
pelib_size_t_set_buffer(size_t* obj, void* buffer, size_t n);



size_t *
pelib_size_t_alloc();





size_t *
pelib_size_t_alloc_collection(size_t n);






size_t *
pelib_size_t_alloc_from(void* buffer, size_t n);





int
pelib_size_t_init(size_t *obj);





int
pelib_size_t_copy(size_t src, size_t* dst);





int
pelib_size_t_free_struct(size_t *obj);





int
pelib_size_t_free_buffer(size_t *);




int
pelib_size_t_free(size_t *);




int
pelib_size_t_destroy(size_t);




int
pelib_size_t_compare(size_t a, size_t b);






FILE*
pelib_size_t_printf(FILE* str, size_t obj);







FILE*
pelib_size_t_printf_detail(FILE* str, size_t obj, int lvl);






size_t
pelib_size_t_fwrite(size_t obj, FILE* str);






size_t
pelib_size_t_fread(size_t* obj, FILE* str);


char*
pelib_size_t_string(size_t);





char*
pelib_size_t_string_detail(size_t, int);
# 29 "../include/pelib/size_t.h" 2



# 1 "../include/pelib/stack.h" 1
# 24 "../include/pelib/stack.h"
# 1 "/usr/include/pthread.h" 1 3 4
# 23 "/usr/include/pthread.h" 3 4
# 1 "/usr/include/sched.h" 1 3 4
# 29 "/usr/include/sched.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h" 1 3 4
# 30 "/usr/include/sched.h" 2 3 4
# 43 "/usr/include/sched.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/sched.h" 1 3 4
# 75 "/usr/include/x86_64-linux-gnu/bits/sched.h" 3 4

# 75 "/usr/include/x86_64-linux-gnu/bits/sched.h" 3 4
struct sched_param
{
  int sched_priority;
};


# 97 "/usr/include/x86_64-linux-gnu/bits/sched.h" 3 4

# 44 "/usr/include/sched.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/cpu-set.h" 1 3 4
# 32 "/usr/include/x86_64-linux-gnu/bits/cpu-set.h" 3 4
typedef unsigned long int __cpu_mask;






typedef struct
{
  __cpu_mask __bits[1024 / (8 * sizeof (__cpu_mask))];
} cpu_set_t;
# 115 "/usr/include/x86_64-linux-gnu/bits/cpu-set.h" 3 4


extern int __sched_cpucount (size_t __setsize, const cpu_set_t *__setp)
     __attribute__ ((__nothrow__ , __leaf__));
extern cpu_set_t *__sched_cpualloc (size_t __count) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));
extern void __sched_cpufree (cpu_set_t *__set) __attribute__ ((__nothrow__ , __leaf__));


# 45 "/usr/include/sched.h" 2 3 4









extern int sched_setparam (__pid_t __pid, const struct sched_param *__param)
     __attribute__ ((__nothrow__ , __leaf__));


extern int sched_getparam (__pid_t __pid, struct sched_param *__param) __attribute__ ((__nothrow__ , __leaf__));


extern int sched_setscheduler (__pid_t __pid, int __policy,
          const struct sched_param *__param) __attribute__ ((__nothrow__ , __leaf__));


extern int sched_getscheduler (__pid_t __pid) __attribute__ ((__nothrow__ , __leaf__));


extern int sched_yield (void) __attribute__ ((__nothrow__ , __leaf__));


extern int sched_get_priority_max (int __algorithm) __attribute__ ((__nothrow__ , __leaf__));


extern int sched_get_priority_min (int __algorithm) __attribute__ ((__nothrow__ , __leaf__));


extern int sched_rr_get_interval (__pid_t __pid, struct timespec *__t) __attribute__ ((__nothrow__ , __leaf__));
# 129 "/usr/include/sched.h" 3 4

# 24 "/usr/include/pthread.h" 2 3 4
# 1 "/usr/include/time.h" 1 3 4
# 29 "/usr/include/time.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h" 1 3 4
# 30 "/usr/include/time.h" 2 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/time.h" 1 3 4
# 34 "/usr/include/time.h" 2 3 4





# 1 "/usr/include/x86_64-linux-gnu/bits/types/struct_tm.h" 1 3 4






struct tm
{
  int tm_sec;
  int tm_min;
  int tm_hour;
  int tm_mday;
  int tm_mon;
  int tm_year;
  int tm_wday;
  int tm_yday;
  int tm_isdst;


  long int tm_gmtoff;
  const char *tm_zone;




};
# 40 "/usr/include/time.h" 2 3 4
# 48 "/usr/include/time.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types/struct_itimerspec.h" 1 3 4







struct itimerspec
  {
    struct timespec it_interval;
    struct timespec it_value;
  };
# 49 "/usr/include/time.h" 2 3 4
struct sigevent;
# 68 "/usr/include/time.h" 3 4




extern clock_t clock (void) __attribute__ ((__nothrow__ , __leaf__));


extern time_t time (time_t *__timer) __attribute__ ((__nothrow__ , __leaf__));


extern double difftime (time_t __time1, time_t __time0)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern time_t mktime (struct tm *__tp) __attribute__ ((__nothrow__ , __leaf__));





extern size_t strftime (char *__restrict __s, size_t __maxsize,
   const char *__restrict __format,
   const struct tm *__restrict __tp) __attribute__ ((__nothrow__ , __leaf__));
# 104 "/usr/include/time.h" 3 4
extern size_t strftime_l (char *__restrict __s, size_t __maxsize,
     const char *__restrict __format,
     const struct tm *__restrict __tp,
     locale_t __loc) __attribute__ ((__nothrow__ , __leaf__));
# 119 "/usr/include/time.h" 3 4
extern struct tm *gmtime (const time_t *__timer) __attribute__ ((__nothrow__ , __leaf__));



extern struct tm *localtime (const time_t *__timer) __attribute__ ((__nothrow__ , __leaf__));




extern struct tm *gmtime_r (const time_t *__restrict __timer,
       struct tm *__restrict __tp) __attribute__ ((__nothrow__ , __leaf__));



extern struct tm *localtime_r (const time_t *__restrict __timer,
          struct tm *__restrict __tp) __attribute__ ((__nothrow__ , __leaf__));




extern char *asctime (const struct tm *__tp) __attribute__ ((__nothrow__ , __leaf__));


extern char *ctime (const time_t *__timer) __attribute__ ((__nothrow__ , __leaf__));






extern char *asctime_r (const struct tm *__restrict __tp,
   char *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__));


extern char *ctime_r (const time_t *__restrict __timer,
        char *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__));




extern char *__tzname[2];
extern int __daylight;
extern long int __timezone;




extern char *tzname[2];



extern void tzset (void) __attribute__ ((__nothrow__ , __leaf__));



extern int daylight;
extern long int timezone;





extern int stime (const time_t *__when) __attribute__ ((__nothrow__ , __leaf__));
# 196 "/usr/include/time.h" 3 4
extern time_t timegm (struct tm *__tp) __attribute__ ((__nothrow__ , __leaf__));


extern time_t timelocal (struct tm *__tp) __attribute__ ((__nothrow__ , __leaf__));


extern int dysize (int __year) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
# 211 "/usr/include/time.h" 3 4
extern int nanosleep (const struct timespec *__requested_time,
        struct timespec *__remaining);



extern int clock_getres (clockid_t __clock_id, struct timespec *__res) __attribute__ ((__nothrow__ , __leaf__));


extern int clock_gettime (clockid_t __clock_id, struct timespec *__tp) __attribute__ ((__nothrow__ , __leaf__));


extern int clock_settime (clockid_t __clock_id, const struct timespec *__tp)
     __attribute__ ((__nothrow__ , __leaf__));






extern int clock_nanosleep (clockid_t __clock_id, int __flags,
       const struct timespec *__req,
       struct timespec *__rem);


extern int clock_getcpuclockid (pid_t __pid, clockid_t *__clock_id) __attribute__ ((__nothrow__ , __leaf__));




extern int timer_create (clockid_t __clock_id,
    struct sigevent *__restrict __evp,
    timer_t *__restrict __timerid) __attribute__ ((__nothrow__ , __leaf__));


extern int timer_delete (timer_t __timerid) __attribute__ ((__nothrow__ , __leaf__));


extern int timer_settime (timer_t __timerid, int __flags,
     const struct itimerspec *__restrict __value,
     struct itimerspec *__restrict __ovalue) __attribute__ ((__nothrow__ , __leaf__));


extern int timer_gettime (timer_t __timerid, struct itimerspec *__value)
     __attribute__ ((__nothrow__ , __leaf__));


extern int timer_getoverrun (timer_t __timerid) __attribute__ ((__nothrow__ , __leaf__));





extern int timespec_get (struct timespec *__ts, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 307 "/usr/include/time.h" 3 4

# 25 "/usr/include/pthread.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/setjmp.h" 1 3 4
# 26 "/usr/include/x86_64-linux-gnu/bits/setjmp.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/bits/setjmp.h" 2 3 4




typedef long int __jmp_buf[8];
# 28 "/usr/include/pthread.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 29 "/usr/include/pthread.h" 2 3 4




enum
{
  PTHREAD_CREATE_JOINABLE,

  PTHREAD_CREATE_DETACHED

};



enum
{
  PTHREAD_MUTEX_TIMED_NP,
  PTHREAD_MUTEX_RECURSIVE_NP,
  PTHREAD_MUTEX_ERRORCHECK_NP,
  PTHREAD_MUTEX_ADAPTIVE_NP

  ,
  PTHREAD_MUTEX_NORMAL = PTHREAD_MUTEX_TIMED_NP,
  PTHREAD_MUTEX_RECURSIVE = PTHREAD_MUTEX_RECURSIVE_NP,
  PTHREAD_MUTEX_ERRORCHECK = PTHREAD_MUTEX_ERRORCHECK_NP,
  PTHREAD_MUTEX_DEFAULT = PTHREAD_MUTEX_NORMAL





};




enum
{
  PTHREAD_MUTEX_STALLED,
  PTHREAD_MUTEX_STALLED_NP = PTHREAD_MUTEX_STALLED,
  PTHREAD_MUTEX_ROBUST,
  PTHREAD_MUTEX_ROBUST_NP = PTHREAD_MUTEX_ROBUST
};





enum
{
  PTHREAD_PRIO_NONE,
  PTHREAD_PRIO_INHERIT,
  PTHREAD_PRIO_PROTECT
};
# 115 "/usr/include/pthread.h" 3 4
enum
{
  PTHREAD_RWLOCK_PREFER_READER_NP,
  PTHREAD_RWLOCK_PREFER_WRITER_NP,
  PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP,
  PTHREAD_RWLOCK_DEFAULT_NP = PTHREAD_RWLOCK_PREFER_READER_NP
};
# 156 "/usr/include/pthread.h" 3 4
enum
{
  PTHREAD_INHERIT_SCHED,

  PTHREAD_EXPLICIT_SCHED

};



enum
{
  PTHREAD_SCOPE_SYSTEM,

  PTHREAD_SCOPE_PROCESS

};



enum
{
  PTHREAD_PROCESS_PRIVATE,

  PTHREAD_PROCESS_SHARED

};
# 191 "/usr/include/pthread.h" 3 4
struct _pthread_cleanup_buffer
{
  void (*__routine) (void *);
  void *__arg;
  int __canceltype;
  struct _pthread_cleanup_buffer *__prev;
};


enum
{
  PTHREAD_CANCEL_ENABLE,

  PTHREAD_CANCEL_DISABLE

};
enum
{
  PTHREAD_CANCEL_DEFERRED,

  PTHREAD_CANCEL_ASYNCHRONOUS

};
# 229 "/usr/include/pthread.h" 3 4





extern int pthread_create (pthread_t *__restrict __newthread,
      const pthread_attr_t *__restrict __attr,
      void *(*__start_routine) (void *),
      void *__restrict __arg) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 3)));





extern void pthread_exit (void *__retval) __attribute__ ((__noreturn__));







extern int pthread_join (pthread_t __th, void **__thread_return);
# 272 "/usr/include/pthread.h" 3 4
extern int pthread_detach (pthread_t __th) __attribute__ ((__nothrow__ , __leaf__));



extern pthread_t pthread_self (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int pthread_equal (pthread_t __thread1, pthread_t __thread2)
  __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));







extern int pthread_attr_init (pthread_attr_t *__attr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_attr_destroy (pthread_attr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_attr_getdetachstate (const pthread_attr_t *__attr,
     int *__detachstate)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setdetachstate (pthread_attr_t *__attr,
     int __detachstate)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_attr_getguardsize (const pthread_attr_t *__attr,
          size_t *__guardsize)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setguardsize (pthread_attr_t *__attr,
          size_t __guardsize)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_attr_getschedparam (const pthread_attr_t *__restrict __attr,
           struct sched_param *__restrict __param)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setschedparam (pthread_attr_t *__restrict __attr,
           const struct sched_param *__restrict
           __param) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_getschedpolicy (const pthread_attr_t *__restrict
     __attr, int *__restrict __policy)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setschedpolicy (pthread_attr_t *__attr, int __policy)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_attr_getinheritsched (const pthread_attr_t *__restrict
      __attr, int *__restrict __inherit)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setinheritsched (pthread_attr_t *__attr,
      int __inherit)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_attr_getscope (const pthread_attr_t *__restrict __attr,
      int *__restrict __scope)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setscope (pthread_attr_t *__attr, int __scope)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_attr_getstackaddr (const pthread_attr_t *__restrict
          __attr, void **__restrict __stackaddr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2))) __attribute__ ((__deprecated__));





extern int pthread_attr_setstackaddr (pthread_attr_t *__attr,
          void *__stackaddr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__deprecated__));


extern int pthread_attr_getstacksize (const pthread_attr_t *__restrict
          __attr, size_t *__restrict __stacksize)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));




extern int pthread_attr_setstacksize (pthread_attr_t *__attr,
          size_t __stacksize)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_attr_getstack (const pthread_attr_t *__restrict __attr,
      void **__restrict __stackaddr,
      size_t *__restrict __stacksize)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2, 3)));




extern int pthread_attr_setstack (pthread_attr_t *__attr, void *__stackaddr,
      size_t __stacksize) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 430 "/usr/include/pthread.h" 3 4
extern int pthread_setschedparam (pthread_t __target_thread, int __policy,
      const struct sched_param *__param)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3)));


extern int pthread_getschedparam (pthread_t __target_thread,
      int *__restrict __policy,
      struct sched_param *__restrict __param)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));


extern int pthread_setschedprio (pthread_t __target_thread, int __prio)
     __attribute__ ((__nothrow__ , __leaf__));
# 495 "/usr/include/pthread.h" 3 4
extern int pthread_once (pthread_once_t *__once_control,
    void (*__init_routine) (void)) __attribute__ ((__nonnull__ (1, 2)));
# 507 "/usr/include/pthread.h" 3 4
extern int pthread_setcancelstate (int __state, int *__oldstate);



extern int pthread_setcanceltype (int __type, int *__oldtype);


extern int pthread_cancel (pthread_t __th);




extern void pthread_testcancel (void);




typedef struct
{
  struct
  {
    __jmp_buf __cancel_jmp_buf;
    int __mask_was_saved;
  } __cancel_jmp_buf[1];
  void *__pad[4];
} __pthread_unwind_buf_t __attribute__ ((__aligned__));
# 541 "/usr/include/pthread.h" 3 4
struct __pthread_cleanup_frame
{
  void (*__cancel_routine) (void *);
  void *__cancel_arg;
  int __do_it;
  int __cancel_type;
};
# 681 "/usr/include/pthread.h" 3 4
extern void __pthread_register_cancel (__pthread_unwind_buf_t *__buf)
     ;
# 693 "/usr/include/pthread.h" 3 4
extern void __pthread_unregister_cancel (__pthread_unwind_buf_t *__buf)
  ;
# 734 "/usr/include/pthread.h" 3 4
extern void __pthread_unwind_next (__pthread_unwind_buf_t *__buf)
     __attribute__ ((__noreturn__))

     __attribute__ ((__weak__))

     ;



struct __jmp_buf_tag;
extern int __sigsetjmp (struct __jmp_buf_tag *__env, int __savemask) __attribute__ ((__nothrow__));





extern int pthread_mutex_init (pthread_mutex_t *__mutex,
          const pthread_mutexattr_t *__mutexattr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_mutex_destroy (pthread_mutex_t *__mutex)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_mutex_trylock (pthread_mutex_t *__mutex)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_mutex_lock (pthread_mutex_t *__mutex)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_mutex_timedlock (pthread_mutex_t *__restrict __mutex,
        const struct timespec *__restrict
        __abstime) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));



extern int pthread_mutex_unlock (pthread_mutex_t *__mutex)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_mutex_getprioceiling (const pthread_mutex_t *
      __restrict __mutex,
      int *__restrict __prioceiling)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



extern int pthread_mutex_setprioceiling (pthread_mutex_t *__restrict __mutex,
      int __prioceiling,
      int *__restrict __old_ceiling)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 3)));




extern int pthread_mutex_consistent (pthread_mutex_t *__mutex)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 807 "/usr/include/pthread.h" 3 4
extern int pthread_mutexattr_init (pthread_mutexattr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_mutexattr_destroy (pthread_mutexattr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_mutexattr_getpshared (const pthread_mutexattr_t *
      __restrict __attr,
      int *__restrict __pshared)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_mutexattr_setpshared (pthread_mutexattr_t *__attr,
      int __pshared)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_mutexattr_gettype (const pthread_mutexattr_t *__restrict
          __attr, int *__restrict __kind)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));




extern int pthread_mutexattr_settype (pthread_mutexattr_t *__attr, int __kind)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_mutexattr_getprotocol (const pthread_mutexattr_t *
       __restrict __attr,
       int *__restrict __protocol)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



extern int pthread_mutexattr_setprotocol (pthread_mutexattr_t *__attr,
       int __protocol)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_mutexattr_getprioceiling (const pthread_mutexattr_t *
          __restrict __attr,
          int *__restrict __prioceiling)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_mutexattr_setprioceiling (pthread_mutexattr_t *__attr,
          int __prioceiling)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_mutexattr_getrobust (const pthread_mutexattr_t *__attr,
     int *__robustness)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));







extern int pthread_mutexattr_setrobust (pthread_mutexattr_t *__attr,
     int __robustness)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 889 "/usr/include/pthread.h" 3 4
extern int pthread_rwlock_init (pthread_rwlock_t *__restrict __rwlock,
    const pthread_rwlockattr_t *__restrict
    __attr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlock_destroy (pthread_rwlock_t *__rwlock)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlock_rdlock (pthread_rwlock_t *__rwlock)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlock_tryrdlock (pthread_rwlock_t *__rwlock)
  __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_rwlock_timedrdlock (pthread_rwlock_t *__restrict __rwlock,
           const struct timespec *__restrict
           __abstime) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));



extern int pthread_rwlock_wrlock (pthread_rwlock_t *__rwlock)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlock_trywrlock (pthread_rwlock_t *__rwlock)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_rwlock_timedwrlock (pthread_rwlock_t *__restrict __rwlock,
           const struct timespec *__restrict
           __abstime) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));



extern int pthread_rwlock_unlock (pthread_rwlock_t *__rwlock)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));





extern int pthread_rwlockattr_init (pthread_rwlockattr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlockattr_destroy (pthread_rwlockattr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlockattr_getpshared (const pthread_rwlockattr_t *
       __restrict __attr,
       int *__restrict __pshared)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_rwlockattr_setpshared (pthread_rwlockattr_t *__attr,
       int __pshared)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlockattr_getkind_np (const pthread_rwlockattr_t *
       __restrict __attr,
       int *__restrict __pref)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_rwlockattr_setkind_np (pthread_rwlockattr_t *__attr,
       int __pref) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));







extern int pthread_cond_init (pthread_cond_t *__restrict __cond,
         const pthread_condattr_t *__restrict __cond_attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_cond_destroy (pthread_cond_t *__cond)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_cond_signal (pthread_cond_t *__cond)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_cond_broadcast (pthread_cond_t *__cond)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));






extern int pthread_cond_wait (pthread_cond_t *__restrict __cond,
         pthread_mutex_t *__restrict __mutex)
     __attribute__ ((__nonnull__ (1, 2)));
# 1001 "/usr/include/pthread.h" 3 4
extern int pthread_cond_timedwait (pthread_cond_t *__restrict __cond,
       pthread_mutex_t *__restrict __mutex,
       const struct timespec *__restrict __abstime)
     __attribute__ ((__nonnull__ (1, 2, 3)));




extern int pthread_condattr_init (pthread_condattr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_condattr_destroy (pthread_condattr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_condattr_getpshared (const pthread_condattr_t *
     __restrict __attr,
     int *__restrict __pshared)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_condattr_setpshared (pthread_condattr_t *__attr,
     int __pshared) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_condattr_getclock (const pthread_condattr_t *
          __restrict __attr,
          __clockid_t *__restrict __clock_id)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_condattr_setclock (pthread_condattr_t *__attr,
          __clockid_t __clock_id)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 1045 "/usr/include/pthread.h" 3 4
extern int pthread_spin_init (pthread_spinlock_t *__lock, int __pshared)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_spin_destroy (pthread_spinlock_t *__lock)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_spin_lock (pthread_spinlock_t *__lock)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_spin_trylock (pthread_spinlock_t *__lock)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_spin_unlock (pthread_spinlock_t *__lock)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));






extern int pthread_barrier_init (pthread_barrier_t *__restrict __barrier,
     const pthread_barrierattr_t *__restrict
     __attr, unsigned int __count)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_barrier_destroy (pthread_barrier_t *__barrier)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_barrier_wait (pthread_barrier_t *__barrier)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_barrierattr_init (pthread_barrierattr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_barrierattr_destroy (pthread_barrierattr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_barrierattr_getpshared (const pthread_barrierattr_t *
        __restrict __attr,
        int *__restrict __pshared)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_barrierattr_setpshared (pthread_barrierattr_t *__attr,
        int __pshared)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 1112 "/usr/include/pthread.h" 3 4
extern int pthread_key_create (pthread_key_t *__key,
          void (*__destr_function) (void *))
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_key_delete (pthread_key_t __key) __attribute__ ((__nothrow__ , __leaf__));


extern void *pthread_getspecific (pthread_key_t __key) __attribute__ ((__nothrow__ , __leaf__));


extern int pthread_setspecific (pthread_key_t __key,
    const void *__pointer) __attribute__ ((__nothrow__ , __leaf__)) ;




extern int pthread_getcpuclockid (pthread_t __thread_id,
      __clockid_t *__clock_id)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
# 1146 "/usr/include/pthread.h" 3 4
extern int pthread_atfork (void (*__prepare) (void),
      void (*__parent) (void),
      void (*__child) (void)) __attribute__ ((__nothrow__ , __leaf__));




extern __inline __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ , __leaf__)) pthread_equal (pthread_t __thread1, pthread_t __thread2)
{
  return __thread1 == __thread2;
}



# 25 "../include/pelib/stack.h" 2
# 59 "../include/pelib/stack.h"

# 59 "../include/pelib/stack.h"
struct
stackelem_size_t
  {
    size_t buffer;
    struct stackelem_size_t *next;
  };

typedef struct stackelem_size_t stackelem_size_t_t;


# 1 "../include/pelib/structure.h" 1
# 25 "../include/pelib/structure.h"
# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h" 1 3 4
# 26 "../include/pelib/structure.h" 2
# 59 "../include/pelib/structure.h"
stackelem_size_t_t *
pelib_stackelem_size_t_t_alloc_struct();





int
pelib_stackelem_size_t_t_alloc_buffer(stackelem_size_t_t* obj, size_t n);







int
pelib_stackelem_size_t_t_set_buffer(stackelem_size_t_t* obj, void* buffer, size_t n);



stackelem_size_t_t *
pelib_stackelem_size_t_t_alloc();





stackelem_size_t_t *
pelib_stackelem_size_t_t_alloc_collection(size_t n);






stackelem_size_t_t *
pelib_stackelem_size_t_t_alloc_from(void* buffer, size_t n);





int
pelib_stackelem_size_t_t_init(stackelem_size_t_t *obj);





int
pelib_stackelem_size_t_t_copy(stackelem_size_t_t src, stackelem_size_t_t* dst);





int
pelib_stackelem_size_t_t_free_struct(stackelem_size_t_t *obj);





int
pelib_stackelem_size_t_t_free_buffer(stackelem_size_t_t *);




int
pelib_stackelem_size_t_t_free(stackelem_size_t_t *);




int
pelib_stackelem_size_t_t_destroy(stackelem_size_t_t);




int
pelib_stackelem_size_t_t_compare(stackelem_size_t_t a, stackelem_size_t_t b);






FILE*
pelib_stackelem_size_t_t_printf(FILE* str, stackelem_size_t_t obj);







FILE*
pelib_stackelem_size_t_t_printf_detail(FILE* str, stackelem_size_t_t obj, int lvl);






size_t
pelib_stackelem_size_t_t_fwrite(stackelem_size_t_t obj, FILE* str);






size_t
pelib_stackelem_size_t_t_fread(stackelem_size_t_t* obj, FILE* str);


char*
pelib_stackelem_size_t_t_string(stackelem_size_t_t);





char*
pelib_stackelem_size_t_t_string_detail(stackelem_size_t_t, int);
# 70 "../include/pelib/stack.h" 2


int
pelib_stackelem_size_t_write(stackelem_size_t_t*, size_t);


int
pelib_stackelem_size_t_read(stackelem_size_t_t*, size_t*);


int
pelib_stackelem_size_t_check(stackelem_size_t_t*);


struct stack_size_t
  {
    stackelem_size_t_t * top;
    pthread_mutex_t lock;
  };

typedef struct stack_size_t stack_size_t_t;


# 1 "../include/pelib/structure.h" 1
# 25 "../include/pelib/structure.h"
# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h" 1 3 4
# 26 "../include/pelib/structure.h" 2
# 59 "../include/pelib/structure.h"
stack_size_t_t *
pelib_stack_size_t_t_alloc_struct();





int
pelib_stack_size_t_t_alloc_buffer(stack_size_t_t* obj, size_t n);







int
pelib_stack_size_t_t_set_buffer(stack_size_t_t* obj, void* buffer, size_t n);



stack_size_t_t *
pelib_stack_size_t_t_alloc();





stack_size_t_t *
pelib_stack_size_t_t_alloc_collection(size_t n);






stack_size_t_t *
pelib_stack_size_t_t_alloc_from(void* buffer, size_t n);





int
pelib_stack_size_t_t_init(stack_size_t_t *obj);





int
pelib_stack_size_t_t_copy(stack_size_t_t src, stack_size_t_t* dst);





int
pelib_stack_size_t_t_free_struct(stack_size_t_t *obj);





int
pelib_stack_size_t_t_free_buffer(stack_size_t_t *);




int
pelib_stack_size_t_t_free(stack_size_t_t *);




int
pelib_stack_size_t_t_destroy(stack_size_t_t);




int
pelib_stack_size_t_t_compare(stack_size_t_t a, stack_size_t_t b);






FILE*
pelib_stack_size_t_t_printf(FILE* str, stack_size_t_t obj);







FILE*
pelib_stack_size_t_t_printf_detail(FILE* str, stack_size_t_t obj, int lvl);






size_t
pelib_stack_size_t_t_fwrite(stack_size_t_t obj, FILE* str);






size_t
pelib_stack_size_t_t_fread(stack_size_t_t* obj, FILE* str);


char*
pelib_stack_size_t_t_string(stack_size_t_t);





char*
pelib_stack_size_t_t_string_detail(stack_size_t_t, int);
# 94 "../include/pelib/stack.h" 2


int
pelib_stack_size_t_check(stack_size_t_t *);


int
pelib_stack_size_t_isempty(stack_size_t_t *);


int
pelib_stack_size_t_push(stack_size_t_t *stack, size_t data);


int
pelib_stack_size_t_pop(stack_size_t_t *, size_t*);


int
pelib_stack_size_t_peek(stack_size_t_t *, size_t*);


int
pelib_stack_size_t_push_safe(stack_size_t_t *, size_t);


int
pelib_stack_size_t_pop_safe(stack_size_t_t *, size_t*);


int
pelib_stack_size_t_push_elem(stack_size_t_t *, stackelem_size_t_t*);


int
pelib_stack_size_t_pop_elem(stack_size_t_t *, stackelem_size_t_t**);


int
pelib_stack_size_t_push_elem_safe(stack_size_t_t *, stackelem_size_t_t *);


int
pelib_stack_size_t_pop_elem_safe(stack_size_t_t *, stackelem_size_t_t**);







int
pelib_stack_size_t_push_safe_managed(stack_size_t_t *stack, stack_size_t_t *bin, size_t value);






int
pelib_stack_size_t_pop_safe_managed(stack_size_t_t *stack, stack_size_t_t *bin, size_t *ptr);
# 33 "../include/pelib/size_t.h" 2



# 1 "../include/pelib/fifo.h" 1
# 24 "../include/pelib/fifo.h"
# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h" 1 3 4
# 25 "../include/pelib/fifo.h" 2







enum pelib_fifo_operation
{
 PELIB_CFIFO_PUSH,
 PELIB_CFIFO_POP
};
typedef enum pelib_fifo_operation pelib_fifo_operation_t;
# 66 "../include/pelib/fifo.h"
struct cfifo_size_t
{
 size_t read;
 size_t write;
 pelib_fifo_operation_t last_op;
 size_t capacity;
 volatile size_t *buffer;
};
typedef struct cfifo_size_t cfifo_size_t_t;


# 1 "../include/pelib/structure.h" 1
# 25 "../include/pelib/structure.h"
# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h" 1 3 4
# 26 "../include/pelib/structure.h" 2
# 59 "../include/pelib/structure.h"
cfifo_size_t_t *
pelib_cfifo_size_t_t_alloc_struct();





int
pelib_cfifo_size_t_t_alloc_buffer(cfifo_size_t_t* obj, size_t n);







int
pelib_cfifo_size_t_t_set_buffer(cfifo_size_t_t* obj, void* buffer, size_t n);



cfifo_size_t_t *
pelib_cfifo_size_t_t_alloc();





cfifo_size_t_t *
pelib_cfifo_size_t_t_alloc_collection(size_t n);






cfifo_size_t_t *
pelib_cfifo_size_t_t_alloc_from(void* buffer, size_t n);





int
pelib_cfifo_size_t_t_init(cfifo_size_t_t *obj);





int
pelib_cfifo_size_t_t_copy(cfifo_size_t_t src, cfifo_size_t_t* dst);





int
pelib_cfifo_size_t_t_free_struct(cfifo_size_t_t *obj);





int
pelib_cfifo_size_t_t_free_buffer(cfifo_size_t_t *);




int
pelib_cfifo_size_t_t_free(cfifo_size_t_t *);




int
pelib_cfifo_size_t_t_destroy(cfifo_size_t_t);




int
pelib_cfifo_size_t_t_compare(cfifo_size_t_t a, cfifo_size_t_t b);






FILE*
pelib_cfifo_size_t_t_printf(FILE* str, cfifo_size_t_t obj);







FILE*
pelib_cfifo_size_t_t_printf_detail(FILE* str, cfifo_size_t_t obj, int lvl);






size_t
pelib_cfifo_size_t_t_fwrite(cfifo_size_t_t obj, FILE* str);






size_t
pelib_cfifo_size_t_t_fread(cfifo_size_t_t* obj, FILE* str);


char*
pelib_cfifo_size_t_t_string(cfifo_size_t_t);





char*
pelib_cfifo_size_t_t_string_detail(cfifo_size_t_t, int);
# 78 "../include/pelib/fifo.h" 2




int
pelib_cfifo_size_t_push(cfifo_size_t_t*, size_t);
size_t

pelib_cfifo_size_t_fill(cfifo_size_t_t*, size_t n);


size_t
pelib_cfifo_size_t_pop(cfifo_size_t_t*);


size_t
pelib_cfifo_size_t_discard(cfifo_size_t_t*, size_t n);




size_t
pelib_cfifo_size_t_peek(cfifo_size_t_t*, size_t offset);


size_t*
pelib_cfifo_size_t_peekaddr(cfifo_size_t_t*, size_t offset, size_t *num, size_t **remaining);


size_t*
pelib_cfifo_size_t_writeaddr(cfifo_size_t_t*, size_t *num, size_t **remaining);


int
pelib_cfifo_size_t_is_full(cfifo_size_t_t*);


int
pelib_cfifo_size_t_is_empty(cfifo_size_t_t*);






size_t
pelib_cfifo_size_t_pushmem(cfifo_size_t_t*, size_t* addr, size_t n);






size_t
pelib_cfifo_size_t_popmem(cfifo_size_t_t*, size_t* addr, size_t n);






size_t
pelib_cfifo_size_t_peekmem(cfifo_size_t_t*, size_t*, size_t n, size_t offset);






size_t
pelib_cfifo_size_t_popfifo(cfifo_size_t_t*, cfifo_size_t_t* dest, size_t n);


size_t
pelib_cfifo_size_t_length(cfifo_size_t_t*);


size_t
pelib_cfifo_size_t_last(cfifo_size_t_t*);


size_t
pelib_cfifo_size_t_capacity(cfifo_size_t_t*);
# 37 "../include/pelib/size_t.h" 2
# 30 "../include/pelib/set.c" 2
# 58 "../include/pelib/set.c"
pelib_set_const_string_t*
pelib_pelib_set_const_string_t_alloc_struct()
{
 pelib_set_const_string_t* set;

 set = malloc(sizeof(pelib_set_const_string_t));
 
# 64 "../include/pelib/set.c" 3 4
((void) (0))
# 64 "../include/pelib/set.c"
                   ;

 return set;
}

pelib_set_const_string_t*
pelib_pelib_set_const_string_t_alloc()
{
 pelib_set_const_string_t* set;

 set = malloc(sizeof(pelib_set_const_string_t));
 
# 75 "../include/pelib/set.c" 3 4
((void) (0))
# 75 "../include/pelib/set.c"
                   ;

 return set;
}

int
pelib_pelib_set_const_string_t_init(pelib_set_const_string_t* set)
{
 set->first = 
# 83 "../include/pelib/set.c" 3 4
             ((void *)0)
# 83 "../include/pelib/set.c"
                 ;
 set->middle = 
# 84 "../include/pelib/set.c" 3 4
              ((void *)0)
# 84 "../include/pelib/set.c"
                  ;
 set->last = 
# 85 "../include/pelib/set.c" 3 4
            ((void *)0)
# 85 "../include/pelib/set.c"
                ;

 return 1;
}


static
int
pelib_pelib_set_const_string_insert_element(pelib_set_const_string_t *set, pelib_iterator_const_string_t *elem)
{
 pelib_iterator_const_string_t *current = set->first, *previous = 
# 95 "../include/pelib/set.c" 3 4
                                                           ((void *)0)
# 95 "../include/pelib/set.c"
                                                               ;




 if(current != 
# 100 "../include/pelib/set.c" 3 4
              ((void *)0)
# 100 "../include/pelib/set.c"
                  )
 {


  while(current != 
# 104 "../include/pelib/set.c" 3 4
                  ((void *)0) 
# 104 "../include/pelib/set.c"
                       && pelib_const_string_compare(elem->value, current->value) > 0)
  {
   previous = current;
   current = current->next;
  }


  if(current != 0 && pelib_const_string_compare(elem->value, current->value) == 0)
  {
   return 0;
  }


  elem->previous = previous;
  elem->next = current;
  if(previous != 
# 119 "../include/pelib/set.c" 3 4
                ((void *)0)
# 119 "../include/pelib/set.c"
                    )
  {
   previous->next = elem;
  }




  if(current == 
# 127 "../include/pelib/set.c" 3 4
               ((void *)0)
# 127 "../include/pelib/set.c"
                   )
  {
   set->last = elem;
  }
  else
  {
   if(current == set->first)
   {
    set->first = elem;
   }
   current->previous = elem;
  }
 }
 else
 {
  elem->next = 
# 142 "../include/pelib/set.c" 3 4
              ((void *)0)
# 142 "../include/pelib/set.c"
                  ;
  elem->previous = 
# 143 "../include/pelib/set.c" 3 4
                  ((void *)0)
# 143 "../include/pelib/set.c"
                      ;
  set->first = elem;
  set->last = elem;
 }

 return 1;
}

int
pelib_pelib_set_const_string_insert(pelib_set_const_string_t* set, const_string value)
{
 pelib_iterator_const_string_t *new = pelib_pelib_iterator_const_string_t_alloc();
 pelib_pelib_iterator_const_string_t_init(new);
 pelib_const_string_copy(value, &new->value);
 if(!pelib_pelib_set_const_string_insert_element(set, new))
 {
  pelib_pelib_iterator_const_string_t_free(new);
  return 0;
 }
 else
 {
  return 1;
 }
}

int
pelib_pelib_set_const_string_t_copy(pelib_set_const_string_t src, pelib_set_const_string_t* dst)
{
 size_t i;

 pelib_iterator_const_string_t *elem = src.last;
 while(elem != 
# 174 "../include/pelib/set.c" 3 4
              ((void *)0)
# 174 "../include/pelib/set.c"
                  )
 {
  pelib_iterator_const_string_t *cpy = pelib_pelib_iterator_const_string_t_alloc();
  pelib_const_string_copy(elem->value, &cpy->value);
  pelib_pelib_set_const_string_insert_element(dst, cpy);
  elem = elem->previous;
 }

 return 0;
}



char*
pelib_pelib_set_const_string_t_string(pelib_set_const_string_t set)
{
 char *str, *grow, *elem;
 size_t i;
 str = malloc(3 * sizeof(char));
 sprintf(str, "[");

 pelib_iterator_const_string_t *el = set.first;
 while(el != 
# 196 "../include/pelib/set.c" 3 4
            ((void *)0) 
# 196 "../include/pelib/set.c"
                 && el->next != 
# 196 "../include/pelib/set.c" 3 4
                                ((void *)0)
# 196 "../include/pelib/set.c"
                                    )
 {
  elem = pelib_const_string_string(el->value);
  grow = malloc((strlen(str) + 1) * sizeof(char));
  sprintf(grow, "%s", str);

  free(str);
  str = malloc(strlen(grow) + 1 + strlen(elem) + 1);
  sprintf(str, "%s%s:", grow, elem);
  free(elem);
  free(grow);
  el = el->next;
 }
 while(el != 
# 209 "../include/pelib/set.c" 3 4
            ((void *)0)
# 209 "../include/pelib/set.c"
                )
 {
  elem = pelib_const_string_string(el->value);
  grow = malloc((strlen(str) + 1) * sizeof(char));
  sprintf(grow, "%s", str);

  free(str);
  str = malloc(strlen(grow) + 1 + strlen(elem) + 1);
  sprintf(str, "%s%s", grow, elem);
  free(elem);
  free(grow);

  el = el->next;
 }

 grow = malloc((strlen(str) + 1) * sizeof(char));
 sprintf(grow, "%s", str);
 sprintf(str, "%s]", grow);
 free(grow);

 return str;
}

char*
pelib_pelib_set_const_string_t_string_detail(pelib_set_const_string_t set, int level)
{
 if(level == 0)
 {
  return pelib_pelib_set_const_string_t_string(set);
 }
 else
 {

  char *str, *grow, *elem;
  size_t i;
  str = malloc(3 * sizeof(char));
  sprintf(str, "[");
  pelib_iterator_const_string_t *el = set.first;

  while(el != 
# 248 "../include/pelib/set.c" 3 4
             ((void *)0) 
# 248 "../include/pelib/set.c"
                  && el->next != 
# 248 "../include/pelib/set.c" 3 4
                                 ((void *)0)
# 248 "../include/pelib/set.c"
                                     )
  {
   elem = pelib_const_string_string_detail(el->value, level);
   grow = malloc((strlen(str) + 1) * sizeof(char));
   sprintf(grow, "%s", str);

   free(str);
   str = malloc(strlen(grow) + 1 + strlen(elem) + 1);
   sprintf(str, "%s%s:", grow, elem);
   free(elem);
   free(grow);
  }
  while(el != 
# 260 "../include/pelib/set.c" 3 4
             ((void *)0)
# 260 "../include/pelib/set.c"
                 )
  {
   elem = pelib_const_string_string_detail(el->value, level);
   grow = malloc((strlen(str) + 1) * sizeof(char));
   sprintf(grow, "%s", str);

   free(str);
   str = malloc(strlen(grow) + 1 + strlen(elem) + 1);
   sprintf(str, "%s%s", grow, elem);
   free(elem);
   free(grow);
  }

  grow = malloc((strlen(str) + 1) * sizeof(char));
  sprintf(grow, "%s", str);
  sprintf(str, "%s]", grow);
  free(grow);

  return str;
 }
}

FILE*
pelib_pelib_set_const_string_t_printf(FILE* stream, pelib_set_const_string_t set)
{
 char * str;
 str = pelib_pelib_set_const_string_t_string(set);

 fprintf(stream, "%s\n", str);
 free(str);

 return stream;
}

FILE*
pelib_pelib_set_const_string_t_printf_detail(FILE* stream, pelib_set_const_string_t set, int level)
{
 char * str;
 str = pelib_pelib_set_const_string_t_string_detail(set, level);

 fprintf(stream, "%s\n", str);
 free(str);

 return stream;
}

int
pelib_pelib_set_const_string_t_destroy(pelib_set_const_string_t set)
{
 pelib_iterator_const_string_t *elem = set.first;
 while(elem != 
# 310 "../include/pelib/set.c" 3 4
              ((void *)0)
# 310 "../include/pelib/set.c"
                  )
 {
  pelib_iterator_const_string_t *current = elem;
  elem = elem->next;
  pelib_pelib_iterator_const_string_t_destroy(*current);
  pelib_pelib_iterator_const_string_t_free(current);
 }
 return 1;
}

int
pelib_pelib_set_const_string_t_free_buffer(pelib_set_const_string_t* set)
{
 pelib_iterator_const_string_t *elem = set->first;
 while(elem != 
# 324 "../include/pelib/set.c" 3 4
              ((void *)0)
# 324 "../include/pelib/set.c"
                  )
 {
  pelib_iterator_const_string_t *current = elem;
  elem = elem->next;
  pelib_pelib_iterator_const_string_t_destroy(*current);
  pelib_pelib_iterator_const_string_t_free(current);
 }
 return 1;
}

int
pelib_pelib_set_const_string_t_free_struct(pelib_set_const_string_t* set)
{
 free(set);
 return 1;
}

int
pelib_pelib_set_const_string_t_free(pelib_set_const_string_t* set)
{
 pelib_pelib_set_const_string_t_free_buffer(set);
 pelib_pelib_set_const_string_t_free_struct(set);
 return 1;
}

int
pelib_pelib_set_const_string_t_compare(pelib_set_const_string_t a1, pelib_set_const_string_t a2)
{
 pelib_iterator_const_string_t *e1 = a1.first;
 pelib_iterator_const_string_t *e2 = a2.first;

 while(e1 != 
# 355 "../include/pelib/set.c" 3 4
            ((void *)0) 
# 355 "../include/pelib/set.c"
                 && e2 != 
# 355 "../include/pelib/set.c" 3 4
                          ((void *)0) 
# 355 "../include/pelib/set.c"
                               && pelib_pelib_iterator_const_string_t_compare(*e1, *e2) == 0)
 {
  e1 = e1->next;
  e2 = e2->next;
 }

 if(e1 == 
# 361 "../include/pelib/set.c" 3 4
         ((void *)0) 
# 361 "../include/pelib/set.c"
              && e2 != 
# 361 "../include/pelib/set.c" 3 4
                       ((void *)0)
# 361 "../include/pelib/set.c"
                           )
 {
  return 1;
 }
 else if(e1 != 
# 365 "../include/pelib/set.c" 3 4
              ((void *)0) 
# 365 "../include/pelib/set.c"
                   && e2 == 
# 365 "../include/pelib/set.c" 3 4
                            ((void *)0)
# 365 "../include/pelib/set.c"
                                )
 {
  return -1;
 }
 else return pelib_pelib_iterator_const_string_t_compare(*e1, *e2);
}
# 121 "const_string.c" 2




# 1 "../include/pelib/pair.c" 1
# 26 "../include/pelib/pair.c"
# 1 "/usr/include/assert.h" 1 3 4
# 27 "../include/pelib/pair.c" 2






pelib_pair_const_string_const_string_t*
pelib_pelib_pair_const_string_const_string_t_alloc_struct()
{
 pelib_pair_const_string_const_string_t* pelib_pair;

 pelib_pair = malloc(sizeof(pelib_pair_const_string_const_string_t));
 
# 39 "../include/pelib/pair.c" 3 4
((void) (0))
# 39 "../include/pelib/pair.c"
                          ;

 return pelib_pair;
}

int
pelib_pelib_pair_const_string_const_string_t_init(pelib_pair_const_string_const_string_t* pelib_pair)
{
 int a = pelib_const_string_init(&pelib_pair->key);
 return a && pelib_const_string_init(&pelib_pair->value);
}

int
pelib_pelib_pair_const_string_const_string_t_copy(pelib_pair_const_string_const_string_t src, pelib_pair_const_string_const_string_t* dst)
{
 int a = pelib_const_string_copy(src.key, &dst->key);
 return a && pelib_const_string_copy(src.value, &dst->value);
}



char*
pelib_pelib_pair_const_string_const_string_t_string(pelib_pair_const_string_const_string_t pelib_pair)
{
 char *key = pelib_const_string_string(pelib_pair.key);
 char *value = pelib_const_string_string(pelib_pair.value);

 char *elem = malloc((strlen(key) + strlen(value) + 4) * sizeof(char*));
 elem[0] = '(';
 strcpy(&elem[1], key);
 elem[1 + strlen(key)] = ',';
 strcpy(&elem[1 + strlen(key) + 1], value);
 elem[1 + strlen(key) + 1 + strlen(value)] = ')';
 elem[1 + strlen(key) + 1 + strlen(value) + 1] = '\0';
 free(key);
 free(value);

 return elem;
}

char*
pelib_pelib_pair_const_string_const_string_t_string_detail(pelib_pair_const_string_const_string_t pelib_pair, int level)
{
 if(level == 0)
 {
  return pelib_pelib_pair_const_string_const_string_t_string(pelib_pair);
 }
 else
 {
  char *key = pelib_const_string_string(pelib_pair.key);
  char *value = pelib_const_string_string(pelib_pair.value);

  char *elem = malloc((strlen(key) + strlen(value) + 4) * sizeof(char*));
  elem[0] = '(';
  strcpy(&elem[1], key);
  elem[1 + strlen(key)] = ',';
  strcpy(&elem[1 + strlen(key) + 1], value);
  elem[1 + strlen(key) + 1 + strlen(value)] = ')';
  elem[1 + strlen(key) + 1 + strlen(value) + 1] = '\0';
  free(key);
  free(value);

  return elem;
 }
}

FILE*
pelib_pelib_pair_const_string_const_string_t_printf(FILE* stream, pelib_pair_const_string_const_string_t pelib_pair)
{
 char * str;
 str = pelib_pelib_pair_const_string_const_string_t_string(pelib_pair);

 fprintf(stream, "%s\n", str);
 free(str);

 return stream;
}

FILE*
pelib_pelib_pair_const_string_const_string_t_printf_detail(FILE* stream, pelib_pair_const_string_const_string_t pelib_pair, int level)
{
 char * str;
 str = pelib_pelib_pair_const_string_const_string_t_string_detail(pelib_pair, level);

 fprintf(stream, "%s\n", str);
 free(str);

 return stream;
}

int
pelib_pelib_pair_const_string_const_string_t_free(pelib_pair_const_string_const_string_t* pelib_pair)
{
 return pelib_pelib_pair_const_string_const_string_t_free_struct(pelib_pair);
}

int
pelib_pelib_pair_const_string_const_string_t_free_struct(pelib_pair_const_string_const_string_t* pelib_pair)
{
 pelib_const_string_destroy(pelib_pair->key);
 pelib_const_string_destroy(pelib_pair->value);
 free(pelib_pair);
 return 0;
}

int
pelib_pelib_pair_const_string_const_string_t_compare(pelib_pair_const_string_const_string_t a1, pelib_pair_const_string_const_string_t a2)
{
 int a = pelib_const_string_compare(a1.key, a2.key);
 int b = pelib_const_string_compare(a1.value, a2.value);
 return a == 0 ? b : a;
}

int
pelib_pelib_pair_const_string_const_string_t_destroy(pelib_pair_const_string_const_string_t set)
{
 pelib_const_string_destroy(set.key);
 pelib_const_string_destroy(set.value);
 return 1;
}
# 126 "const_string.c" 2


# 1 "../include/pelib/iterator.c" 1
# 26 "../include/pelib/iterator.c"
# 1 "/usr/include/assert.h" 1 3 4
# 27 "../include/pelib/iterator.c" 2






pelib_iterator_const_string_t*
pelib_pelib_iterator_const_string_t_alloc_struct()
{
 pelib_iterator_const_string_t* pelib_iterator;

 pelib_iterator = malloc(sizeof(pelib_iterator_const_string_t));
 
# 39 "../include/pelib/iterator.c" 3 4
((void) (0))
# 39 "../include/pelib/iterator.c"
                              ;

 return pelib_iterator;
}

pelib_iterator_const_string_t*
pelib_pelib_iterator_const_string_t_alloc()
{
 pelib_iterator_const_string_t* pelib_iterator;

 pelib_iterator = malloc(sizeof(pelib_iterator_const_string_t));
 
# 50 "../include/pelib/iterator.c" 3 4
((void) (0))
# 50 "../include/pelib/iterator.c"
                              ;

 return pelib_iterator;
}

int
pelib_pelib_iterator_const_string_t_init(pelib_iterator_const_string_t* pelib_iterator)
{
 pelib_iterator->previous = 
# 58 "../include/pelib/iterator.c" 3 4
                           ((void *)0)
# 58 "../include/pelib/iterator.c"
                               ;
 pelib_iterator->next = 
# 59 "../include/pelib/iterator.c" 3 4
                       ((void *)0)
# 59 "../include/pelib/iterator.c"
                           ;
 return pelib_const_string_init(&pelib_iterator->value);
}

int
pelib_pelib_iterator_const_string_t_copy(pelib_iterator_const_string_t src, pelib_iterator_const_string_t* dst)
{
 size_t i;

 *dst = src;
 return pelib_const_string_copy(src.value, &dst->value);
}



char*
pelib_pelib_iterator_const_string_t_string(pelib_iterator_const_string_t pelib_iterator)
{
 char *value = pelib_const_string_string(pelib_iterator.value);
 char *elem = malloc((strlen(value) + 3) * sizeof(char*));
 strcpy(&elem[1], value);
 elem[0] = '{';
 elem[strlen(value)] = '}';
 elem[strlen(value) + 1] = '\0';
 free(value);

 return elem;
}

char*
pelib_pelib_iterator_const_string_t_string_detail(pelib_iterator_const_string_t pelib_iterator, int level)
{
 if(level == 0)
 {
  return pelib_pelib_iterator_const_string_t_string(pelib_iterator);
 }
 else
 {
  char *value = pelib_const_string_string_detail(pelib_iterator.value, level);
  char *elem = malloc((strlen(value) + 3) * sizeof(char*));
  strcpy(&elem[1], value);
  elem[0] = '{';
  elem[strlen(value)] = '}';
  elem[strlen(value) + 1] = '\0';
  free(value);

  return elem;
 }
}

FILE*
pelib_pelib_iterator_const_string_t_printf(FILE* stream, pelib_iterator_const_string_t pelib_iterator)
{
 char * str;
 str = pelib_pelib_iterator_const_string_t_string(pelib_iterator);

 fprintf(stream, "%s\n", str);
 free(str);

 return stream;
}

FILE*
pelib_pelib_iterator_const_string_t_printf_detail(FILE* stream, pelib_iterator_const_string_t pelib_iterator, int level)
{
 char * str;
 str = pelib_pelib_iterator_const_string_t_string_detail(pelib_iterator, level);

 fprintf(stream, "%s\n", str);
 free(str);

 return stream;
}

int
pelib_pelib_iterator_const_string_t_destroy(pelib_iterator_const_string_t pelib_iterator)
{
 pelib_const_string_destroy(pelib_iterator.value);
 return 1;
}

int
pelib_pelib_iterator_const_string_t_free(pelib_iterator_const_string_t* pelib_iterator)
{
 return pelib_pelib_iterator_const_string_t_free_struct(pelib_iterator);
}

int
pelib_pelib_iterator_const_string_t_free_struct(pelib_iterator_const_string_t* pelib_iterator)
{
 free(pelib_iterator);
 return 0;
}

int
pelib_pelib_iterator_const_string_t_compare(pelib_iterator_const_string_t a1, pelib_iterator_const_string_t a2)
{
 return pelib_const_string_compare(a1.value, a2.value);
}

pelib_iterator_const_string_t*
pelib_pelib_iterator_const_string_next(pelib_iterator_const_string_t *el)
{
 if(el != 
# 162 "../include/pelib/iterator.c" 3 4
         ((void *)0)
# 162 "../include/pelib/iterator.c"
             )
 {
  return el->next;
 }
 else
 {
  return 
# 168 "../include/pelib/iterator.c" 3 4
        ((void *)0)
# 168 "../include/pelib/iterator.c"
            ;
 }
}

const_string
pelib_pelib_iterator_const_string_read(pelib_iterator_const_string_t *el)
{
 return el->value;
}

size_t
pelib_pelib_iterator_const_string_distance(pelib_iterator_const_string_t *start, pelib_iterator_const_string_t *stop)
{
 size_t distance = 0;

 pelib_iterator_const_string_t *i = start;

 while(pelib_pelib_iterator_const_string_t_compare(*i, *stop) != 0)
 {
  i = pelib_pelib_iterator_const_string_next(start);
  distance++;
 }

 return distance;
}
# 129 "const_string.c" 2


# 1 "../include/pelib/iterator.c" 1
# 26 "../include/pelib/iterator.c"
# 1 "/usr/include/assert.h" 1 3 4
# 27 "../include/pelib/iterator.c" 2






pelib_iterator_pelib_pair_const_string_const_string_t_t*
pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_alloc_struct()
{
 pelib_iterator_pelib_pair_const_string_const_string_t_t* pelib_iterator;

 pelib_iterator = malloc(sizeof(pelib_iterator_pelib_pair_const_string_const_string_t_t));
 
# 39 "../include/pelib/iterator.c" 3 4
((void) (0))
# 39 "../include/pelib/iterator.c"
                              ;

 return pelib_iterator;
}

pelib_iterator_pelib_pair_const_string_const_string_t_t*
pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_alloc()
{
 pelib_iterator_pelib_pair_const_string_const_string_t_t* pelib_iterator;

 pelib_iterator = malloc(sizeof(pelib_iterator_pelib_pair_const_string_const_string_t_t));
 
# 50 "../include/pelib/iterator.c" 3 4
((void) (0))
# 50 "../include/pelib/iterator.c"
                              ;

 return pelib_iterator;
}

int
pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_init(pelib_iterator_pelib_pair_const_string_const_string_t_t* pelib_iterator)
{
 pelib_iterator->previous = 
# 58 "../include/pelib/iterator.c" 3 4
                           ((void *)0)
# 58 "../include/pelib/iterator.c"
                               ;
 pelib_iterator->next = 
# 59 "../include/pelib/iterator.c" 3 4
                       ((void *)0)
# 59 "../include/pelib/iterator.c"
                           ;
 return pelib_pelib_pair_const_string_const_string_t_init(&pelib_iterator->value);
}

int
pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_copy(pelib_iterator_pelib_pair_const_string_const_string_t_t src, pelib_iterator_pelib_pair_const_string_const_string_t_t* dst)
{
 size_t i;

 *dst = src;
 return pelib_pelib_pair_const_string_const_string_t_copy(src.value, &dst->value);
}



char*
pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_string(pelib_iterator_pelib_pair_const_string_const_string_t_t pelib_iterator)
{
 char *value = pelib_pelib_pair_const_string_const_string_t_string(pelib_iterator.value);
 char *elem = malloc((strlen(value) + 3) * sizeof(char*));
 strcpy(&elem[1], value);
 elem[0] = '{';
 elem[strlen(value)] = '}';
 elem[strlen(value) + 1] = '\0';
 free(value);

 return elem;
}

char*
pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_string_detail(pelib_iterator_pelib_pair_const_string_const_string_t_t pelib_iterator, int level)
{
 if(level == 0)
 {
  return pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_string(pelib_iterator);
 }
 else
 {
  char *value = pelib_pelib_pair_const_string_const_string_t_string_detail(pelib_iterator.value, level);
  char *elem = malloc((strlen(value) + 3) * sizeof(char*));
  strcpy(&elem[1], value);
  elem[0] = '{';
  elem[strlen(value)] = '}';
  elem[strlen(value) + 1] = '\0';
  free(value);

  return elem;
 }
}

FILE*
pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_printf(FILE* stream, pelib_iterator_pelib_pair_const_string_const_string_t_t pelib_iterator)
{
 char * str;
 str = pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_string(pelib_iterator);

 fprintf(stream, "%s\n", str);
 free(str);

 return stream;
}

FILE*
pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_printf_detail(FILE* stream, pelib_iterator_pelib_pair_const_string_const_string_t_t pelib_iterator, int level)
{
 char * str;
 str = pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_string_detail(pelib_iterator, level);

 fprintf(stream, "%s\n", str);
 free(str);

 return stream;
}

int
pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_destroy(pelib_iterator_pelib_pair_const_string_const_string_t_t pelib_iterator)
{
 pelib_pelib_pair_const_string_const_string_t_destroy(pelib_iterator.value);
 return 1;
}

int
pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_free(pelib_iterator_pelib_pair_const_string_const_string_t_t* pelib_iterator)
{
 return pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_free_struct(pelib_iterator);
}

int
pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_free_struct(pelib_iterator_pelib_pair_const_string_const_string_t_t* pelib_iterator)
{
 free(pelib_iterator);
 return 0;
}

int
pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_compare(pelib_iterator_pelib_pair_const_string_const_string_t_t a1, pelib_iterator_pelib_pair_const_string_const_string_t_t a2)
{
 return pelib_pelib_pair_const_string_const_string_t_compare(a1.value, a2.value);
}

pelib_iterator_pelib_pair_const_string_const_string_t_t*
pelib_pelib_iterator_pelib_pair_const_string_const_string_t_next(pelib_iterator_pelib_pair_const_string_const_string_t_t *el)
{
 if(el != 
# 162 "../include/pelib/iterator.c" 3 4
         ((void *)0)
# 162 "../include/pelib/iterator.c"
             )
 {
  return el->next;
 }
 else
 {
  return 
# 168 "../include/pelib/iterator.c" 3 4
        ((void *)0)
# 168 "../include/pelib/iterator.c"
            ;
 }
}

pelib_pair_const_string_const_string_t
pelib_pelib_iterator_pelib_pair_const_string_const_string_t_read(pelib_iterator_pelib_pair_const_string_const_string_t_t *el)
{
 return el->value;
}

size_t
pelib_pelib_iterator_pelib_pair_const_string_const_string_t_distance(pelib_iterator_pelib_pair_const_string_const_string_t_t *start, pelib_iterator_pelib_pair_const_string_const_string_t_t *stop)
{
 size_t distance = 0;

 pelib_iterator_pelib_pair_const_string_const_string_t_t *i = start;

 while(pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_compare(*i, *stop) != 0)
 {
  i = pelib_pelib_iterator_pelib_pair_const_string_const_string_t_next(start);
  distance++;
 }

 return distance;
}
# 132 "const_string.c" 2




# 1 "../include/pelib/map.c" 1
# 26 "../include/pelib/map.c"
# 1 "/usr/include/assert.h" 1 3 4
# 27 "../include/pelib/map.c" 2
# 61 "../include/pelib/map.c"
map_const_string_const_string_t*
pelib_map_const_string_const_string_t_alloc_struct()
{
 map_const_string_const_string_t* map;

 map = malloc(sizeof(map_const_string_const_string_t));
 
# 67 "../include/pelib/map.c" 3 4
((void) (0))
# 67 "../include/pelib/map.c"
                   ;

 return map;
}

map_const_string_const_string_t*
pelib_map_const_string_const_string_t_alloc()
{
 map_const_string_const_string_t* map;

 map = malloc(sizeof(map_const_string_const_string_t));
 
# 78 "../include/pelib/map.c" 3 4
((void) (0))
# 78 "../include/pelib/map.c"
                   ;

 return map;
}

int
pelib_map_const_string_const_string_t_init(map_const_string_const_string_t* map)
{
 map->first = 
# 86 "../include/pelib/map.c" 3 4
             ((void *)0)
# 86 "../include/pelib/map.c"
                 ;
 map->middle = 
# 87 "../include/pelib/map.c" 3 4
              ((void *)0)
# 87 "../include/pelib/map.c"
                  ;
 map->last = 
# 88 "../include/pelib/map.c" 3 4
            ((void *)0)
# 88 "../include/pelib/map.c"
                ;

 return 1;
}


static
int
pelib_map_const_string_const_string_insert_element(map_const_string_const_string_t *map, pelib_iterator_pelib_pair_const_string_const_string_t_t *elem)
{
 pelib_iterator_pelib_pair_const_string_const_string_t_t *current = map->first, *previous = 
# 98 "../include/pelib/map.c" 3 4
                                                                                          ((void *)0)
# 98 "../include/pelib/map.c"
                                                                                              ;




 if(current != 
# 103 "../include/pelib/map.c" 3 4
              ((void *)0)
# 103 "../include/pelib/map.c"
                  )
 {


  while(current != 
# 107 "../include/pelib/map.c" 3 4
                  ((void *)0) 
# 107 "../include/pelib/map.c"
                       && pelib_const_string_compare(elem->value.key, current->value.key) > 0)
  {
   previous = current;
   current = current->next;
  }


  if(current != 0 && pelib_const_string_compare(elem->value.key, current->value.key) == 0)
  {
   return 0;
  }


  elem->previous = previous;
  elem->next = current;
  if(previous != 
# 122 "../include/pelib/map.c" 3 4
                ((void *)0)
# 122 "../include/pelib/map.c"
                    )
  {
   previous->next = elem;
  }




  if(current == 
# 130 "../include/pelib/map.c" 3 4
               ((void *)0)
# 130 "../include/pelib/map.c"
                   )
  {
   map->last = elem;
  }
  else
  {
   if(current == map->first)
   {
    map->first = elem;
   }
   current->previous = elem;
  }
 }
 else
 {
  elem->next = 
# 145 "../include/pelib/map.c" 3 4
              ((void *)0)
# 145 "../include/pelib/map.c"
                  ;
  elem->previous = 
# 146 "../include/pelib/map.c" 3 4
                  ((void *)0)
# 146 "../include/pelib/map.c"
                      ;
  map->first = elem;
  map->last = elem;
 }

 return 1;
}

int
pelib_map_const_string_const_string_insert(map_const_string_const_string_t* map, pelib_pair_const_string_const_string_t value)
{
 pelib_iterator_pelib_pair_const_string_const_string_t_t *new = pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_alloc();
 pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_init(new);
 pelib_pelib_pair_const_string_const_string_t_copy(value, &new->value);
 if(!pelib_map_const_string_const_string_insert_element(map, new))
 {
  pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_free(new);
  return 0;
 }
 else
 {
  return 1;
 }
}

int
pelib_map_const_string_const_string_t_copy(map_const_string_const_string_t src, map_const_string_const_string_t* dst)
{
 size_t i;

 pelib_iterator_pelib_pair_const_string_const_string_t_t *elem = src.last;
 while(elem != 
# 177 "../include/pelib/map.c" 3 4
              ((void *)0)
# 177 "../include/pelib/map.c"
                  )
 {
  pelib_iterator_pelib_pair_const_string_const_string_t_t *cpy = pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_alloc();
  pelib_pelib_pair_const_string_const_string_t_copy(elem->value, &cpy->value);
  pelib_map_const_string_const_string_insert_element(dst, cpy);
  elem = elem->previous;
 }

 return 0;
}



char*
pelib_map_const_string_const_string_t_string(map_const_string_const_string_t map)
{
 char *str, *grow, *elem;
 size_t i;
 str = malloc(3 * sizeof(char));
 sprintf(str, "[");

 pelib_iterator_pelib_pair_const_string_const_string_t_t *el = map.first;
 while(el != 
# 199 "../include/pelib/map.c" 3 4
            ((void *)0) 
# 199 "../include/pelib/map.c"
                 && el->next != 
# 199 "../include/pelib/map.c" 3 4
                                ((void *)0)
# 199 "../include/pelib/map.c"
                                    )
 {
  elem = pelib_pelib_pair_const_string_const_string_t_string(el->value);
  grow = malloc((strlen(str) + 1) * sizeof(char));
  sprintf(grow, "%s", str);

  free(str);
  str = malloc(strlen(grow) + 1 + strlen(elem) + 1);
  sprintf(str, "%s%s:", grow, elem);
  free(elem);
  free(grow);
  el = el->next;
 }
 while(el != 
# 212 "../include/pelib/map.c" 3 4
            ((void *)0)
# 212 "../include/pelib/map.c"
                )
 {
  elem = pelib_pelib_pair_const_string_const_string_t_string(el->value);
  grow = malloc((strlen(str) + 1) * sizeof(char));
  sprintf(grow, "%s", str);

  free(str);
  str = malloc(strlen(grow) + 1 + strlen(elem) + 1);
  sprintf(str, "%s%s", grow, elem);
  free(elem);
  free(grow);

  el = el->next;
 }

 grow = malloc((strlen(str) + 1) * sizeof(char));
 sprintf(grow, "%s", str);
 sprintf(str, "%s]", grow);
 free(grow);

 return str;
}

char*
pelib_map_const_string_const_string_t_string_detail(map_const_string_const_string_t map, int level)
{
 if(level == 0)
 {
  return pelib_map_const_string_const_string_t_string(map);
 }
 else
 {

  char *str, *grow, *elem;
  size_t i;
  str = malloc(3 * sizeof(char));
  sprintf(str, "[");
  pelib_iterator_pelib_pair_const_string_const_string_t_t *el = map.first;

  while(el != 
# 251 "../include/pelib/map.c" 3 4
             ((void *)0) 
# 251 "../include/pelib/map.c"
                  && el->next != 
# 251 "../include/pelib/map.c" 3 4
                                 ((void *)0)
# 251 "../include/pelib/map.c"
                                     )
  {
   elem = pelib_pelib_pair_const_string_const_string_t_string_detail(el->value, level);
   grow = malloc((strlen(str) + 1) * sizeof(char));
   sprintf(grow, "%s", str);

   free(str);
   str = malloc(strlen(grow) + 1 + strlen(elem) + 1);
   sprintf(str, "%s%s:", grow, elem);
   free(elem);
   free(grow);
  }
  while(el != 
# 263 "../include/pelib/map.c" 3 4
             ((void *)0)
# 263 "../include/pelib/map.c"
                 )
  {
   elem = pelib_pelib_pair_const_string_const_string_t_string_detail(el->value, level);
   grow = malloc((strlen(str) + 1) * sizeof(char));
   sprintf(grow, "%s", str);

   free(str);
   str = malloc(strlen(grow) + 1 + strlen(elem) + 1);
   sprintf(str, "%s%s", grow, elem);
   free(elem);
   free(grow);
  }

  grow = malloc((strlen(str) + 1) * sizeof(char));
  sprintf(grow, "%s", str);
  sprintf(str, "%s]", grow);
  free(grow);

  return str;
 }
}

FILE*
pelib_map_const_string_const_string_t_printf(FILE* stream, map_const_string_const_string_t map)
{
 char * str;
 str = pelib_map_const_string_const_string_t_string(map);

 fprintf(stream, "%s\n", str);
 free(str);

 return stream;
}

FILE*
pelib_map_const_string_const_string_t_printf_detail(FILE* stream, map_const_string_const_string_t map, int level)
{
 char * str;
 str = pelib_map_const_string_const_string_t_string_detail(map, level);

 fprintf(stream, "%s\n", str);
 free(str);

 return stream;
}

int
pelib_map_const_string_const_string_t_destroy(map_const_string_const_string_t map)
{
 pelib_iterator_pelib_pair_const_string_const_string_t_t *elem = map.first;
 while(elem != 
# 313 "../include/pelib/map.c" 3 4
              ((void *)0)
# 313 "../include/pelib/map.c"
                  )
 {
  pelib_iterator_pelib_pair_const_string_const_string_t_t *current = elem;
  elem = elem->next;
  pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_destroy(*current);
 }
 return 1;
}

int
pelib_map_const_string_const_string_t_free_buffer(map_const_string_const_string_t* map)
{
 pelib_iterator_pelib_pair_const_string_const_string_t_t *elem = map->first;
 while(elem != 
# 326 "../include/pelib/map.c" 3 4
              ((void *)0)
# 326 "../include/pelib/map.c"
                  )
 {
  pelib_iterator_pelib_pair_const_string_const_string_t_t *current = elem;
  elem = elem->next;
  pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_free(current);
 }
 return 1;
}

int
pelib_map_const_string_const_string_t_free_struct(map_const_string_const_string_t* map)
{
 free(map);
 return 1;
}

int
pelib_map_const_string_const_string_t_free(map_const_string_const_string_t* map)
{
 pelib_map_const_string_const_string_t_free_buffer(map);
 pelib_map_const_string_const_string_t_free_struct(map);
 return 1;
}

int
pelib_map_const_string_const_string_t_compare(map_const_string_const_string_t a1, map_const_string_const_string_t a2)
{
 pelib_iterator_pelib_pair_const_string_const_string_t_t *e1 = a1.first;
 pelib_iterator_pelib_pair_const_string_const_string_t_t *e2 = a2.first;

 while(e1 != 
# 356 "../include/pelib/map.c" 3 4
            ((void *)0) 
# 356 "../include/pelib/map.c"
                 && e2 != 
# 356 "../include/pelib/map.c" 3 4
                          ((void *)0) 
# 356 "../include/pelib/map.c"
                               && pelib_pelib_pair_const_string_const_string_t_compare(e1->value, e2->value) == 0)
 {
  e1 = e1->next;
  e2 = e2->next;
 }

 if(e1 == 
# 362 "../include/pelib/map.c" 3 4
         ((void *)0) 
# 362 "../include/pelib/map.c"
              && e2 != 
# 362 "../include/pelib/map.c" 3 4
                       ((void *)0)
# 362 "../include/pelib/map.c"
                           )
 {
  return 1;
 }
 else if(e1 != 
# 366 "../include/pelib/map.c" 3 4
              ((void *)0) 
# 366 "../include/pelib/map.c"
                   && e2 == 
# 366 "../include/pelib/map.c" 3 4
                            ((void *)0)
# 366 "../include/pelib/map.c"
                                )
 {
  return -1;
 }
 else return pelib_pelib_pair_const_string_const_string_t_compare(e1->value, e2->value);
}


pelib_iterator_pelib_pair_const_string_const_string_t_t*
pelib_map_const_string_const_string_begin(map_const_string_const_string_t *map)
{
 return map->first;
}


pelib_iterator_pelib_pair_const_string_const_string_t_t*
pelib_map_const_string_const_string_end(map_const_string_const_string_t *map)
{
 return 
# 384 "../include/pelib/map.c" 3 4
       ((void *)0)
# 384 "../include/pelib/map.c"
           ;
}

pelib_iterator_pelib_pair_const_string_const_string_t_t*
pelib_map_const_string_const_string_next(pelib_iterator_pelib_pair_const_string_const_string_t_t *i)
{
 return pelib_pelib_iterator_pelib_pair_const_string_const_string_t_next(i);
}

pelib_pair_const_string_const_string_t
pelib_map_const_string_const_string_read(pelib_iterator_pelib_pair_const_string_const_string_t_t *i)
{
 return pelib_pelib_iterator_pelib_pair_const_string_const_string_t_read(i);
}

pelib_iterator_pelib_pair_const_string_const_string_t_t*
pelib_map_const_string_const_string_find(map_const_string_const_string_t *map, const_string key)
{
 map_pelib_iterator_pelib_pair_const_string_const_string_t_t *i;
 for(i = pelib_map_const_string_const_string_begin(map); i != pelib_map_const_string_const_string_end(map); i = pelib_map_const_string_const_string_next(i))
 {
  const_string elem_key = pelib_map_const_string_const_string_read(i).key;
  if(pelib_const_string_compare(key, elem_key) == 0)
  {
   return i;
  }
 }

 return 
# 412 "../include/pelib/map.c" 3 4
       ((void *)0)
# 412 "../include/pelib/map.c"
           ;
}

size_t
pelib_map_const_string_const_string_size(map_const_string_const_string_t *map)
{
 size_t size = 0;
 pelib_iterator_pelib_pair_const_string_const_string_t_t *i;


 for(i = pelib_map_const_string_const_string_begin(map); i != pelib_map_const_string_const_string_end(map); i = pelib_map_const_string_const_string_next(i), size++);

 return size;
}
# 137 "const_string.c" 2



# 1 "../include/pelib/set.c" 1
# 26 "../include/pelib/set.c"
# 1 "/usr/include/assert.h" 1 3 4
# 27 "../include/pelib/set.c" 2
# 58 "../include/pelib/set.c"
pelib_set_pelib_pair_const_string_const_string_t_t*
pelib_pelib_set_pelib_pair_const_string_const_string_t_t_alloc_struct()
{
 pelib_set_pelib_pair_const_string_const_string_t_t* set;

 set = malloc(sizeof(pelib_set_pelib_pair_const_string_const_string_t_t));
 
# 64 "../include/pelib/set.c" 3 4
((void) (0))
# 64 "../include/pelib/set.c"
                   ;

 return set;
}

pelib_set_pelib_pair_const_string_const_string_t_t*
pelib_pelib_set_pelib_pair_const_string_const_string_t_t_alloc()
{
 pelib_set_pelib_pair_const_string_const_string_t_t* set;

 set = malloc(sizeof(pelib_set_pelib_pair_const_string_const_string_t_t));
 
# 75 "../include/pelib/set.c" 3 4
((void) (0))
# 75 "../include/pelib/set.c"
                   ;

 return set;
}

int
pelib_pelib_set_pelib_pair_const_string_const_string_t_t_init(pelib_set_pelib_pair_const_string_const_string_t_t* set)
{
 set->first = 
# 83 "../include/pelib/set.c" 3 4
             ((void *)0)
# 83 "../include/pelib/set.c"
                 ;
 set->middle = 
# 84 "../include/pelib/set.c" 3 4
              ((void *)0)
# 84 "../include/pelib/set.c"
                  ;
 set->last = 
# 85 "../include/pelib/set.c" 3 4
            ((void *)0)
# 85 "../include/pelib/set.c"
                ;

 return 1;
}


static
int
pelib_pelib_set_pelib_pair_const_string_const_string_t_insert_element(pelib_set_pelib_pair_const_string_const_string_t_t *set, pelib_iterator_pelib_pair_const_string_const_string_t_t *elem)
{
 pelib_iterator_pelib_pair_const_string_const_string_t_t *current = set->first, *previous = 
# 95 "../include/pelib/set.c" 3 4
                                                           ((void *)0)
# 95 "../include/pelib/set.c"
                                                               ;




 if(current != 
# 100 "../include/pelib/set.c" 3 4
              ((void *)0)
# 100 "../include/pelib/set.c"
                  )
 {


  while(current != 
# 104 "../include/pelib/set.c" 3 4
                  ((void *)0) 
# 104 "../include/pelib/set.c"
                       && pelib_pelib_pair_const_string_const_string_t_compare(elem->value, current->value) > 0)
  {
   previous = current;
   current = current->next;
  }


  if(current != 0 && pelib_pelib_pair_const_string_const_string_t_compare(elem->value, current->value) == 0)
  {
   return 0;
  }


  elem->previous = previous;
  elem->next = current;
  if(previous != 
# 119 "../include/pelib/set.c" 3 4
                ((void *)0)
# 119 "../include/pelib/set.c"
                    )
  {
   previous->next = elem;
  }




  if(current == 
# 127 "../include/pelib/set.c" 3 4
               ((void *)0)
# 127 "../include/pelib/set.c"
                   )
  {
   set->last = elem;
  }
  else
  {
   if(current == set->first)
   {
    set->first = elem;
   }
   current->previous = elem;
  }
 }
 else
 {
  elem->next = 
# 142 "../include/pelib/set.c" 3 4
              ((void *)0)
# 142 "../include/pelib/set.c"
                  ;
  elem->previous = 
# 143 "../include/pelib/set.c" 3 4
                  ((void *)0)
# 143 "../include/pelib/set.c"
                      ;
  set->first = elem;
  set->last = elem;
 }

 return 1;
}

int
pelib_pelib_set_pelib_pair_const_string_const_string_t_insert(pelib_set_pelib_pair_const_string_const_string_t_t* set, pelib_pair_const_string_const_string_t value)
{
 pelib_iterator_pelib_pair_const_string_const_string_t_t *new = pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_alloc();
 pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_init(new);
 pelib_pelib_pair_const_string_const_string_t_copy(value, &new->value);
 if(!pelib_pelib_set_pelib_pair_const_string_const_string_t_insert_element(set, new))
 {
  pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_free(new);
  return 0;
 }
 else
 {
  return 1;
 }
}

int
pelib_pelib_set_pelib_pair_const_string_const_string_t_t_copy(pelib_set_pelib_pair_const_string_const_string_t_t src, pelib_set_pelib_pair_const_string_const_string_t_t* dst)
{
 size_t i;

 pelib_iterator_pelib_pair_const_string_const_string_t_t *elem = src.last;
 while(elem != 
# 174 "../include/pelib/set.c" 3 4
              ((void *)0)
# 174 "../include/pelib/set.c"
                  )
 {
  pelib_iterator_pelib_pair_const_string_const_string_t_t *cpy = pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_alloc();
  pelib_pelib_pair_const_string_const_string_t_copy(elem->value, &cpy->value);
  pelib_pelib_set_pelib_pair_const_string_const_string_t_insert_element(dst, cpy);
  elem = elem->previous;
 }

 return 0;
}



char*
pelib_pelib_set_pelib_pair_const_string_const_string_t_t_string(pelib_set_pelib_pair_const_string_const_string_t_t set)
{
 char *str, *grow, *elem;
 size_t i;
 str = malloc(3 * sizeof(char));
 sprintf(str, "[");

 pelib_iterator_pelib_pair_const_string_const_string_t_t *el = set.first;
 while(el != 
# 196 "../include/pelib/set.c" 3 4
            ((void *)0) 
# 196 "../include/pelib/set.c"
                 && el->next != 
# 196 "../include/pelib/set.c" 3 4
                                ((void *)0)
# 196 "../include/pelib/set.c"
                                    )
 {
  elem = pelib_pelib_pair_const_string_const_string_t_string(el->value);
  grow = malloc((strlen(str) + 1) * sizeof(char));
  sprintf(grow, "%s", str);

  free(str);
  str = malloc(strlen(grow) + 1 + strlen(elem) + 1);
  sprintf(str, "%s%s:", grow, elem);
  free(elem);
  free(grow);
  el = el->next;
 }
 while(el != 
# 209 "../include/pelib/set.c" 3 4
            ((void *)0)
# 209 "../include/pelib/set.c"
                )
 {
  elem = pelib_pelib_pair_const_string_const_string_t_string(el->value);
  grow = malloc((strlen(str) + 1) * sizeof(char));
  sprintf(grow, "%s", str);

  free(str);
  str = malloc(strlen(grow) + 1 + strlen(elem) + 1);
  sprintf(str, "%s%s", grow, elem);
  free(elem);
  free(grow);

  el = el->next;
 }

 grow = malloc((strlen(str) + 1) * sizeof(char));
 sprintf(grow, "%s", str);
 sprintf(str, "%s]", grow);
 free(grow);

 return str;
}

char*
pelib_pelib_set_pelib_pair_const_string_const_string_t_t_string_detail(pelib_set_pelib_pair_const_string_const_string_t_t set, int level)
{
 if(level == 0)
 {
  return pelib_pelib_set_pelib_pair_const_string_const_string_t_t_string(set);
 }
 else
 {

  char *str, *grow, *elem;
  size_t i;
  str = malloc(3 * sizeof(char));
  sprintf(str, "[");
  pelib_iterator_pelib_pair_const_string_const_string_t_t *el = set.first;

  while(el != 
# 248 "../include/pelib/set.c" 3 4
             ((void *)0) 
# 248 "../include/pelib/set.c"
                  && el->next != 
# 248 "../include/pelib/set.c" 3 4
                                 ((void *)0)
# 248 "../include/pelib/set.c"
                                     )
  {
   elem = pelib_pelib_pair_const_string_const_string_t_string_detail(el->value, level);
   grow = malloc((strlen(str) + 1) * sizeof(char));
   sprintf(grow, "%s", str);

   free(str);
   str = malloc(strlen(grow) + 1 + strlen(elem) + 1);
   sprintf(str, "%s%s:", grow, elem);
   free(elem);
   free(grow);
  }
  while(el != 
# 260 "../include/pelib/set.c" 3 4
             ((void *)0)
# 260 "../include/pelib/set.c"
                 )
  {
   elem = pelib_pelib_pair_const_string_const_string_t_string_detail(el->value, level);
   grow = malloc((strlen(str) + 1) * sizeof(char));
   sprintf(grow, "%s", str);

   free(str);
   str = malloc(strlen(grow) + 1 + strlen(elem) + 1);
   sprintf(str, "%s%s", grow, elem);
   free(elem);
   free(grow);
  }

  grow = malloc((strlen(str) + 1) * sizeof(char));
  sprintf(grow, "%s", str);
  sprintf(str, "%s]", grow);
  free(grow);

  return str;
 }
}

FILE*
pelib_pelib_set_pelib_pair_const_string_const_string_t_t_printf(FILE* stream, pelib_set_pelib_pair_const_string_const_string_t_t set)
{
 char * str;
 str = pelib_pelib_set_pelib_pair_const_string_const_string_t_t_string(set);

 fprintf(stream, "%s\n", str);
 free(str);

 return stream;
}

FILE*
pelib_pelib_set_pelib_pair_const_string_const_string_t_t_printf_detail(FILE* stream, pelib_set_pelib_pair_const_string_const_string_t_t set, int level)
{
 char * str;
 str = pelib_pelib_set_pelib_pair_const_string_const_string_t_t_string_detail(set, level);

 fprintf(stream, "%s\n", str);
 free(str);

 return stream;
}

int
pelib_pelib_set_pelib_pair_const_string_const_string_t_t_destroy(pelib_set_pelib_pair_const_string_const_string_t_t set)
{
 pelib_iterator_pelib_pair_const_string_const_string_t_t *elem = set.first;
 while(elem != 
# 310 "../include/pelib/set.c" 3 4
              ((void *)0)
# 310 "../include/pelib/set.c"
                  )
 {
  pelib_iterator_pelib_pair_const_string_const_string_t_t *current = elem;
  elem = elem->next;
  pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_destroy(*current);
  pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_free(current);
 }
 return 1;
}

int
pelib_pelib_set_pelib_pair_const_string_const_string_t_t_free_buffer(pelib_set_pelib_pair_const_string_const_string_t_t* set)
{
 pelib_iterator_pelib_pair_const_string_const_string_t_t *elem = set->first;
 while(elem != 
# 324 "../include/pelib/set.c" 3 4
              ((void *)0)
# 324 "../include/pelib/set.c"
                  )
 {
  pelib_iterator_pelib_pair_const_string_const_string_t_t *current = elem;
  elem = elem->next;
  pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_destroy(*current);
  pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_free(current);
 }
 return 1;
}

int
pelib_pelib_set_pelib_pair_const_string_const_string_t_t_free_struct(pelib_set_pelib_pair_const_string_const_string_t_t* set)
{
 free(set);
 return 1;
}

int
pelib_pelib_set_pelib_pair_const_string_const_string_t_t_free(pelib_set_pelib_pair_const_string_const_string_t_t* set)
{
 pelib_pelib_set_pelib_pair_const_string_const_string_t_t_free_buffer(set);
 pelib_pelib_set_pelib_pair_const_string_const_string_t_t_free_struct(set);
 return 1;
}

int
pelib_pelib_set_pelib_pair_const_string_const_string_t_t_compare(pelib_set_pelib_pair_const_string_const_string_t_t a1, pelib_set_pelib_pair_const_string_const_string_t_t a2)
{
 pelib_iterator_pelib_pair_const_string_const_string_t_t *e1 = a1.first;
 pelib_iterator_pelib_pair_const_string_const_string_t_t *e2 = a2.first;

 while(e1 != 
# 355 "../include/pelib/set.c" 3 4
            ((void *)0) 
# 355 "../include/pelib/set.c"
                 && e2 != 
# 355 "../include/pelib/set.c" 3 4
                          ((void *)0) 
# 355 "../include/pelib/set.c"
                               && pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_compare(*e1, *e2) == 0)
 {
  e1 = e1->next;
  e2 = e2->next;
 }

 if(e1 == 
# 361 "../include/pelib/set.c" 3 4
         ((void *)0) 
# 361 "../include/pelib/set.c"
              && e2 != 
# 361 "../include/pelib/set.c" 3 4
                       ((void *)0)
# 361 "../include/pelib/set.c"
                           )
 {
  return 1;
 }
 else if(e1 != 
# 365 "../include/pelib/set.c" 3 4
              ((void *)0) 
# 365 "../include/pelib/set.c"
                   && e2 == 
# 365 "../include/pelib/set.c" 3 4
                            ((void *)0)
# 365 "../include/pelib/set.c"
                                )
 {
  return -1;
 }
 else return pelib_pelib_iterator_pelib_pair_const_string_const_string_t_t_compare(*e1, *e2);
}
# 141 "const_string.c" 2
