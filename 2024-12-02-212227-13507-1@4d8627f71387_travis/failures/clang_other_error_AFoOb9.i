# 1 "bitmap.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 398 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "bitmap.c" 2
# 21 "bitmap.c"
# 1 "../../../config.h" 1
# 22 "bitmap.c" 2
# 1 "/usr/include/stdlib.h" 1 3 4
# 26 "/usr/include/stdlib.h" 3 4
# 1 "/usr/include/bits/libc-header-start.h" 1 3 4
# 33 "/usr/include/bits/libc-header-start.h" 3 4
# 1 "/usr/include/features.h" 1 3 4
# 402 "/usr/include/features.h" 3 4
# 1 "/usr/include/features-time64.h" 1 3 4
# 20 "/usr/include/features-time64.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 21 "/usr/include/features-time64.h" 2 3 4
# 1 "/usr/include/bits/timesize.h" 1 3 4
# 19 "/usr/include/bits/timesize.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 20 "/usr/include/bits/timesize.h" 2 3 4
# 22 "/usr/include/features-time64.h" 2 3 4
# 403 "/usr/include/features.h" 2 3 4
# 489 "/usr/include/features.h" 3 4
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 490 "/usr/include/features.h" 2 3 4
# 511 "/usr/include/features.h" 3 4
# 1 "/usr/include/sys/cdefs.h" 1 3 4
# 730 "/usr/include/sys/cdefs.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 731 "/usr/include/sys/cdefs.h" 2 3 4
# 1 "/usr/include/bits/long-double.h" 1 3 4
# 732 "/usr/include/sys/cdefs.h" 2 3 4
# 512 "/usr/include/features.h" 2 3 4
# 535 "/usr/include/features.h" 3 4
# 1 "/usr/include/gnu/stubs.h" 1 3 4
# 10 "/usr/include/gnu/stubs.h" 3 4
# 1 "/usr/include/gnu/stubs-64.h" 1 3 4
# 11 "/usr/include/gnu/stubs.h" 2 3 4
# 536 "/usr/include/features.h" 2 3 4
# 34 "/usr/include/bits/libc-header-start.h" 2 3 4
# 27 "/usr/include/stdlib.h" 2 3 4





# 1 "/usr/bin/../lib/clang/19/include/stddef.h" 1 3 4
# 93 "/usr/bin/../lib/clang/19/include/stddef.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/__stddef_size_t.h" 1 3 4
# 18 "/usr/bin/../lib/clang/19/include/__stddef_size_t.h" 3 4
typedef long unsigned int size_t;
# 94 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3 4
# 103 "/usr/bin/../lib/clang/19/include/stddef.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/__stddef_wchar_t.h" 1 3 4
# 24 "/usr/bin/../lib/clang/19/include/__stddef_wchar_t.h" 3 4
typedef int wchar_t;
# 104 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3 4




# 1 "/usr/bin/../lib/clang/19/include/__stddef_null.h" 1 3 4
# 109 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3 4
# 33 "/usr/include/stdlib.h" 2 3 4







# 1 "/usr/include/bits/waitflags.h" 1 3 4
# 41 "/usr/include/stdlib.h" 2 3 4
# 1 "/usr/include/bits/waitstatus.h" 1 3 4
# 42 "/usr/include/stdlib.h" 2 3 4
# 56 "/usr/include/stdlib.h" 3 4
# 1 "/usr/include/bits/floatn.h" 1 3 4
# 119 "/usr/include/bits/floatn.h" 3 4
# 1 "/usr/include/bits/floatn-common.h" 1 3 4
# 24 "/usr/include/bits/floatn-common.h" 3 4
# 1 "/usr/include/bits/long-double.h" 1 3 4
# 25 "/usr/include/bits/floatn-common.h" 2 3 4
# 214 "/usr/include/bits/floatn-common.h" 3 4
typedef float _Float32;
# 251 "/usr/include/bits/floatn-common.h" 3 4
typedef double _Float64;
# 268 "/usr/include/bits/floatn-common.h" 3 4
typedef double _Float32x;
# 285 "/usr/include/bits/floatn-common.h" 3 4
typedef long double _Float64x;
# 120 "/usr/include/bits/floatn.h" 2 3 4
# 57 "/usr/include/stdlib.h" 2 3 4


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
# 98 "/usr/include/stdlib.h" 3 4
extern size_t __ctype_get_mb_cur_max (void) __attribute__ ((__nothrow__ )) ;



extern double atof (const char *__nptr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern int atoi (const char *__nptr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern long int atol (const char *__nptr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;



__extension__ extern long long int atoll (const char *__nptr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;



extern double strtod (const char *__restrict __nptr,
        char **__restrict __endptr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));



extern float strtof (const char *__restrict __nptr,
       char **__restrict __endptr) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));

extern long double strtold (const char *__restrict __nptr,
       char **__restrict __endptr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));
# 177 "/usr/include/stdlib.h" 3 4
extern long int strtol (const char *__restrict __nptr,
   char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));

extern unsigned long int strtoul (const char *__restrict __nptr,
      char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));



__extension__
extern long long int strtoq (const char *__restrict __nptr,
        char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));

__extension__
extern unsigned long long int strtouq (const char *__restrict __nptr,
           char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));




__extension__
extern long long int strtoll (const char *__restrict __nptr,
         char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));

__extension__
extern unsigned long long int strtoull (const char *__restrict __nptr,
     char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));
# 480 "/usr/include/stdlib.h" 3 4
extern __inline __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ )) atoi (const char *__nptr)
{
  return (int) strtol (__nptr, (char **) ((void*)0), 10);
}
extern __inline __attribute__ ((__gnu_inline__)) long int
__attribute__ ((__nothrow__ )) atol (const char *__nptr)
{
  return strtol (__nptr, (char **) ((void*)0), 10);
}


__extension__ extern __inline __attribute__ ((__gnu_inline__)) long long int
__attribute__ ((__nothrow__ )) atoll (const char *__nptr)
{
  return strtoll (__nptr, (char **) ((void*)0), 10);
}
# 505 "/usr/include/stdlib.h" 3 4
extern char *l64a (long int __n) __attribute__ ((__nothrow__ )) ;


extern long int a64l (const char *__s)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;




# 1 "/usr/include/sys/types.h" 1 3 4
# 29 "/usr/include/sys/types.h" 3 4
# 1 "/usr/include/bits/types.h" 1 3 4
# 27 "/usr/include/bits/types.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 28 "/usr/include/bits/types.h" 2 3 4
# 1 "/usr/include/bits/timesize.h" 1 3 4
# 19 "/usr/include/bits/timesize.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 20 "/usr/include/bits/timesize.h" 2 3 4
# 29 "/usr/include/bits/types.h" 2 3 4


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






typedef __int8_t __int_least8_t;
typedef __uint8_t __uint_least8_t;
typedef __int16_t __int_least16_t;
typedef __uint16_t __uint_least16_t;
typedef __int32_t __int_least32_t;
typedef __uint32_t __uint_least32_t;
typedef __int64_t __int_least64_t;
typedef __uint64_t __uint_least64_t;



typedef long int __quad_t;
typedef unsigned long int __u_quad_t;







typedef long int __intmax_t;
typedef unsigned long int __uintmax_t;
# 141 "/usr/include/bits/types.h" 3 4
# 1 "/usr/include/bits/typesizes.h" 1 3 4
# 142 "/usr/include/bits/types.h" 2 3 4
# 1 "/usr/include/bits/time64.h" 1 3 4
# 143 "/usr/include/bits/types.h" 2 3 4


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
typedef long int __suseconds64_t;

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
typedef char *__caddr_t;


typedef long int __intptr_t;


typedef unsigned int __socklen_t;




typedef int __sig_atomic_t;
# 30 "/usr/include/sys/types.h" 2 3 4



typedef __u_char u_char;
typedef __u_short u_short;
typedef __u_int u_int;
typedef __u_long u_long;
typedef __quad_t quad_t;
typedef __u_quad_t u_quad_t;
typedef __fsid_t fsid_t;


typedef __loff_t loff_t;




typedef __ino_t ino_t;
# 59 "/usr/include/sys/types.h" 3 4
typedef __dev_t dev_t;




typedef __gid_t gid_t;




typedef __mode_t mode_t;




typedef __nlink_t nlink_t;




typedef __uid_t uid_t;





typedef __off_t off_t;
# 97 "/usr/include/sys/types.h" 3 4
typedef __pid_t pid_t;





typedef __id_t id_t;




typedef __ssize_t ssize_t;





typedef __daddr_t daddr_t;
typedef __caddr_t caddr_t;





typedef __key_t key_t;




# 1 "/usr/include/bits/types/clock_t.h" 1 3 4






typedef __clock_t clock_t;
# 127 "/usr/include/sys/types.h" 2 3 4

# 1 "/usr/include/bits/types/clockid_t.h" 1 3 4






typedef __clockid_t clockid_t;
# 129 "/usr/include/sys/types.h" 2 3 4
# 1 "/usr/include/bits/types/time_t.h" 1 3 4
# 10 "/usr/include/bits/types/time_t.h" 3 4
typedef __time_t time_t;
# 130 "/usr/include/sys/types.h" 2 3 4
# 1 "/usr/include/bits/types/timer_t.h" 1 3 4






typedef __timer_t timer_t;
# 131 "/usr/include/sys/types.h" 2 3 4
# 144 "/usr/include/sys/types.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/stddef.h" 1 3 4
# 93 "/usr/bin/../lib/clang/19/include/stddef.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/__stddef_size_t.h" 1 3 4
# 94 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3 4
# 145 "/usr/include/sys/types.h" 2 3 4



typedef unsigned long int ulong;
typedef unsigned short int ushort;
typedef unsigned int uint;




# 1 "/usr/include/bits/stdint-intn.h" 1 3 4
# 24 "/usr/include/bits/stdint-intn.h" 3 4
typedef __int8_t int8_t;
typedef __int16_t int16_t;
typedef __int32_t int32_t;
typedef __int64_t int64_t;
# 156 "/usr/include/sys/types.h" 2 3 4


typedef __uint8_t u_int8_t;
typedef __uint16_t u_int16_t;
typedef __uint32_t u_int32_t;
typedef __uint64_t u_int64_t;


typedef int register_t __attribute__ ((__mode__ (__word__)));
# 176 "/usr/include/sys/types.h" 3 4
# 1 "/usr/include/endian.h" 1 3 4
# 24 "/usr/include/endian.h" 3 4
# 1 "/usr/include/bits/endian.h" 1 3 4
# 35 "/usr/include/bits/endian.h" 3 4
# 1 "/usr/include/bits/endianness.h" 1 3 4
# 36 "/usr/include/bits/endian.h" 2 3 4
# 25 "/usr/include/endian.h" 2 3 4
# 35 "/usr/include/endian.h" 3 4
# 1 "/usr/include/bits/byteswap.h" 1 3 4
# 33 "/usr/include/bits/byteswap.h" 3 4
static __inline __uint16_t
__bswap_16 (__uint16_t __bsx)
{



  return ((__uint16_t) ((((__bsx) >> 8) & 0xff) | (((__bsx) & 0xff) << 8)));

}






static __inline __uint32_t
__bswap_32 (__uint32_t __bsx)
{



  return ((((__bsx) & 0xff000000u) >> 24) | (((__bsx) & 0x00ff0000u) >> 8) | (((__bsx) & 0x0000ff00u) << 8) | (((__bsx) & 0x000000ffu) << 24));

}
# 69 "/usr/include/bits/byteswap.h" 3 4
__extension__ static __inline __uint64_t
__bswap_64 (__uint64_t __bsx)
{



  return ((((__bsx) & 0xff00000000000000ull) >> 56) | (((__bsx) & 0x00ff000000000000ull) >> 40) | (((__bsx) & 0x0000ff0000000000ull) >> 24) | (((__bsx) & 0x000000ff00000000ull) >> 8) | (((__bsx) & 0x00000000ff000000ull) << 8) | (((__bsx) & 0x0000000000ff0000ull) << 24) | (((__bsx) & 0x000000000000ff00ull) << 40) | (((__bsx) & 0x00000000000000ffull) << 56));

}
# 36 "/usr/include/endian.h" 2 3 4
# 1 "/usr/include/bits/uintn-identity.h" 1 3 4
# 32 "/usr/include/bits/uintn-identity.h" 3 4
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
# 37 "/usr/include/endian.h" 2 3 4
# 177 "/usr/include/sys/types.h" 2 3 4


# 1 "/usr/include/sys/select.h" 1 3 4
# 30 "/usr/include/sys/select.h" 3 4
# 1 "/usr/include/bits/select.h" 1 3 4
# 31 "/usr/include/sys/select.h" 2 3 4


# 1 "/usr/include/bits/types/sigset_t.h" 1 3 4



# 1 "/usr/include/bits/types/__sigset_t.h" 1 3 4




typedef struct
{
  unsigned long int __val[(1024 / (8 * sizeof (unsigned long int)))];
} __sigset_t;
# 5 "/usr/include/bits/types/sigset_t.h" 2 3 4


typedef __sigset_t sigset_t;
# 34 "/usr/include/sys/select.h" 2 3 4



# 1 "/usr/include/bits/types/struct_timeval.h" 1 3 4







struct timeval
{




  __time_t tv_sec;
  __suseconds_t tv_usec;

};
# 38 "/usr/include/sys/select.h" 2 3 4

# 1 "/usr/include/bits/types/struct_timespec.h" 1 3 4
# 11 "/usr/include/bits/types/struct_timespec.h" 3 4
struct timespec
{



  __time_t tv_sec;




  __syscall_slong_t tv_nsec;
# 31 "/usr/include/bits/types/struct_timespec.h" 3 4
};
# 40 "/usr/include/sys/select.h" 2 3 4



typedef __suseconds_t suseconds_t;





typedef long int __fd_mask;
# 59 "/usr/include/sys/select.h" 3 4
typedef struct
  {






    __fd_mask __fds_bits[1024 / (8 * (int) sizeof (__fd_mask))];


  } fd_set;






typedef __fd_mask fd_mask;
# 102 "/usr/include/sys/select.h" 3 4
extern int select (int __nfds, fd_set *__restrict __readfds,
     fd_set *__restrict __writefds,
     fd_set *__restrict __exceptfds,
     struct timeval *__restrict __timeout);
# 127 "/usr/include/sys/select.h" 3 4
extern int pselect (int __nfds, fd_set *__restrict __readfds,
      fd_set *__restrict __writefds,
      fd_set *__restrict __exceptfds,
      const struct timespec *__restrict __timeout,
      const __sigset_t *__restrict __sigmask);
# 180 "/usr/include/sys/types.h" 2 3 4





typedef __blksize_t blksize_t;






typedef __blkcnt_t blkcnt_t;



typedef __fsblkcnt_t fsblkcnt_t;



typedef __fsfilcnt_t fsfilcnt_t;
# 227 "/usr/include/sys/types.h" 3 4
# 1 "/usr/include/bits/pthreadtypes.h" 1 3 4
# 23 "/usr/include/bits/pthreadtypes.h" 3 4
# 1 "/usr/include/bits/thread-shared-types.h" 1 3 4
# 44 "/usr/include/bits/thread-shared-types.h" 3 4
# 1 "/usr/include/bits/pthreadtypes-arch.h" 1 3 4
# 21 "/usr/include/bits/pthreadtypes-arch.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 22 "/usr/include/bits/pthreadtypes-arch.h" 2 3 4
# 45 "/usr/include/bits/thread-shared-types.h" 2 3 4

# 1 "/usr/include/bits/atomic_wide_counter.h" 1 3 4
# 25 "/usr/include/bits/atomic_wide_counter.h" 3 4
typedef union
{
  __extension__ unsigned long long int __value64;
  struct
  {
    unsigned int __low;
    unsigned int __high;
  } __value32;
} __atomic_wide_counter;
# 47 "/usr/include/bits/thread-shared-types.h" 2 3 4




typedef struct __pthread_internal_list
{
  struct __pthread_internal_list *__prev;
  struct __pthread_internal_list *__next;
} __pthread_list_t;

typedef struct __pthread_internal_slist
{
  struct __pthread_internal_slist *__next;
} __pthread_slist_t;
# 76 "/usr/include/bits/thread-shared-types.h" 3 4
# 1 "/usr/include/bits/struct_mutex.h" 1 3 4
# 22 "/usr/include/bits/struct_mutex.h" 3 4
struct __pthread_mutex_s
{
  int __lock;
  unsigned int __count;
  int __owner;

  unsigned int __nusers;



  int __kind;

  short __spins;
  short __elision;
  __pthread_list_t __list;
# 53 "/usr/include/bits/struct_mutex.h" 3 4
};
# 77 "/usr/include/bits/thread-shared-types.h" 2 3 4
# 89 "/usr/include/bits/thread-shared-types.h" 3 4
# 1 "/usr/include/bits/struct_rwlock.h" 1 3 4
# 23 "/usr/include/bits/struct_rwlock.h" 3 4
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
# 55 "/usr/include/bits/struct_rwlock.h" 3 4
};
# 90 "/usr/include/bits/thread-shared-types.h" 2 3 4




struct __pthread_cond_s
{
  __atomic_wide_counter __wseq;
  __atomic_wide_counter __g1_start;
  unsigned int __g_refs[2] ;
  unsigned int __g_size[2];
  unsigned int __g1_orig_size;
  unsigned int __wrefs;
  unsigned int __g_signals[2];
};

typedef unsigned int __tss_t;
typedef unsigned long int __thrd_t;

typedef struct
{
  int __data ;
} __once_flag;
# 24 "/usr/include/bits/pthreadtypes.h" 2 3 4



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
# 228 "/usr/include/sys/types.h" 2 3 4
# 515 "/usr/include/stdlib.h" 2 3 4






extern long int random (void) __attribute__ ((__nothrow__ ));


extern void srandom (unsigned int __seed) __attribute__ ((__nothrow__ ));





extern char *initstate (unsigned int __seed, char *__statebuf,
   size_t __statelen) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2)));



extern char *setstate (char *__statebuf) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));







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
       int32_t *__restrict __result) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));

extern int srandom_r (unsigned int __seed, struct random_data *__buf)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2)));

extern int initstate_r (unsigned int __seed, char *__restrict __statebuf,
   size_t __statelen,
   struct random_data *__restrict __buf)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2, 4)));

extern int setstate_r (char *__restrict __statebuf,
         struct random_data *__restrict __buf)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));





extern int rand (void) __attribute__ ((__nothrow__ ));

extern void srand (unsigned int __seed) __attribute__ ((__nothrow__ ));



extern int rand_r (unsigned int *__seed) __attribute__ ((__nothrow__ ));







extern double drand48 (void) __attribute__ ((__nothrow__ ));
extern double erand48 (unsigned short int __xsubi[3]) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern long int lrand48 (void) __attribute__ ((__nothrow__ ));
extern long int nrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern long int mrand48 (void) __attribute__ ((__nothrow__ ));
extern long int jrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern void srand48 (long int __seedval) __attribute__ ((__nothrow__ ));
extern unsigned short int *seed48 (unsigned short int __seed16v[3])
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));
extern void lcong48 (unsigned short int __param[7]) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));





struct drand48_data
  {
    unsigned short int __x[3];
    unsigned short int __old_x[3];
    unsigned short int __c;
    unsigned short int __init;
    __extension__ unsigned long long int __a;

  };


extern int drand48_r (struct drand48_data *__restrict __buffer,
        double *__restrict __result) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));
extern int erand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        double *__restrict __result) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));


extern int lrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));
extern int nrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));


extern int mrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));
extern int jrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));


extern int srand48_r (long int __seedval, struct drand48_data *__buffer)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2)));

extern int seed48_r (unsigned short int __seed16v[3],
       struct drand48_data *__buffer) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));

extern int lcong48_r (unsigned short int __param[7],
        struct drand48_data *__buffer)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));


extern __uint32_t arc4random (void)
     __attribute__ ((__nothrow__ )) ;


extern void arc4random_buf (void *__buf, size_t __size)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));



extern __uint32_t arc4random_uniform (__uint32_t __upper_bound)
     __attribute__ ((__nothrow__ )) ;




extern void *malloc (size_t __size) __attribute__ ((__nothrow__ )) __attribute__ ((__malloc__))
                                         ;

extern void *calloc (size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__ )) __attribute__ ((__malloc__)) ;






extern void *realloc (void *__ptr, size_t __size)
     __attribute__ ((__nothrow__ )) __attribute__ ((__warn_unused_result__)) ;


extern void free (void *__ptr) __attribute__ ((__nothrow__ ));







extern void *reallocarray (void *__ptr, size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__ )) __attribute__ ((__warn_unused_result__))

                       ;


extern void *reallocarray (void *__ptr, size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__ )) ;



# 1 "/usr/include/alloca.h" 1 3 4
# 24 "/usr/include/alloca.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/stddef.h" 1 3 4
# 93 "/usr/bin/../lib/clang/19/include/stddef.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/__stddef_size_t.h" 1 3 4
# 94 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3 4
# 25 "/usr/include/alloca.h" 2 3 4







extern void *alloca (size_t __size) __attribute__ ((__nothrow__ ));
# 707 "/usr/include/stdlib.h" 2 3 4





extern void *valloc (size_t __size) __attribute__ ((__nothrow__ )) __attribute__ ((__malloc__))
                                         ;




extern int posix_memalign (void **__memptr, size_t __alignment, size_t __size)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1))) ;




extern void *aligned_alloc (size_t __alignment, size_t __size)
     __attribute__ ((__nothrow__ )) __attribute__ ((__malloc__)) __attribute__ ((__alloc_align__ (1)))
                                         ;



extern void abort (void) __attribute__ ((__nothrow__ )) __attribute__ ((__noreturn__));



extern int atexit (void (*__func) (void)) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));







extern int at_quick_exit (void (*__func) (void)) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));






extern int on_exit (void (*__func) (int __status, void *__arg), void *__arg)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));





extern void exit (int __status) __attribute__ ((__nothrow__ )) __attribute__ ((__noreturn__));





extern void quick_exit (int __status) __attribute__ ((__nothrow__ )) __attribute__ ((__noreturn__));





extern void _Exit (int __status) __attribute__ ((__nothrow__ )) __attribute__ ((__noreturn__));




extern char *getenv (const char *__name) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1))) ;
# 786 "/usr/include/stdlib.h" 3 4
extern int putenv (char *__string) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));





extern int setenv (const char *__name, const char *__value, int __replace)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2)));


extern int unsetenv (const char *__name) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));






extern int clearenv (void) __attribute__ ((__nothrow__ ));
# 814 "/usr/include/stdlib.h" 3 4
extern char *mktemp (char *__template) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));
# 827 "/usr/include/stdlib.h" 3 4
extern int mkstemp (char *__template) __attribute__ ((__nonnull__ (1))) ;
# 849 "/usr/include/stdlib.h" 3 4
extern int mkstemps (char *__template, int __suffixlen) __attribute__ ((__nonnull__ (1))) ;
# 870 "/usr/include/stdlib.h" 3 4
extern char *mkdtemp (char *__template) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1))) ;
# 923 "/usr/include/stdlib.h" 3 4
extern int system (const char *__command) ;
# 940 "/usr/include/stdlib.h" 3 4
extern char *realpath (const char *__restrict __name,
         char *__restrict __resolved) __attribute__ ((__nothrow__ )) ;






typedef int (*__compar_fn_t) (const void *, const void *);
# 960 "/usr/include/stdlib.h" 3 4
extern void *bsearch (const void *__key, const void *__base,
        size_t __nmemb, size_t __size, __compar_fn_t __compar)
     __attribute__ ((__nonnull__ (1, 2, 5))) ;


# 1 "/usr/include/bits/stdlib-bsearch.h" 1 3 4
# 19 "/usr/include/bits/stdlib-bsearch.h" 3 4
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
      __p = (const void *) (((const char *) __base) + (__idx * __size));
      __comparison = (*__compar) (__key, __p);
      if (__comparison < 0)
 __u = __idx;
      else if (__comparison > 0)
 __l = __idx + 1;
      else
 {




   return (void *) __p;



 }
    }

  return ((void*)0);
}
# 966 "/usr/include/stdlib.h" 2 3 4




extern void qsort (void *__base, size_t __nmemb, size_t __size,
     __compar_fn_t __compar) __attribute__ ((__nonnull__ (1, 4)));
# 980 "/usr/include/stdlib.h" 3 4
extern int abs (int __x) __attribute__ ((__nothrow__ )) __attribute__ ((__const__)) ;
extern long int labs (long int __x) __attribute__ ((__nothrow__ )) __attribute__ ((__const__)) ;


__extension__ extern long long int llabs (long long int __x)
     __attribute__ ((__nothrow__ )) __attribute__ ((__const__)) ;






extern div_t div (int __numer, int __denom)
     __attribute__ ((__nothrow__ )) __attribute__ ((__const__)) ;
extern ldiv_t ldiv (long int __numer, long int __denom)
     __attribute__ ((__nothrow__ )) __attribute__ ((__const__)) ;


__extension__ extern lldiv_t lldiv (long long int __numer,
        long long int __denom)
     __attribute__ ((__nothrow__ )) __attribute__ ((__const__)) ;
# 1012 "/usr/include/stdlib.h" 3 4
extern char *ecvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (3, 4))) ;




extern char *fcvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (3, 4))) ;




extern char *gcvt (double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (3))) ;




extern char *qecvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qfcvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qgcvt (long double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (3))) ;




extern int ecvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int fcvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (3, 4, 5)));

extern int qecvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int qfcvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (3, 4, 5)));





extern int mblen (const char *__s, size_t __n) __attribute__ ((__nothrow__ ));


extern int mbtowc (wchar_t *__restrict __pwc,
     const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ ));


extern int wctomb (char *__s, wchar_t __wchar) __attribute__ ((__nothrow__ ));



extern size_t mbstowcs (wchar_t *__restrict __pwcs,
   const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ ))
                                      ;

extern size_t wcstombs (char *__restrict __s,
   const wchar_t *__restrict __pwcs, size_t __n)
     __attribute__ ((__nothrow__ ))

                                    ;






extern int rpmatch (const char *__response) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1))) ;
# 1099 "/usr/include/stdlib.h" 3 4
extern int getsubopt (char **__restrict __optionp,
        char *const *__restrict __tokens,
        char **__restrict __valuep)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2, 3))) ;
# 1145 "/usr/include/stdlib.h" 3 4
extern int getloadavg (double __loadavg[], int __nelem)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));
# 1155 "/usr/include/stdlib.h" 3 4
# 1 "/usr/include/bits/stdlib-float.h" 1 3 4
# 24 "/usr/include/bits/stdlib-float.h" 3 4
extern __inline __attribute__ ((__gnu_inline__)) double
__attribute__ ((__nothrow__ )) atof (const char *__nptr)
{
  return strtod (__nptr, (char **) ((void*)0));
}
# 1156 "/usr/include/stdlib.h" 2 3 4
# 23 "bitmap.c" 2

# 1 "./mdvi.h" 1
# 21 "./mdvi.h"
# 1 "/usr/include/stdio.h" 1 3 4
# 28 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/bits/libc-header-start.h" 1 3 4
# 29 "/usr/include/stdio.h" 2 3 4





# 1 "/usr/bin/../lib/clang/19/include/stddef.h" 1 3 4
# 93 "/usr/bin/../lib/clang/19/include/stddef.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/__stddef_size_t.h" 1 3 4
# 94 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3 4
# 108 "/usr/bin/../lib/clang/19/include/stddef.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/__stddef_null.h" 1 3 4
# 109 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3 4
# 35 "/usr/include/stdio.h" 2 3 4


# 1 "/usr/bin/../lib/clang/19/include/stdarg.h" 1 3 4
# 51 "/usr/bin/../lib/clang/19/include/stdarg.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/__stdarg___gnuc_va_list.h" 1 3 4
# 12 "/usr/bin/../lib/clang/19/include/__stdarg___gnuc_va_list.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 52 "/usr/bin/../lib/clang/19/include/stdarg.h" 2 3 4
# 38 "/usr/include/stdio.h" 2 3 4


# 1 "/usr/include/bits/types/__fpos_t.h" 1 3 4




# 1 "/usr/include/bits/types/__mbstate_t.h" 1 3 4
# 13 "/usr/include/bits/types/__mbstate_t.h" 3 4
typedef struct
{
  int __count;
  union
  {
    unsigned int __wch;
    char __wchb[4];
  } __value;
} __mbstate_t;
# 6 "/usr/include/bits/types/__fpos_t.h" 2 3 4




typedef struct _G_fpos_t
{
  __off_t __pos;
  __mbstate_t __state;
} __fpos_t;
# 41 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/include/bits/types/__fpos64_t.h" 1 3 4
# 10 "/usr/include/bits/types/__fpos64_t.h" 3 4
typedef struct _G_fpos64_t
{
  __off64_t __pos;
  __mbstate_t __state;
} __fpos64_t;
# 42 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/include/bits/types/__FILE.h" 1 3 4



struct _IO_FILE;
typedef struct _IO_FILE __FILE;
# 43 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/include/bits/types/FILE.h" 1 3 4



struct _IO_FILE;


typedef struct _IO_FILE FILE;
# 44 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/include/bits/types/struct_FILE.h" 1 3 4
# 35 "/usr/include/bits/types/struct_FILE.h" 3 4
struct _IO_FILE;
struct _IO_marker;
struct _IO_codecvt;
struct _IO_wide_data;




typedef void _IO_lock_t;





struct _IO_FILE
{
  int _flags;


  char *_IO_read_ptr;
  char *_IO_read_end;
  char *_IO_read_base;
  char *_IO_write_base;
  char *_IO_write_ptr;
  char *_IO_write_end;
  char *_IO_buf_base;
  char *_IO_buf_end;


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







  __off64_t _offset;

  struct _IO_codecvt *_codecvt;
  struct _IO_wide_data *_wide_data;
  struct _IO_FILE *_freeres_list;
  void *_freeres_buf;
  struct _IO_FILE **_prevchain;
  int _mode;

  char _unused2[15 * sizeof (int) - 5 * sizeof (void *)];
};
# 45 "/usr/include/stdio.h" 2 3 4


# 1 "/usr/include/bits/types/cookie_io_functions_t.h" 1 3 4
# 27 "/usr/include/bits/types/cookie_io_functions_t.h" 3 4
typedef __ssize_t cookie_read_function_t (void *__cookie, char *__buf,
                                          size_t __nbytes);







typedef __ssize_t cookie_write_function_t (void *__cookie, const char *__buf,
                                           size_t __nbytes);







typedef int cookie_seek_function_t (void *__cookie, __off64_t *__pos, int __w);


typedef int cookie_close_function_t (void *__cookie);






typedef struct _IO_cookie_io_functions_t
{
  cookie_read_function_t *read;
  cookie_write_function_t *write;
  cookie_seek_function_t *seek;
  cookie_close_function_t *close;
} cookie_io_functions_t;
# 48 "/usr/include/stdio.h" 2 3 4





typedef __gnuc_va_list va_list;
# 85 "/usr/include/stdio.h" 3 4
typedef __fpos_t fpos_t;
# 129 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/bits/stdio_lim.h" 1 3 4
# 130 "/usr/include/stdio.h" 2 3 4
# 149 "/usr/include/stdio.h" 3 4
extern FILE *stdin;
extern FILE *stdout;
extern FILE *stderr;






extern int remove (const char *__filename) __attribute__ ((__nothrow__ ));

extern int rename (const char *__old, const char *__new) __attribute__ ((__nothrow__ ));



extern int renameat (int __oldfd, const char *__old, int __newfd,
       const char *__new) __attribute__ ((__nothrow__ ));
# 184 "/usr/include/stdio.h" 3 4
extern int fclose (FILE *__stream) __attribute__ ((__nonnull__ (1)));
# 194 "/usr/include/stdio.h" 3 4
extern FILE *tmpfile (void)
  __attribute__ ((__malloc__)) ;
# 211 "/usr/include/stdio.h" 3 4
extern char *tmpnam (char[20]) __attribute__ ((__nothrow__ )) ;




extern char *tmpnam_r (char __s[20]) __attribute__ ((__nothrow__ )) ;
# 228 "/usr/include/stdio.h" 3 4
extern char *tempnam (const char *__dir, const char *__pfx)
   __attribute__ ((__nothrow__ )) __attribute__ ((__malloc__)) ;






extern int fflush (FILE *__stream);
# 245 "/usr/include/stdio.h" 3 4
extern int fflush_unlocked (FILE *__stream);
# 264 "/usr/include/stdio.h" 3 4
extern FILE *fopen (const char *__restrict __filename,
      const char *__restrict __modes)
  __attribute__ ((__malloc__)) ;




extern FILE *freopen (const char *__restrict __filename,
        const char *__restrict __modes,
        FILE *__restrict __stream) __attribute__ ((__nonnull__ (3)));
# 299 "/usr/include/stdio.h" 3 4
extern FILE *fdopen (int __fd, const char *__modes) __attribute__ ((__nothrow__ ))
  __attribute__ ((__malloc__)) ;





extern FILE *fopencookie (void *__restrict __magic_cookie,
     const char *__restrict __modes,
     cookie_io_functions_t __io_funcs) __attribute__ ((__nothrow__ ))
  __attribute__ ((__malloc__)) ;




extern FILE *fmemopen (void *__s, size_t __len, const char *__modes)
  __attribute__ ((__nothrow__ )) __attribute__ ((__malloc__)) ;




extern FILE *open_memstream (char **__bufloc, size_t *__sizeloc) __attribute__ ((__nothrow__ ))
  __attribute__ ((__malloc__)) ;
# 334 "/usr/include/stdio.h" 3 4
extern void setbuf (FILE *__restrict __stream, char *__restrict __buf) __attribute__ ((__nothrow__ ))
  __attribute__ ((__nonnull__ (1)));



extern int setvbuf (FILE *__restrict __stream, char *__restrict __buf,
      int __modes, size_t __n) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));




extern void setbuffer (FILE *__restrict __stream, char *__restrict __buf,
         size_t __size) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern void setlinebuf (FILE *__stream) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));







extern int fprintf (FILE *__restrict __stream,
      const char *__restrict __format, ...) __attribute__ ((__nonnull__ (1)));




extern int printf (const char *__restrict __format, ...);

extern int sprintf (char *__restrict __s,
      const char *__restrict __format, ...) __attribute__ ((__nothrow__));





extern int vfprintf (FILE *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg) __attribute__ ((__nonnull__ (1)));




extern int vprintf (const char *__restrict __format, __gnuc_va_list __arg);

extern int vsprintf (char *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg) __attribute__ ((__nothrow__));



extern int snprintf (char *__restrict __s, size_t __maxlen,
       const char *__restrict __format, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 4)));

extern int vsnprintf (char *__restrict __s, size_t __maxlen,
        const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 0)));





extern int vasprintf (char **__restrict __ptr, const char *__restrict __f,
        __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 0))) ;
extern int __asprintf (char **__restrict __ptr,
         const char *__restrict __fmt, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 3))) ;
extern int asprintf (char **__restrict __ptr,
       const char *__restrict __fmt, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 3))) ;




extern int vdprintf (int __fd, const char *__restrict __fmt,
       __gnuc_va_list __arg)
     __attribute__ ((__format__ (__printf__, 2, 0)));
extern int dprintf (int __fd, const char *__restrict __fmt, ...)
     __attribute__ ((__format__ (__printf__, 2, 3)));







extern int fscanf (FILE *__restrict __stream,
     const char *__restrict __format, ...) __attribute__ ((__nonnull__ (1)));




extern int scanf (const char *__restrict __format, ...) ;

extern int sscanf (const char *__restrict __s,
     const char *__restrict __format, ...) __attribute__ ((__nothrow__ ));
# 463 "/usr/include/stdio.h" 3 4
extern int fscanf (FILE *__restrict __stream, const char *__restrict __format, ...) __asm__ ("" "__isoc99_fscanf") __attribute__ ((__nonnull__ (1)));


extern int scanf (const char *__restrict __format, ...) __asm__ ("" "__isoc99_scanf") ;

extern int sscanf (const char *__restrict __s, const char *__restrict __format, ...) __asm__ ("" "__isoc99_sscanf") __attribute__ ((__nothrow__ ));
# 490 "/usr/include/stdio.h" 3 4
extern int vfscanf (FILE *__restrict __s, const char *__restrict __format,
      __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 2, 0))) __attribute__ ((__nonnull__ (1)));





extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 1, 0))) ;


extern int vsscanf (const char *__restrict __s,
      const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__ )) __attribute__ ((__format__ (__scanf__, 2, 0)));
# 540 "/usr/include/stdio.h" 3 4
extern int vfscanf (FILE *__restrict __s, const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vfscanf")



     __attribute__ ((__format__ (__scanf__, 2, 0))) __attribute__ ((__nonnull__ (1)));
extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vscanf")

     __attribute__ ((__format__ (__scanf__, 1, 0))) ;
extern int vsscanf (const char *__restrict __s, const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vsscanf") __attribute__ ((__nothrow__ ))



     __attribute__ ((__format__ (__scanf__, 2, 0)));
# 575 "/usr/include/stdio.h" 3 4
extern int fgetc (FILE *__stream) __attribute__ ((__nonnull__ (1)));
extern int getc (FILE *__stream) __attribute__ ((__nonnull__ (1)));





extern int getchar (void);






extern int getc_unlocked (FILE *__stream) __attribute__ ((__nonnull__ (1)));
extern int getchar_unlocked (void);
# 600 "/usr/include/stdio.h" 3 4
extern int fgetc_unlocked (FILE *__stream) __attribute__ ((__nonnull__ (1)));
# 611 "/usr/include/stdio.h" 3 4
extern int fputc (int __c, FILE *__stream) __attribute__ ((__nonnull__ (2)));
extern int putc (int __c, FILE *__stream) __attribute__ ((__nonnull__ (2)));





extern int putchar (int __c);
# 627 "/usr/include/stdio.h" 3 4
extern int fputc_unlocked (int __c, FILE *__stream) __attribute__ ((__nonnull__ (2)));







extern int putc_unlocked (int __c, FILE *__stream) __attribute__ ((__nonnull__ (2)));
extern int putchar_unlocked (int __c);






extern int getw (FILE *__stream) __attribute__ ((__nonnull__ (1)));


extern int putw (int __w, FILE *__stream) __attribute__ ((__nonnull__ (2)));







extern char *fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
                                                          __attribute__ ((__nonnull__ (3)));
# 689 "/usr/include/stdio.h" 3 4
extern __ssize_t __getdelim (char **__restrict __lineptr,
                             size_t *__restrict __n, int __delimiter,
                             FILE *__restrict __stream) __attribute__ ((__nonnull__ (4)));
extern __ssize_t getdelim (char **__restrict __lineptr,
                           size_t *__restrict __n, int __delimiter,
                           FILE *__restrict __stream) __attribute__ ((__nonnull__ (4)));


extern __ssize_t getline (char **__restrict __lineptr,
                          size_t *__restrict __n,
                          FILE *__restrict __stream) __attribute__ ((__nonnull__ (3)));







extern int fputs (const char *__restrict __s, FILE *__restrict __stream)
  __attribute__ ((__nonnull__ (2)));





extern int puts (const char *__s);






extern int ungetc (int __c, FILE *__stream) __attribute__ ((__nonnull__ (2)));






extern size_t fread (void *__restrict __ptr, size_t __size,
       size_t __n, FILE *__restrict __stream)
  __attribute__ ((__nonnull__ (4)));




extern size_t fwrite (const void *__restrict __ptr, size_t __size,
        size_t __n, FILE *__restrict __s) __attribute__ ((__nonnull__ (4)));
# 756 "/usr/include/stdio.h" 3 4
extern size_t fread_unlocked (void *__restrict __ptr, size_t __size,
         size_t __n, FILE *__restrict __stream)
  __attribute__ ((__nonnull__ (4)));
extern size_t fwrite_unlocked (const void *__restrict __ptr, size_t __size,
          size_t __n, FILE *__restrict __stream)
  __attribute__ ((__nonnull__ (4)));







extern int fseek (FILE *__stream, long int __off, int __whence)
  __attribute__ ((__nonnull__ (1)));




extern long int ftell (FILE *__stream) __attribute__ ((__nonnull__ (1)));




extern void rewind (FILE *__stream) __attribute__ ((__nonnull__ (1)));
# 793 "/usr/include/stdio.h" 3 4
extern int fseeko (FILE *__stream, __off_t __off, int __whence)
  __attribute__ ((__nonnull__ (1)));




extern __off_t ftello (FILE *__stream) __attribute__ ((__nonnull__ (1)));
# 819 "/usr/include/stdio.h" 3 4
extern int fgetpos (FILE *__restrict __stream, fpos_t *__restrict __pos)
  __attribute__ ((__nonnull__ (1)));




extern int fsetpos (FILE *__stream, const fpos_t *__pos) __attribute__ ((__nonnull__ (1)));
# 850 "/usr/include/stdio.h" 3 4
extern void clearerr (FILE *__stream) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));

extern int feof (FILE *__stream) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));

extern int ferror (FILE *__stream) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));



extern void clearerr_unlocked (FILE *__stream) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));
extern int feof_unlocked (FILE *__stream) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));
extern int ferror_unlocked (FILE *__stream) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));







extern void perror (const char *__s) __attribute__ ((__cold__));




extern int fileno (FILE *__stream) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));




extern int fileno_unlocked (FILE *__stream) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));
# 887 "/usr/include/stdio.h" 3 4
extern int pclose (FILE *__stream) __attribute__ ((__nonnull__ (1)));





extern FILE *popen (const char *__command, const char *__modes)
  __attribute__ ((__malloc__)) ;






extern char *ctermid (char *__s) __attribute__ ((__nothrow__ ))
                                     ;
# 931 "/usr/include/stdio.h" 3 4
extern void flockfile (FILE *__stream) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));



extern int ftrylockfile (FILE *__stream) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern void funlockfile (FILE *__stream) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));
# 949 "/usr/include/stdio.h" 3 4
extern int __uflow (FILE *);
extern int __overflow (FILE *, int);
# 966 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/bits/stdio.h" 1 3 4
# 38 "/usr/include/bits/stdio.h" 3 4
extern __inline __attribute__ ((__gnu_inline__)) int
vprintf (const char *__restrict __fmt, __gnuc_va_list __arg)
{
  return vfprintf (stdout, __fmt, __arg);
}



extern __inline __attribute__ ((__gnu_inline__)) int
getchar (void)
{
  return getc (stdin);
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
  return putc (__c, stdout);
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
# 127 "/usr/include/bits/stdio.h" 3 4
extern __inline __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ )) feof_unlocked (FILE *__stream)
{
  return (((__stream)->_flags & 0x0010) != 0);
}


extern __inline __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ )) ferror_unlocked (FILE *__stream)
{
  return (((__stream)->_flags & 0x0020) != 0);
}
# 967 "/usr/include/stdio.h" 2 3 4
# 22 "./mdvi.h" 2

# 1 "/usr/include/math.h" 1 3 4
# 27 "/usr/include/math.h" 3 4
# 1 "/usr/include/bits/libc-header-start.h" 1 3 4
# 28 "/usr/include/math.h" 2 3 4
# 40 "/usr/include/math.h" 3 4
# 1 "/usr/include/bits/math-vector.h" 1 3 4
# 25 "/usr/include/bits/math-vector.h" 3 4
# 1 "/usr/include/bits/libm-simd-decl-stubs.h" 1 3 4
# 26 "/usr/include/bits/math-vector.h" 2 3 4
# 41 "/usr/include/math.h" 2 3 4
# 152 "/usr/include/math.h" 3 4
# 1 "/usr/include/bits/flt-eval-method.h" 1 3 4
# 153 "/usr/include/math.h" 2 3 4
# 163 "/usr/include/math.h" 3 4
typedef float float_t;
typedef double double_t;
# 204 "/usr/include/math.h" 3 4
# 1 "/usr/include/bits/fp-logb.h" 1 3 4
# 205 "/usr/include/math.h" 2 3 4
# 247 "/usr/include/math.h" 3 4
# 1 "/usr/include/bits/fp-fast.h" 1 3 4
# 248 "/usr/include/math.h" 2 3 4
# 312 "/usr/include/math.h" 3 4
# 1 "/usr/include/bits/mathcalls-helper-functions.h" 1 3 4
# 20 "/usr/include/bits/mathcalls-helper-functions.h" 3 4
extern int __fpclassify (double __value) __attribute__ ((__nothrow__ ))
     __attribute__ ((__const__));


extern int __signbit (double __value) __attribute__ ((__nothrow__ ))
     __attribute__ ((__const__));



extern int __isinf (double __value) __attribute__ ((__nothrow__ ))
  __attribute__ ((__const__));


extern int __finite (double __value) __attribute__ ((__nothrow__ ))
  __attribute__ ((__const__));


extern int __isnan (double __value) __attribute__ ((__nothrow__ ))
  __attribute__ ((__const__));


extern int __iseqsig (double __x, double __y) __attribute__ ((__nothrow__ ));


extern int __issignaling (double __value) __attribute__ ((__nothrow__ ))
     __attribute__ ((__const__));
# 313 "/usr/include/math.h" 2 3 4
# 1 "/usr/include/bits/mathcalls.h" 1 3 4
# 53 "/usr/include/bits/mathcalls.h" 3 4
 extern double acos (double __x) __attribute__ ((__nothrow__ )); extern double __acos (double __x) __attribute__ ((__nothrow__ ));

 extern double asin (double __x) __attribute__ ((__nothrow__ )); extern double __asin (double __x) __attribute__ ((__nothrow__ ));

 extern double atan (double __x) __attribute__ ((__nothrow__ )); extern double __atan (double __x) __attribute__ ((__nothrow__ ));

 extern double atan2 (double __y, double __x) __attribute__ ((__nothrow__ )); extern double __atan2 (double __y, double __x) __attribute__ ((__nothrow__ ));


 extern double cos (double __x) __attribute__ ((__nothrow__ )); extern double __cos (double __x) __attribute__ ((__nothrow__ ));

 extern double sin (double __x) __attribute__ ((__nothrow__ )); extern double __sin (double __x) __attribute__ ((__nothrow__ ));

 extern double tan (double __x) __attribute__ ((__nothrow__ )); extern double __tan (double __x) __attribute__ ((__nothrow__ ));




 extern double cosh (double __x) __attribute__ ((__nothrow__ )); extern double __cosh (double __x) __attribute__ ((__nothrow__ ));

 extern double sinh (double __x) __attribute__ ((__nothrow__ )); extern double __sinh (double __x) __attribute__ ((__nothrow__ ));

 extern double tanh (double __x) __attribute__ ((__nothrow__ )); extern double __tanh (double __x) __attribute__ ((__nothrow__ ));
# 85 "/usr/include/bits/mathcalls.h" 3 4
 extern double acosh (double __x) __attribute__ ((__nothrow__ )); extern double __acosh (double __x) __attribute__ ((__nothrow__ ));

 extern double asinh (double __x) __attribute__ ((__nothrow__ )); extern double __asinh (double __x) __attribute__ ((__nothrow__ ));

 extern double atanh (double __x) __attribute__ ((__nothrow__ )); extern double __atanh (double __x) __attribute__ ((__nothrow__ ));





 extern double exp (double __x) __attribute__ ((__nothrow__ )); extern double __exp (double __x) __attribute__ ((__nothrow__ ));


extern double frexp (double __x, int *__exponent) __attribute__ ((__nothrow__ )); extern double __frexp (double __x, int *__exponent) __attribute__ ((__nothrow__ ));


extern double ldexp (double __x, int __exponent) __attribute__ ((__nothrow__ )); extern double __ldexp (double __x, int __exponent) __attribute__ ((__nothrow__ ));


 extern double log (double __x) __attribute__ ((__nothrow__ )); extern double __log (double __x) __attribute__ ((__nothrow__ ));


 extern double log10 (double __x) __attribute__ ((__nothrow__ )); extern double __log10 (double __x) __attribute__ ((__nothrow__ ));


extern double modf (double __x, double *__iptr) __attribute__ ((__nothrow__ )); extern double __modf (double __x, double *__iptr) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2)));
# 134 "/usr/include/bits/mathcalls.h" 3 4
 extern double expm1 (double __x) __attribute__ ((__nothrow__ )); extern double __expm1 (double __x) __attribute__ ((__nothrow__ ));


 extern double log1p (double __x) __attribute__ ((__nothrow__ )); extern double __log1p (double __x) __attribute__ ((__nothrow__ ));


extern double logb (double __x) __attribute__ ((__nothrow__ )); extern double __logb (double __x) __attribute__ ((__nothrow__ ));




 extern double exp2 (double __x) __attribute__ ((__nothrow__ )); extern double __exp2 (double __x) __attribute__ ((__nothrow__ ));


 extern double log2 (double __x) __attribute__ ((__nothrow__ )); extern double __log2 (double __x) __attribute__ ((__nothrow__ ));






 extern double pow (double __x, double __y) __attribute__ ((__nothrow__ )); extern double __pow (double __x, double __y) __attribute__ ((__nothrow__ ));


extern double sqrt (double __x) __attribute__ ((__nothrow__ )); extern double __sqrt (double __x) __attribute__ ((__nothrow__ ));



 extern double hypot (double __x, double __y) __attribute__ ((__nothrow__ )); extern double __hypot (double __x, double __y) __attribute__ ((__nothrow__ ));




 extern double cbrt (double __x) __attribute__ ((__nothrow__ )); extern double __cbrt (double __x) __attribute__ ((__nothrow__ ));






extern double ceil (double __x) __attribute__ ((__nothrow__ )) __attribute__ ((__const__)); extern double __ceil (double __x) __attribute__ ((__nothrow__ )) __attribute__ ((__const__));


extern double fabs (double __x) __attribute__ ((__nothrow__ )) __attribute__ ((__const__)); extern double __fabs (double __x) __attribute__ ((__nothrow__ )) __attribute__ ((__const__));


extern double floor (double __x) __attribute__ ((__nothrow__ )) __attribute__ ((__const__)); extern double __floor (double __x) __attribute__ ((__nothrow__ )) __attribute__ ((__const__));


extern double fmod (double __x, double __y) __attribute__ ((__nothrow__ )); extern double __fmod (double __x, double __y) __attribute__ ((__nothrow__ ));
# 192 "/usr/include/bits/mathcalls.h" 3 4
extern int isinf (double __value) __attribute__ ((__nothrow__ ))
  __attribute__ ((__const__));




extern int finite (double __value) __attribute__ ((__nothrow__ ))
  __attribute__ ((__const__));


extern double drem (double __x, double __y) __attribute__ ((__nothrow__ )); extern double __drem (double __x, double __y) __attribute__ ((__nothrow__ ));



extern double significand (double __x) __attribute__ ((__nothrow__ )); extern double __significand (double __x) __attribute__ ((__nothrow__ ));






extern double copysign (double __x, double __y) __attribute__ ((__nothrow__ )) __attribute__ ((__const__)); extern double __copysign (double __x, double __y) __attribute__ ((__nothrow__ )) __attribute__ ((__const__));




extern double nan (const char *__tagb) __attribute__ ((__nothrow__ )); extern double __nan (const char *__tagb) __attribute__ ((__nothrow__ ));
# 228 "/usr/include/bits/mathcalls.h" 3 4
extern int isnan (double __value) __attribute__ ((__nothrow__ ))
  __attribute__ ((__const__));





extern double j0 (double) __attribute__ ((__nothrow__ )); extern double __j0 (double) __attribute__ ((__nothrow__ ));
extern double j1 (double) __attribute__ ((__nothrow__ )); extern double __j1 (double) __attribute__ ((__nothrow__ ));
extern double jn (int, double) __attribute__ ((__nothrow__ )); extern double __jn (int, double) __attribute__ ((__nothrow__ ));
extern double y0 (double) __attribute__ ((__nothrow__ )); extern double __y0 (double) __attribute__ ((__nothrow__ ));
extern double y1 (double) __attribute__ ((__nothrow__ )); extern double __y1 (double) __attribute__ ((__nothrow__ ));
extern double yn (int, double) __attribute__ ((__nothrow__ )); extern double __yn (int, double) __attribute__ ((__nothrow__ ));





 extern double erf (double) __attribute__ ((__nothrow__ )); extern double __erf (double) __attribute__ ((__nothrow__ ));
 extern double erfc (double) __attribute__ ((__nothrow__ )); extern double __erfc (double) __attribute__ ((__nothrow__ ));
extern double lgamma (double) __attribute__ ((__nothrow__ )); extern double __lgamma (double) __attribute__ ((__nothrow__ ));




extern double tgamma (double) __attribute__ ((__nothrow__ )); extern double __tgamma (double) __attribute__ ((__nothrow__ ));





extern double gamma (double) __attribute__ ((__nothrow__ )); extern double __gamma (double) __attribute__ ((__nothrow__ ));







extern double lgamma_r (double, int *__signgamp) __attribute__ ((__nothrow__ )); extern double __lgamma_r (double, int *__signgamp) __attribute__ ((__nothrow__ ));






extern double rint (double __x) __attribute__ ((__nothrow__ )); extern double __rint (double __x) __attribute__ ((__nothrow__ ));


extern double nextafter (double __x, double __y) __attribute__ ((__nothrow__ )); extern double __nextafter (double __x, double __y) __attribute__ ((__nothrow__ ));

extern double nexttoward (double __x, long double __y) __attribute__ ((__nothrow__ )); extern double __nexttoward (double __x, long double __y) __attribute__ ((__nothrow__ ));
# 290 "/usr/include/bits/mathcalls.h" 3 4
extern double remainder (double __x, double __y) __attribute__ ((__nothrow__ )); extern double __remainder (double __x, double __y) __attribute__ ((__nothrow__ ));



extern double scalbn (double __x, int __n) __attribute__ ((__nothrow__ )); extern double __scalbn (double __x, int __n) __attribute__ ((__nothrow__ ));



extern int ilogb (double __x) __attribute__ ((__nothrow__ )); extern int __ilogb (double __x) __attribute__ ((__nothrow__ ));
# 308 "/usr/include/bits/mathcalls.h" 3 4
extern double scalbln (double __x, long int __n) __attribute__ ((__nothrow__ )); extern double __scalbln (double __x, long int __n) __attribute__ ((__nothrow__ ));



extern double nearbyint (double __x) __attribute__ ((__nothrow__ )); extern double __nearbyint (double __x) __attribute__ ((__nothrow__ ));



extern double round (double __x) __attribute__ ((__nothrow__ )) __attribute__ ((__const__)); extern double __round (double __x) __attribute__ ((__nothrow__ )) __attribute__ ((__const__));



extern double trunc (double __x) __attribute__ ((__nothrow__ )) __attribute__ ((__const__)); extern double __trunc (double __x) __attribute__ ((__nothrow__ )) __attribute__ ((__const__));




extern double remquo (double __x, double __y, int *__quo) __attribute__ ((__nothrow__ )); extern double __remquo (double __x, double __y, int *__quo) __attribute__ ((__nothrow__ ));






extern long int lrint (double __x) __attribute__ ((__nothrow__ )); extern long int __lrint (double __x) __attribute__ ((__nothrow__ ));
__extension__
extern long long int llrint (double __x) __attribute__ ((__nothrow__ )); extern long long int __llrint (double __x) __attribute__ ((__nothrow__ ));



extern long int lround (double __x) __attribute__ ((__nothrow__ )); extern long int __lround (double __x) __attribute__ ((__nothrow__ ));
__extension__
extern long long int llround (double __x) __attribute__ ((__nothrow__ )); extern long long int __llround (double __x) __attribute__ ((__nothrow__ ));



extern double fdim (double __x, double __y) __attribute__ ((__nothrow__ )); extern double __fdim (double __x, double __y) __attribute__ ((__nothrow__ ));



extern double fmax (double __x, double __y) __attribute__ ((__nothrow__ )) __attribute__ ((__const__)); extern double __fmax (double __x, double __y) __attribute__ ((__nothrow__ )) __attribute__ ((__const__));


extern double fmin (double __x, double __y) __attribute__ ((__nothrow__ )) __attribute__ ((__const__)); extern double __fmin (double __x, double __y) __attribute__ ((__nothrow__ )) __attribute__ ((__const__));



extern double fma (double __x, double __y, double __z) __attribute__ ((__nothrow__ )); extern double __fma (double __x, double __y, double __z) __attribute__ ((__nothrow__ ));
# 450 "/usr/include/bits/mathcalls.h" 3 4
extern double scalb (double __x, double __n) __attribute__ ((__nothrow__ )); extern double __scalb (double __x, double __n) __attribute__ ((__nothrow__ ));
# 314 "/usr/include/math.h" 2 3 4
# 329 "/usr/include/math.h" 3 4
# 1 "/usr/include/bits/mathcalls-helper-functions.h" 1 3 4
# 20 "/usr/include/bits/mathcalls-helper-functions.h" 3 4
extern int __fpclassifyf (float __value) __attribute__ ((__nothrow__ ))
     __attribute__ ((__const__));


extern int __signbitf (float __value) __attribute__ ((__nothrow__ ))
     __attribute__ ((__const__));



extern int __isinff (float __value) __attribute__ ((__nothrow__ ))
  __attribute__ ((__const__));


extern int __finitef (float __value) __attribute__ ((__nothrow__ ))
  __attribute__ ((__const__));


extern int __isnanf (float __value) __attribute__ ((__nothrow__ ))
  __attribute__ ((__const__));


extern int __iseqsigf (float __x, float __y) __attribute__ ((__nothrow__ ));


extern int __issignalingf (float __value) __attribute__ ((__nothrow__ ))
     __attribute__ ((__const__));
# 330 "/usr/include/math.h" 2 3 4
# 1 "/usr/include/bits/mathcalls.h" 1 3 4
# 53 "/usr/include/bits/mathcalls.h" 3 4
 extern float acosf (float __x) __attribute__ ((__nothrow__ )); extern float __acosf (float __x) __attribute__ ((__nothrow__ ));

 extern float asinf (float __x) __attribute__ ((__nothrow__ )); extern float __asinf (float __x) __attribute__ ((__nothrow__ ));

 extern float atanf (float __x) __attribute__ ((__nothrow__ )); extern float __atanf (float __x) __attribute__ ((__nothrow__ ));

 extern float atan2f (float __y, float __x) __attribute__ ((__nothrow__ )); extern float __atan2f (float __y, float __x) __attribute__ ((__nothrow__ ));


 extern float cosf (float __x) __attribute__ ((__nothrow__ )); extern float __cosf (float __x) __attribute__ ((__nothrow__ ));

 extern float sinf (float __x) __attribute__ ((__nothrow__ )); extern float __sinf (float __x) __attribute__ ((__nothrow__ ));

 extern float tanf (float __x) __attribute__ ((__nothrow__ )); extern float __tanf (float __x) __attribute__ ((__nothrow__ ));




 extern float coshf (float __x) __attribute__ ((__nothrow__ )); extern float __coshf (float __x) __attribute__ ((__nothrow__ ));

 extern float sinhf (float __x) __attribute__ ((__nothrow__ )); extern float __sinhf (float __x) __attribute__ ((__nothrow__ ));

 extern float tanhf (float __x) __attribute__ ((__nothrow__ )); extern float __tanhf (float __x) __attribute__ ((__nothrow__ ));
# 85 "/usr/include/bits/mathcalls.h" 3 4
 extern float acoshf (float __x) __attribute__ ((__nothrow__ )); extern float __acoshf (float __x) __attribute__ ((__nothrow__ ));

 extern float asinhf (float __x) __attribute__ ((__nothrow__ )); extern float __asinhf (float __x) __attribute__ ((__nothrow__ ));

 extern float atanhf (float __x) __attribute__ ((__nothrow__ )); extern float __atanhf (float __x) __attribute__ ((__nothrow__ ));





 extern float expf (float __x) __attribute__ ((__nothrow__ )); extern float __expf (float __x) __attribute__ ((__nothrow__ ));


extern float frexpf (float __x, int *__exponent) __attribute__ ((__nothrow__ )); extern float __frexpf (float __x, int *__exponent) __attribute__ ((__nothrow__ ));


extern float ldexpf (float __x, int __exponent) __attribute__ ((__nothrow__ )); extern float __ldexpf (float __x, int __exponent) __attribute__ ((__nothrow__ ));


 extern float logf (float __x) __attribute__ ((__nothrow__ )); extern float __logf (float __x) __attribute__ ((__nothrow__ ));


 extern float log10f (float __x) __attribute__ ((__nothrow__ )); extern float __log10f (float __x) __attribute__ ((__nothrow__ ));


extern float modff (float __x, float *__iptr) __attribute__ ((__nothrow__ )); extern float __modff (float __x, float *__iptr) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2)));
# 134 "/usr/include/bits/mathcalls.h" 3 4
 extern float expm1f (float __x) __attribute__ ((__nothrow__ )); extern float __expm1f (float __x) __attribute__ ((__nothrow__ ));


 extern float log1pf (float __x) __attribute__ ((__nothrow__ )); extern float __log1pf (float __x) __attribute__ ((__nothrow__ ));


extern float logbf (float __x) __attribute__ ((__nothrow__ )); extern float __logbf (float __x) __attribute__ ((__nothrow__ ));




 extern float exp2f (float __x) __attribute__ ((__nothrow__ )); extern float __exp2f (float __x) __attribute__ ((__nothrow__ ));


 extern float log2f (float __x) __attribute__ ((__nothrow__ )); extern float __log2f (float __x) __attribute__ ((__nothrow__ ));






 extern float powf (float __x, float __y) __attribute__ ((__nothrow__ )); extern float __powf (float __x, float __y) __attribute__ ((__nothrow__ ));


extern float sqrtf (float __x) __attribute__ ((__nothrow__ )); extern float __sqrtf (float __x) __attribute__ ((__nothrow__ ));



 extern float hypotf (float __x, float __y) __attribute__ ((__nothrow__ )); extern float __hypotf (float __x, float __y) __attribute__ ((__nothrow__ ));




 extern float cbrtf (float __x) __attribute__ ((__nothrow__ )); extern float __cbrtf (float __x) __attribute__ ((__nothrow__ ));






extern float ceilf (float __x) __attribute__ ((__nothrow__ )) __attribute__ ((__const__)); extern float __ceilf (float __x) __attribute__ ((__nothrow__ )) __attribute__ ((__const__));


extern float fabsf (float __x) __attribute__ ((__nothrow__ )) __attribute__ ((__const__)); extern float __fabsf (float __x) __attribute__ ((__nothrow__ )) __attribute__ ((__const__));


extern float floorf (float __x) __attribute__ ((__nothrow__ )) __attribute__ ((__const__)); extern float __floorf (float __x) __attribute__ ((__nothrow__ )) __attribute__ ((__const__));


extern float fmodf (float __x, float __y) __attribute__ ((__nothrow__ )); extern float __fmodf (float __x, float __y) __attribute__ ((__nothrow__ ));
# 192 "/usr/include/bits/mathcalls.h" 3 4
extern int isinff (float __value) __attribute__ ((__nothrow__ ))
  __attribute__ ((__const__));




extern int finitef (float __value) __attribute__ ((__nothrow__ ))
  __attribute__ ((__const__));


extern float dremf (float __x, float __y) __attribute__ ((__nothrow__ )); extern float __dremf (float __x, float __y) __attribute__ ((__nothrow__ ));



extern float significandf (float __x) __attribute__ ((__nothrow__ )); extern float __significandf (float __x) __attribute__ ((__nothrow__ ));






extern float copysignf (float __x, float __y) __attribute__ ((__nothrow__ )) __attribute__ ((__const__)); extern float __copysignf (float __x, float __y) __attribute__ ((__nothrow__ )) __attribute__ ((__const__));




extern float nanf (const char *__tagb) __attribute__ ((__nothrow__ )); extern float __nanf (const char *__tagb) __attribute__ ((__nothrow__ ));
# 228 "/usr/include/bits/mathcalls.h" 3 4
extern int isnanf (float __value) __attribute__ ((__nothrow__ ))
  __attribute__ ((__const__));





extern float j0f (float) __attribute__ ((__nothrow__ )); extern float __j0f (float) __attribute__ ((__nothrow__ ));
extern float j1f (float) __attribute__ ((__nothrow__ )); extern float __j1f (float) __attribute__ ((__nothrow__ ));
extern float jnf (int, float) __attribute__ ((__nothrow__ )); extern float __jnf (int, float) __attribute__ ((__nothrow__ ));
extern float y0f (float) __attribute__ ((__nothrow__ )); extern float __y0f (float) __attribute__ ((__nothrow__ ));
extern float y1f (float) __attribute__ ((__nothrow__ )); extern float __y1f (float) __attribute__ ((__nothrow__ ));
extern float ynf (int, float) __attribute__ ((__nothrow__ )); extern float __ynf (int, float) __attribute__ ((__nothrow__ ));





 extern float erff (float) __attribute__ ((__nothrow__ )); extern float __erff (float) __attribute__ ((__nothrow__ ));
 extern float erfcf (float) __attribute__ ((__nothrow__ )); extern float __erfcf (float) __attribute__ ((__nothrow__ ));
extern float lgammaf (float) __attribute__ ((__nothrow__ )); extern float __lgammaf (float) __attribute__ ((__nothrow__ ));




extern float tgammaf (float) __attribute__ ((__nothrow__ )); extern float __tgammaf (float) __attribute__ ((__nothrow__ ));





extern float gammaf (float) __attribute__ ((__nothrow__ )); extern float __gammaf (float) __attribute__ ((__nothrow__ ));







extern float lgammaf_r (float, int *__signgamp) __attribute__ ((__nothrow__ )); extern float __lgammaf_r (float, int *__signgamp) __attribute__ ((__nothrow__ ));






extern float rintf (float __x) __attribute__ ((__nothrow__ )); extern float __rintf (float __x) __attribute__ ((__nothrow__ ));


extern float nextafterf (float __x, float __y) __attribute__ ((__nothrow__ )); extern float __nextafterf (float __x, float __y) __attribute__ ((__nothrow__ ));

extern float nexttowardf (float __x, long double __y) __attribute__ ((__nothrow__ )); extern float __nexttowardf (float __x, long double __y) __attribute__ ((__nothrow__ ));
# 290 "/usr/include/bits/mathcalls.h" 3 4
extern float remainderf (float __x, float __y) __attribute__ ((__nothrow__ )); extern float __remainderf (float __x, float __y) __attribute__ ((__nothrow__ ));



extern float scalbnf (float __x, int __n) __attribute__ ((__nothrow__ )); extern float __scalbnf (float __x, int __n) __attribute__ ((__nothrow__ ));



extern int ilogbf (float __x) __attribute__ ((__nothrow__ )); extern int __ilogbf (float __x) __attribute__ ((__nothrow__ ));
# 308 "/usr/include/bits/mathcalls.h" 3 4
extern float scalblnf (float __x, long int __n) __attribute__ ((__nothrow__ )); extern float __scalblnf (float __x, long int __n) __attribute__ ((__nothrow__ ));



extern float nearbyintf (float __x) __attribute__ ((__nothrow__ )); extern float __nearbyintf (float __x) __attribute__ ((__nothrow__ ));



extern float roundf (float __x) __attribute__ ((__nothrow__ )) __attribute__ ((__const__)); extern float __roundf (float __x) __attribute__ ((__nothrow__ )) __attribute__ ((__const__));



extern float truncf (float __x) __attribute__ ((__nothrow__ )) __attribute__ ((__const__)); extern float __truncf (float __x) __attribute__ ((__nothrow__ )) __attribute__ ((__const__));




extern float remquof (float __x, float __y, int *__quo) __attribute__ ((__nothrow__ )); extern float __remquof (float __x, float __y, int *__quo) __attribute__ ((__nothrow__ ));






extern long int lrintf (float __x) __attribute__ ((__nothrow__ )); extern long int __lrintf (float __x) __attribute__ ((__nothrow__ ));
__extension__
extern long long int llrintf (float __x) __attribute__ ((__nothrow__ )); extern long long int __llrintf (float __x) __attribute__ ((__nothrow__ ));



extern long int lroundf (float __x) __attribute__ ((__nothrow__ )); extern long int __lroundf (float __x) __attribute__ ((__nothrow__ ));
__extension__
extern long long int llroundf (float __x) __attribute__ ((__nothrow__ )); extern long long int __llroundf (float __x) __attribute__ ((__nothrow__ ));



extern float fdimf (float __x, float __y) __attribute__ ((__nothrow__ )); extern float __fdimf (float __x, float __y) __attribute__ ((__nothrow__ ));



extern float fmaxf (float __x, float __y) __attribute__ ((__nothrow__ )) __attribute__ ((__const__)); extern float __fmaxf (float __x, float __y) __attribute__ ((__nothrow__ )) __attribute__ ((__const__));


extern float fminf (float __x, float __y) __attribute__ ((__nothrow__ )) __attribute__ ((__const__)); extern float __fminf (float __x, float __y) __attribute__ ((__nothrow__ )) __attribute__ ((__const__));



extern float fmaf (float __x, float __y, float __z) __attribute__ ((__nothrow__ )); extern float __fmaf (float __x, float __y, float __z) __attribute__ ((__nothrow__ ));
# 450 "/usr/include/bits/mathcalls.h" 3 4
extern float scalbf (float __x, float __n) __attribute__ ((__nothrow__ )); extern float __scalbf (float __x, float __n) __attribute__ ((__nothrow__ ));
# 331 "/usr/include/math.h" 2 3 4
# 398 "/usr/include/math.h" 3 4
# 1 "/usr/include/bits/mathcalls-helper-functions.h" 1 3 4
# 20 "/usr/include/bits/mathcalls-helper-functions.h" 3 4
extern int __fpclassifyl (long double __value) __attribute__ ((__nothrow__ ))
     __attribute__ ((__const__));


extern int __signbitl (long double __value) __attribute__ ((__nothrow__ ))
     __attribute__ ((__const__));



extern int __isinfl (long double __value) __attribute__ ((__nothrow__ ))
  __attribute__ ((__const__));


extern int __finitel (long double __value) __attribute__ ((__nothrow__ ))
  __attribute__ ((__const__));


extern int __isnanl (long double __value) __attribute__ ((__nothrow__ ))
  __attribute__ ((__const__));


extern int __iseqsigl (long double __x, long double __y) __attribute__ ((__nothrow__ ));


extern int __issignalingl (long double __value) __attribute__ ((__nothrow__ ))
     __attribute__ ((__const__));
# 399 "/usr/include/math.h" 2 3 4
# 1 "/usr/include/bits/mathcalls.h" 1 3 4
# 53 "/usr/include/bits/mathcalls.h" 3 4
 extern long double acosl (long double __x) __attribute__ ((__nothrow__ )); extern long double __acosl (long double __x) __attribute__ ((__nothrow__ ));

 extern long double asinl (long double __x) __attribute__ ((__nothrow__ )); extern long double __asinl (long double __x) __attribute__ ((__nothrow__ ));

 extern long double atanl (long double __x) __attribute__ ((__nothrow__ )); extern long double __atanl (long double __x) __attribute__ ((__nothrow__ ));

 extern long double atan2l (long double __y, long double __x) __attribute__ ((__nothrow__ )); extern long double __atan2l (long double __y, long double __x) __attribute__ ((__nothrow__ ));


 extern long double cosl (long double __x) __attribute__ ((__nothrow__ )); extern long double __cosl (long double __x) __attribute__ ((__nothrow__ ));

 extern long double sinl (long double __x) __attribute__ ((__nothrow__ )); extern long double __sinl (long double __x) __attribute__ ((__nothrow__ ));

 extern long double tanl (long double __x) __attribute__ ((__nothrow__ )); extern long double __tanl (long double __x) __attribute__ ((__nothrow__ ));




 extern long double coshl (long double __x) __attribute__ ((__nothrow__ )); extern long double __coshl (long double __x) __attribute__ ((__nothrow__ ));

 extern long double sinhl (long double __x) __attribute__ ((__nothrow__ )); extern long double __sinhl (long double __x) __attribute__ ((__nothrow__ ));

 extern long double tanhl (long double __x) __attribute__ ((__nothrow__ )); extern long double __tanhl (long double __x) __attribute__ ((__nothrow__ ));
# 85 "/usr/include/bits/mathcalls.h" 3 4
 extern long double acoshl (long double __x) __attribute__ ((__nothrow__ )); extern long double __acoshl (long double __x) __attribute__ ((__nothrow__ ));

 extern long double asinhl (long double __x) __attribute__ ((__nothrow__ )); extern long double __asinhl (long double __x) __attribute__ ((__nothrow__ ));

 extern long double atanhl (long double __x) __attribute__ ((__nothrow__ )); extern long double __atanhl (long double __x) __attribute__ ((__nothrow__ ));





 extern long double expl (long double __x) __attribute__ ((__nothrow__ )); extern long double __expl (long double __x) __attribute__ ((__nothrow__ ));


extern long double frexpl (long double __x, int *__exponent) __attribute__ ((__nothrow__ )); extern long double __frexpl (long double __x, int *__exponent) __attribute__ ((__nothrow__ ));


extern long double ldexpl (long double __x, int __exponent) __attribute__ ((__nothrow__ )); extern long double __ldexpl (long double __x, int __exponent) __attribute__ ((__nothrow__ ));


 extern long double logl (long double __x) __attribute__ ((__nothrow__ )); extern long double __logl (long double __x) __attribute__ ((__nothrow__ ));


 extern long double log10l (long double __x) __attribute__ ((__nothrow__ )); extern long double __log10l (long double __x) __attribute__ ((__nothrow__ ));


extern long double modfl (long double __x, long double *__iptr) __attribute__ ((__nothrow__ )); extern long double __modfl (long double __x, long double *__iptr) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2)));
# 134 "/usr/include/bits/mathcalls.h" 3 4
 extern long double expm1l (long double __x) __attribute__ ((__nothrow__ )); extern long double __expm1l (long double __x) __attribute__ ((__nothrow__ ));


 extern long double log1pl (long double __x) __attribute__ ((__nothrow__ )); extern long double __log1pl (long double __x) __attribute__ ((__nothrow__ ));


extern long double logbl (long double __x) __attribute__ ((__nothrow__ )); extern long double __logbl (long double __x) __attribute__ ((__nothrow__ ));




 extern long double exp2l (long double __x) __attribute__ ((__nothrow__ )); extern long double __exp2l (long double __x) __attribute__ ((__nothrow__ ));


 extern long double log2l (long double __x) __attribute__ ((__nothrow__ )); extern long double __log2l (long double __x) __attribute__ ((__nothrow__ ));






 extern long double powl (long double __x, long double __y) __attribute__ ((__nothrow__ )); extern long double __powl (long double __x, long double __y) __attribute__ ((__nothrow__ ));


extern long double sqrtl (long double __x) __attribute__ ((__nothrow__ )); extern long double __sqrtl (long double __x) __attribute__ ((__nothrow__ ));



 extern long double hypotl (long double __x, long double __y) __attribute__ ((__nothrow__ )); extern long double __hypotl (long double __x, long double __y) __attribute__ ((__nothrow__ ));




 extern long double cbrtl (long double __x) __attribute__ ((__nothrow__ )); extern long double __cbrtl (long double __x) __attribute__ ((__nothrow__ ));






extern long double ceill (long double __x) __attribute__ ((__nothrow__ )) __attribute__ ((__const__)); extern long double __ceill (long double __x) __attribute__ ((__nothrow__ )) __attribute__ ((__const__));


extern long double fabsl (long double __x) __attribute__ ((__nothrow__ )) __attribute__ ((__const__)); extern long double __fabsl (long double __x) __attribute__ ((__nothrow__ )) __attribute__ ((__const__));


extern long double floorl (long double __x) __attribute__ ((__nothrow__ )) __attribute__ ((__const__)); extern long double __floorl (long double __x) __attribute__ ((__nothrow__ )) __attribute__ ((__const__));


extern long double fmodl (long double __x, long double __y) __attribute__ ((__nothrow__ )); extern long double __fmodl (long double __x, long double __y) __attribute__ ((__nothrow__ ));
# 192 "/usr/include/bits/mathcalls.h" 3 4
extern int isinfl (long double __value) __attribute__ ((__nothrow__ ))
  __attribute__ ((__const__));




extern int finitel (long double __value) __attribute__ ((__nothrow__ ))
  __attribute__ ((__const__));


extern long double dreml (long double __x, long double __y) __attribute__ ((__nothrow__ )); extern long double __dreml (long double __x, long double __y) __attribute__ ((__nothrow__ ));



extern long double significandl (long double __x) __attribute__ ((__nothrow__ )); extern long double __significandl (long double __x) __attribute__ ((__nothrow__ ));






extern long double copysignl (long double __x, long double __y) __attribute__ ((__nothrow__ )) __attribute__ ((__const__)); extern long double __copysignl (long double __x, long double __y) __attribute__ ((__nothrow__ )) __attribute__ ((__const__));




extern long double nanl (const char *__tagb) __attribute__ ((__nothrow__ )); extern long double __nanl (const char *__tagb) __attribute__ ((__nothrow__ ));
# 228 "/usr/include/bits/mathcalls.h" 3 4
extern int isnanl (long double __value) __attribute__ ((__nothrow__ ))
  __attribute__ ((__const__));





extern long double j0l (long double) __attribute__ ((__nothrow__ )); extern long double __j0l (long double) __attribute__ ((__nothrow__ ));
extern long double j1l (long double) __attribute__ ((__nothrow__ )); extern long double __j1l (long double) __attribute__ ((__nothrow__ ));
extern long double jnl (int, long double) __attribute__ ((__nothrow__ )); extern long double __jnl (int, long double) __attribute__ ((__nothrow__ ));
extern long double y0l (long double) __attribute__ ((__nothrow__ )); extern long double __y0l (long double) __attribute__ ((__nothrow__ ));
extern long double y1l (long double) __attribute__ ((__nothrow__ )); extern long double __y1l (long double) __attribute__ ((__nothrow__ ));
extern long double ynl (int, long double) __attribute__ ((__nothrow__ )); extern long double __ynl (int, long double) __attribute__ ((__nothrow__ ));





 extern long double erfl (long double) __attribute__ ((__nothrow__ )); extern long double __erfl (long double) __attribute__ ((__nothrow__ ));
 extern long double erfcl (long double) __attribute__ ((__nothrow__ )); extern long double __erfcl (long double) __attribute__ ((__nothrow__ ));
extern long double lgammal (long double) __attribute__ ((__nothrow__ )); extern long double __lgammal (long double) __attribute__ ((__nothrow__ ));




extern long double tgammal (long double) __attribute__ ((__nothrow__ )); extern long double __tgammal (long double) __attribute__ ((__nothrow__ ));





extern long double gammal (long double) __attribute__ ((__nothrow__ )); extern long double __gammal (long double) __attribute__ ((__nothrow__ ));







extern long double lgammal_r (long double, int *__signgamp) __attribute__ ((__nothrow__ )); extern long double __lgammal_r (long double, int *__signgamp) __attribute__ ((__nothrow__ ));






extern long double rintl (long double __x) __attribute__ ((__nothrow__ )); extern long double __rintl (long double __x) __attribute__ ((__nothrow__ ));


extern long double nextafterl (long double __x, long double __y) __attribute__ ((__nothrow__ )); extern long double __nextafterl (long double __x, long double __y) __attribute__ ((__nothrow__ ));

extern long double nexttowardl (long double __x, long double __y) __attribute__ ((__nothrow__ )); extern long double __nexttowardl (long double __x, long double __y) __attribute__ ((__nothrow__ ));
# 290 "/usr/include/bits/mathcalls.h" 3 4
extern long double remainderl (long double __x, long double __y) __attribute__ ((__nothrow__ )); extern long double __remainderl (long double __x, long double __y) __attribute__ ((__nothrow__ ));



extern long double scalbnl (long double __x, int __n) __attribute__ ((__nothrow__ )); extern long double __scalbnl (long double __x, int __n) __attribute__ ((__nothrow__ ));



extern int ilogbl (long double __x) __attribute__ ((__nothrow__ )); extern int __ilogbl (long double __x) __attribute__ ((__nothrow__ ));
# 308 "/usr/include/bits/mathcalls.h" 3 4
extern long double scalblnl (long double __x, long int __n) __attribute__ ((__nothrow__ )); extern long double __scalblnl (long double __x, long int __n) __attribute__ ((__nothrow__ ));



extern long double nearbyintl (long double __x) __attribute__ ((__nothrow__ )); extern long double __nearbyintl (long double __x) __attribute__ ((__nothrow__ ));



extern long double roundl (long double __x) __attribute__ ((__nothrow__ )) __attribute__ ((__const__)); extern long double __roundl (long double __x) __attribute__ ((__nothrow__ )) __attribute__ ((__const__));



extern long double truncl (long double __x) __attribute__ ((__nothrow__ )) __attribute__ ((__const__)); extern long double __truncl (long double __x) __attribute__ ((__nothrow__ )) __attribute__ ((__const__));




extern long double remquol (long double __x, long double __y, int *__quo) __attribute__ ((__nothrow__ )); extern long double __remquol (long double __x, long double __y, int *__quo) __attribute__ ((__nothrow__ ));






extern long int lrintl (long double __x) __attribute__ ((__nothrow__ )); extern long int __lrintl (long double __x) __attribute__ ((__nothrow__ ));
__extension__
extern long long int llrintl (long double __x) __attribute__ ((__nothrow__ )); extern long long int __llrintl (long double __x) __attribute__ ((__nothrow__ ));



extern long int lroundl (long double __x) __attribute__ ((__nothrow__ )); extern long int __lroundl (long double __x) __attribute__ ((__nothrow__ ));
__extension__
extern long long int llroundl (long double __x) __attribute__ ((__nothrow__ )); extern long long int __llroundl (long double __x) __attribute__ ((__nothrow__ ));



extern long double fdiml (long double __x, long double __y) __attribute__ ((__nothrow__ )); extern long double __fdiml (long double __x, long double __y) __attribute__ ((__nothrow__ ));



extern long double fmaxl (long double __x, long double __y) __attribute__ ((__nothrow__ )) __attribute__ ((__const__)); extern long double __fmaxl (long double __x, long double __y) __attribute__ ((__nothrow__ )) __attribute__ ((__const__));


extern long double fminl (long double __x, long double __y) __attribute__ ((__nothrow__ )) __attribute__ ((__const__)); extern long double __fminl (long double __x, long double __y) __attribute__ ((__nothrow__ )) __attribute__ ((__const__));



extern long double fmal (long double __x, long double __y, long double __z) __attribute__ ((__nothrow__ )); extern long double __fmal (long double __x, long double __y, long double __z) __attribute__ ((__nothrow__ ));
# 450 "/usr/include/bits/mathcalls.h" 3 4
extern long double scalbl (long double __x, long double __n) __attribute__ ((__nothrow__ )); extern long double __scalbl (long double __x, long double __n) __attribute__ ((__nothrow__ ));
# 400 "/usr/include/math.h" 2 3 4
# 854 "/usr/include/math.h" 3 4
extern int signgam;
# 934 "/usr/include/math.h" 3 4
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
# 24 "./mdvi.h" 2

# 1 "./sysdeps.h" 1
# 27 "./sysdeps.h"
# 1 "../../../config.h" 1
# 28 "./sysdeps.h" 2







typedef unsigned long Ulong;
typedef unsigned int Uint;
typedef unsigned short Ushort;
typedef unsigned char Uchar;


typedef unsigned char Uint8;
typedef char Int8;







typedef unsigned int Uint32;
typedef int Int32;
# 63 "./sysdeps.h"
typedef unsigned short Uint16;
typedef short Int16;
# 83 "./sysdeps.h"
typedef unsigned long UINT;
typedef long INT;
# 104 "./sysdeps.h"
typedef void *Pointer;
# 26 "./mdvi.h" 2
# 1 "./bitmap.h" 1
# 26 "./bitmap.h"
typedef Uint32 BmUnit;







typedef struct {
 int width;
 int height;
 int stride;
 BmUnit *data;
} BITMAP;
# 115 "./bitmap.h"
extern BITMAP *bitmap_alloc (int, int);
extern BITMAP *bitmap_alloc_raw (int, int);
extern void bitmap_destroy (BITMAP *);







extern void bitmap_set_col (BITMAP *, int, int, int, int);
extern void bitmap_set_row (BITMAP *, int, int, int, int);

extern void bitmap_paint_bits (BmUnit *, int, int);
extern void bitmap_clear_bits (BmUnit *, int, int);

extern BITMAP *bitmap_copy (BITMAP *);
extern void bitmap_flip_horizontally (BITMAP *);
extern void bitmap_flip_vertically (BITMAP *);
extern void bitmap_flip_diagonally (BITMAP *);
extern void bitmap_rotate_clockwise (BITMAP *);
extern void bitmap_rotate_counter_clockwise (BITMAP *);
extern void bitmap_flip_rotate_clockwise (BITMAP *);
extern void bitmap_flip_rotate_counter_clockwise (BITMAP *);
extern BITMAP *bitmap_convert_lsb8 (Uchar *, int, int, int);
extern BITMAP *bitmap_convert_msb8 (Uchar *, int, int, int);


extern void bitmap_print (FILE *, BITMAP *);
# 27 "./mdvi.h" 2
# 1 "./common.h" 1
# 28 "./common.h"
# 1 "/usr/include/string.h" 1 3 4
# 26 "/usr/include/string.h" 3 4
# 1 "/usr/include/bits/libc-header-start.h" 1 3 4
# 27 "/usr/include/string.h" 2 3 4






# 1 "/usr/bin/../lib/clang/19/include/stddef.h" 1 3 4
# 93 "/usr/bin/../lib/clang/19/include/stddef.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/__stddef_size_t.h" 1 3 4
# 94 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3 4
# 108 "/usr/bin/../lib/clang/19/include/stddef.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/__stddef_null.h" 1 3 4
# 109 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3 4
# 34 "/usr/include/string.h" 2 3 4
# 43 "/usr/include/string.h" 3 4
extern void *memcpy (void *__restrict __dest, const void *__restrict __src,
       size_t __n) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));


extern void *memmove (void *__dest, const void *__src, size_t __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));





extern void *memccpy (void *__restrict __dest, const void *__restrict __src,
        int __c, size_t __n)
    __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2))) ;




extern void *memset (void *__s, int __c, size_t __n) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern int memcmp (const void *__s1, const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 80 "/usr/include/string.h" 3 4
extern int __memcmpeq (const void *__s1, const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 107 "/usr/include/string.h" 3 4
extern void *memchr (const void *__s, int __c, size_t __n)
      __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 141 "/usr/include/string.h" 3 4
extern char *strcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));

extern char *strncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));


extern char *strcat (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));

extern char *strncat (char *__restrict __dest, const char *__restrict __src,
        size_t __n) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));


extern int strcmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern int strncmp (const char *__s1, const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strcoll (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern size_t strxfrm (char *__restrict __dest,
         const char *__restrict __src, size_t __n)
    __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2))) ;



# 1 "/usr/include/bits/types/locale_t.h" 1 3 4
# 22 "/usr/include/bits/types/locale_t.h" 3 4
# 1 "/usr/include/bits/types/__locale_t.h" 1 3 4
# 27 "/usr/include/bits/types/__locale_t.h" 3 4
struct __locale_struct
{

  struct __locale_data *__locales[13];


  const unsigned short int *__ctype_b;
  const int *__ctype_tolower;
  const int *__ctype_toupper;


  const char *__names[13];
};

typedef struct __locale_struct *__locale_t;
# 23 "/usr/include/bits/types/locale_t.h" 2 3 4

typedef __locale_t locale_t;
# 173 "/usr/include/string.h" 2 3 4


extern int strcoll_l (const char *__s1, const char *__s2, locale_t __l)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));


extern size_t strxfrm_l (char *__dest, const char *__src, size_t __n,
    locale_t __l) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2, 4)))
                                           ;





extern char *strdup (const char *__s)
     __attribute__ ((__nothrow__ )) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));






extern char *strndup (const char *__string, size_t __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));
# 246 "/usr/include/string.h" 3 4
extern char *strchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 273 "/usr/include/string.h" 3 4
extern char *strrchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 286 "/usr/include/string.h" 3 4
extern char *strchrnul (const char *__s, int __c)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));





extern size_t strcspn (const char *__s, const char *__reject)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern size_t strspn (const char *__s, const char *__accept)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 323 "/usr/include/string.h" 3 4
extern char *strpbrk (const char *__s, const char *__accept)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 350 "/usr/include/string.h" 3 4
extern char *strstr (const char *__haystack, const char *__needle)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));




extern char *strtok (char *__restrict __s, const char *__restrict __delim)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2)));



extern char *__strtok_r (char *__restrict __s,
    const char *__restrict __delim,
    char **__restrict __save_ptr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2, 3)));

extern char *strtok_r (char *__restrict __s, const char *__restrict __delim,
         char **__restrict __save_ptr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2, 3)));
# 380 "/usr/include/string.h" 3 4
extern char *strcasestr (const char *__haystack, const char *__needle)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));







extern void *memmem (const void *__haystack, size_t __haystacklen,
       const void *__needle, size_t __needlelen)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 3)))

                                         ;



extern void *__mempcpy (void *__restrict __dest,
   const void *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));
extern void *mempcpy (void *__restrict __dest,
        const void *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));




extern size_t strlen (const char *__s)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));




extern size_t strnlen (const char *__string, size_t __maxlen)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));




extern char *strerror (int __errnum) __attribute__ ((__nothrow__ ));
# 432 "/usr/include/string.h" 3 4
extern int strerror_r (int __errnum, char *__buf, size_t __buflen) __asm__ ("" "__xpg_strerror_r") __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2)))


                                          ;
# 458 "/usr/include/string.h" 3 4
extern char *strerror_l (int __errnum, locale_t __l) __attribute__ ((__nothrow__ ));



# 1 "/usr/include/strings.h" 1 3 4
# 23 "/usr/include/strings.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/stddef.h" 1 3 4
# 93 "/usr/bin/../lib/clang/19/include/stddef.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/__stddef_size_t.h" 1 3 4
# 94 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3 4
# 24 "/usr/include/strings.h" 2 3 4
# 34 "/usr/include/strings.h" 3 4
extern int bcmp (const void *__s1, const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern void bcopy (const void *__src, void *__dest, size_t __n)
  __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));


extern void bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));
# 68 "/usr/include/strings.h" 3 4
extern char *index (const char *__s, int __c)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 96 "/usr/include/strings.h" 3 4
extern char *rindex (const char *__s, int __c)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));






extern int ffs (int __i) __attribute__ ((__nothrow__ )) __attribute__ ((__const__));





extern int ffsl (long int __l) __attribute__ ((__nothrow__ )) __attribute__ ((__const__));
__extension__ extern int ffsll (long long int __ll)
     __attribute__ ((__nothrow__ )) __attribute__ ((__const__));



extern int strcasecmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strncasecmp (const char *__s1, const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));






extern int strcasecmp_l (const char *__s1, const char *__s2, locale_t __loc)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));



extern int strncasecmp_l (const char *__s1, const char *__s2,
     size_t __n, locale_t __loc)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 4)));
# 463 "/usr/include/string.h" 2 3 4



extern void explicit_bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)))
                                                  ;



extern char *strsep (char **__restrict __stringp,
       const char *__restrict __delim)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));




extern char *strsignal (int __sig) __attribute__ ((__nothrow__ ));
# 489 "/usr/include/string.h" 3 4
extern char *__stpcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));



extern char *__stpncpy (char *__restrict __dest,
   const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));




extern size_t strlcpy (char *__restrict __dest,
         const char *__restrict __src, size_t __n)
  __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2))) ;



extern size_t strlcat (char *__restrict __dest,
         const char *__restrict __src, size_t __n)
  __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2))) ;
# 29 "./common.h" 2
# 48 "./common.h"
typedef struct _List {
 struct _List *next;
 struct _List *prev;
} List;


typedef struct {
 char *data;
 size_t size;
 size_t length;
} Buffer;

typedef struct {
 List *head;
 List *tail;
 int count;
} ListHead;


typedef struct {
 char *data;
 size_t size;
 size_t length;
} Dstring;





extern char *program_name;

extern Ulong fugetn (FILE *, size_t);
extern long fsgetn (FILE *, size_t);
extern Ulong mugetn (const Uchar *, size_t);
extern long msgetn (const Uchar *, size_t);
# 133 "./common.h"
extern char *read_string (FILE *, int, char *, size_t);
extern size_t read_bcpl (FILE *, char *, size_t, size_t);
extern char *read_alloc_bcpl (FILE *, size_t, size_t *);



extern void mdvi_message (const char *, ...);
extern void mdvi_crash (const char *, ...);
extern void mdvi_fatal (const char *, ...);
extern void mdvi_error (const char *, ...);
extern void mdvi_warning (const char *, ...);
extern int unit2pix (int, const char *);
extern double unit2pix_factor (const char *);
# 181 "./common.h"
extern Uint32 _mdvi_debug_mask;
extern void __debug (int, const char *, ...);
# 205 "./common.h"
extern void mdvi_free (void *);
extern void *mdvi_malloc (size_t);
extern void *mdvi_realloc (void *, size_t);
extern void *mdvi_calloc (size_t, size_t);
extern char *mdvi_strncpy (char *, const char *, size_t);
extern char *mdvi_strdup (const char *);
extern char *mdvi_strndup (const char *, size_t);
extern void *mdvi_memdup (const void *, size_t);
extern char *mdvi_build_path_from_cwd (const char *);
extern char *mdvi_strrstr (const char *, const char *);






extern char *xstradd (char *, size_t *, size_t, const char *, size_t);

extern Ulong get_mtime (int);


extern void listh_init (ListHead *);
extern void listh_prepend (ListHead *, List *);
extern void listh_append (ListHead *, List *);
extern void listh_add_before (ListHead *, List *, List *);
extern void listh_add_after (ListHead *, List *, List *);
extern void listh_remove (ListHead *, List *);
extern void listh_concat (ListHead *, ListHead *);
extern void listh_catcon (ListHead *, ListHead *);

extern void buff_init (Buffer *);
extern size_t buff_add (Buffer *, const char *, size_t);
extern char *buff_gets (Buffer *, size_t *);
extern void buff_free (Buffer *);

extern char *getword (char *, const char *, char **);
extern char *getstring (char *, const char *, char **);

extern void dstring_init (Dstring *);
extern int dstring_new (Dstring *, const char *, int);
extern int dstring_append (Dstring *, const char *, int);
extern int dstring_copy (Dstring *, int, const char *, int);
extern int dstring_insert (Dstring *, int, const char *, int);
extern void dstring_reset (Dstring *);




extern char *dgets (Dstring *, FILE *);
extern int file_readable (const char *);
extern int file_exists (const char *);
extern const char *file_basename (const char *);
extern const char *file_extension (const char *);
# 28 "./mdvi.h" 2
# 1 "./defaults.h" 1
# 29 "./mdvi.h" 2
# 1 "./dviopcodes.h" 1
# 30 "./mdvi.h" 2

typedef struct _DviGlyph DviGlyph;
typedef struct _DviDevice DviDevice;
typedef struct _DviFontChar DviFontChar;
typedef struct _DviFontRef DviFontRef;
typedef struct _DviFontInfo DviFontInfo;
typedef struct _DviFont DviFont;
typedef struct _DviState DviState;
typedef struct _DviPageSpec *DviPageSpec;
typedef struct _DviParams DviParams;
typedef struct _DviBuffer DviBuffer;
typedef struct _DviContext DviContext;
typedef struct _DviRange DviRange;
typedef struct _DviColorPair DviColorPair;
typedef struct _DviSection DviSection;
typedef struct _TFMChar TFMChar;
typedef struct _TFMInfo TFMInfo;
typedef struct _DviFontSearch DviFontSearch;

typedef struct _DviFontClass DviFontClass;

typedef void (*DviFreeFunc) (void *);
typedef void (*DviFree2Func) (void *, void *);

typedef Ulong DviColor;
# 63 "./mdvi.h"
typedef enum {
 FALSE = 0,
 TRUE = 1
} DviBool;

# 1 "./hash.h" 1





typedef struct _DviHashBucket DviHashBucket;
typedef struct _DviHashTable DviHashTable;





typedef Uchar *DviHashKey;


typedef Ulong (*DviHashFunc) (DviHashKey key);
typedef int (*DviHashComp) (DviHashKey key1, DviHashKey key2);
typedef void (*DviHashFree) (DviHashKey key, void *data);

struct _DviHashTable {
 DviHashBucket **buckets;
 int nbucks;
 int nkeys;
 DviHashFunc hash_func;
 DviHashComp hash_comp;
 DviHashFree hash_free;
};






extern void mdvi_hash_init (DviHashTable *);
extern void mdvi_hash_create (DviHashTable *, int);
extern int mdvi_hash_add (DviHashTable *, DviHashKey, void *, int);
extern int mdvi_hash_destroy_key (DviHashTable *, DviHashKey);
extern void mdvi_hash_reset (DviHashTable *, int);
extern void *mdvi_hash_lookup (DviHashTable *, DviHashKey);
extern void *mdvi_hash_remove (DviHashTable *, DviHashKey);
extern void *mdvi_hash_remove_ptr (DviHashTable *, DviHashKey);
# 69 "./mdvi.h" 2
# 1 "./paper.h" 1



typedef struct _DviPaper DviPaper;
typedef struct _DviPaperSpec DviPaperSpec;

typedef enum {
 MDVI_PAPER_CLASS_ISO,
 MDVI_PAPER_CLASS_US,
 MDVI_PAPER_CLASS_ANY,
 MDVI_PAPER_CLASS_CUSTOM
} DviPaperClass;

struct _DviPaper {
 DviPaperClass pclass;
 const char *name;
 double inches_wide;
 double inches_tall;
};

struct _DviPaperSpec {
 const char *name;
 const char *width;
 const char *height;
};

extern int mdvi_get_paper_size (const char *, DviPaper *);
extern DviPaperSpec* mdvi_get_paper_specs (DviPaperClass);
extern void mdvi_free_paper_specs (DviPaperSpec *);
# 70 "./mdvi.h" 2






typedef long PageNum[11];




typedef void (*DviGlyphDraw) (DviContext *context, DviFontChar *glyph, int x, int y);



typedef void (*DviRuleDraw) (DviContext *context, int x, int y, Uint width, Uint height, int fill);



typedef int (*DviColorScale) (void *device_data, Ulong *pixels, int npixels, Ulong foreground, Ulong background, double gamma, int density);






typedef void *(*DviCreateImage) (void *device_data, Uint width, Uint height, Uint bpp);



typedef void (*DviFreeImage) (void *image);
typedef void (*DviPutPixel) (void *image, int x, int y, Ulong color);
typedef void (*DviImageDone) (void *image);
typedef void (*DviDevDestroy) (void *data);
typedef void (*DviRefresh) (DviContext *dvi, void *device_data);
typedef void (*DviSetColor) (void *device_data, Ulong, Ulong);
typedef void (*DviPSDraw) (DviContext *context, const char *filename, int x, int y, Uint width, Uint height);




struct _DviDevice {
 DviGlyphDraw draw_glyph;
 DviRuleDraw draw_rule;
 DviColorScale alloc_colors;
 DviCreateImage create_image;
 DviFreeImage free_image;
 DviPutPixel put_pixel;
        DviImageDone image_done;
 DviDevDestroy dev_destroy;
 DviRefresh refresh;
 DviSetColor set_color;
 DviPSDraw draw_ps;
 void * device_data;
};





# 1 "./fontmap.h" 1
# 21 "./fontmap.h"
typedef struct _DviFontMapEnt DviFontMapEnt;
typedef struct _DviEncoding DviEncoding;

typedef struct {
 const char *psname;
 const char *encoding;
 const char *fontfile;
 const char *fullfile;
 const char *fmfile;
 int fmtype;
 long extend;
 long slant;
} DviFontMapInfo;

struct _DviEncoding {
 DviEncoding *next;
 DviEncoding *prev;
 char *private;
 char *filename;
 char *name;
 char **vector;
 int links;
 long offset;
 DviHashTable nametab;
};

struct _DviFontMapEnt {
 DviFontMapEnt *next;
 DviFontMapEnt *prev;
 char *private;
 char *fontname;
 char *psname;
 char *encoding;
 char *encfile;
 char *fontfile;
 char *fullfile;
 long extend;
 long slant;
};




extern DviEncoding *mdvi_request_encoding (const char *);
extern void mdvi_release_encoding (DviEncoding *, int);
extern int mdvi_encode_glyph (DviEncoding *, const char *);
extern DviFontMapEnt *mdvi_load_fontmap (const char *);
extern void mdvi_install_fontmap (DviFontMapEnt *);
extern int mdvi_load_fontmaps (void);
extern int mdvi_query_fontmap (DviFontMapInfo *, const char *);
extern void mdvi_flush_encodings (void);
extern void mdvi_flush_fontmaps (void);

extern int mdvi_add_fontmap_file (const char *, const char *);


extern int mdvi_ps_read_fontmap (const char *);
extern char *mdvi_ps_find_font (const char *);
extern TFMInfo *mdvi_ps_get_metrics (const char *);
extern void mdvi_ps_flush_fonts (void);
# 131 "./mdvi.h" 2

struct _TFMChar {
 Int32 present;
 Int32 advance;
 Int32 height;
 Int32 depth;
 Int32 left;
 Int32 right;
};

struct _TFMInfo {
 int type;
 Uint32 checksum;
 Uint32 design;
 int loc;
 int hic;
 char coding[64];
 char family[64];
 TFMChar *chars;
};

struct _DviGlyph {
 short x, y;
 Uint w, h;
 void *data;
};

typedef void (*DviFontShrinkFunc)
 (DviContext *, DviFont *, DviFontChar *, DviGlyph *);
typedef int (*DviFontLoadFunc) (DviParams *, DviFont *);
typedef int (*DviFontGetGlyphFunc) (DviParams *, DviFont *, int);
typedef void (*DviFontFreeFunc) (DviFont *);
typedef void (*DviFontResetFunc) (DviFont *);
typedef char *(*DviFontLookupFunc) (const char *, Ushort *, Ushort *);
typedef int (*DviFontEncodeFunc) (DviParams *, DviFont *, DviEncoding *);

struct _DviFontInfo {
 char *name;
 int scalable;
 DviFontLoadFunc load;
 DviFontGetGlyphFunc getglyph;
 DviFontShrinkFunc shrink0;
 DviFontShrinkFunc shrink1;
 DviFontFreeFunc freedata;
 DviFontResetFunc reset;
 DviFontLookupFunc lookup;
 int kpse_type;
 void * private;
};

struct _DviFontChar {
 Uint32 offset;
 Int16 code;
 Int16 width;
 Int16 height;
 Int16 x;
 Int16 y;
 Int32 tfmwidth;
 Ushort flags;




 Ushort loaded : 1,
  missing : 1;

 Ulong fg;
 Ulong bg;
 BITMAP *glyph_data;

 DviGlyph glyph;
 DviGlyph shrunk;
 DviGlyph grey;
};

struct _DviFontRef {
 DviFontRef *next;
 DviFont *ref;
 Int32 fontid;
};

typedef enum {
 DviFontAny = -1,
 DviFontPK = 0,
 DviFontGF = 1,
 DviFontVF = 2,
 DviFontTFM = 3,
 DviFontT1 = 4,
 DviFontTT = 5,
 DviFontAFM = 6,
 DviFontOFM = 7
} DviFontType;

struct _DviFontSearch {
 int id;
 Ushort hdpi;
 Ushort vdpi;
 Ushort actual_hdpi;
 Ushort actual_vdpi;
 const char *wanted_name;
 const char *actual_name;
 DviFontClass *curr;
 DviFontInfo *info;
};
# 248 "./mdvi.h"
struct _DviFont {
 DviFont *next;
 DviFont *prev;
 int type;
 Int32 checksum;
 int hdpi;
 int vdpi;
 Int32 scale;
 Int32 design;
 FILE *in;
 char *fontname;
 char *filename;
 int links;
 int loc;
 int hic;
 Uint flags;
 DviFontSearch search;
 DviFontChar *chars;
 DviFontRef *subfonts;
 void *private;
};





typedef enum {
 MDVI_ORIENT_TBLR = 0,
 MDVI_ORIENT_TBRL = 1,
 MDVI_ORIENT_BTLR = 2,
 MDVI_ORIENT_BTRL = 3,
 MDVI_ORIENT_RP90 = 4,
 MDVI_ORIENT_RM90 = 5,
 MDVI_ORIENT_IRP90 = 6,
 MDVI_ORIENT_IRM90 = 7
} DviOrientation;

typedef enum {
 MDVI_PAGE_SORT_UP,
 MDVI_PAGE_SORT_DOWN,
 MDVI_PAGE_SORT_RANDOM,
 MDVI_PAGE_SORT_DVI_UP,
 MDVI_PAGE_SORT_DVI_DOWN,
 MDVI_PAGE_SORT_NONE
} DviPageSort;

struct _DviParams {
 double mag;
 double conv;
 double vconv;
 double tfm_conv;
 double gamma;
 Uint dpi;
 Uint vdpi;
 int hshrink;
 int vshrink;
 Uint density;
 Uint flags;
 int hdrift;
 int vdrift;
 int vsmallsp;
 int thinsp;
 int layer;
 Ulong fg;
 Ulong bg;
 DviOrientation orientation;
 int base_x;
 int base_y;
};

typedef enum {
 MDVI_PARAM_LAST = 0,
 MDVI_SET_DPI = 1,
 MDVI_SET_XDPI = 2,
 MDVI_SET_YDPI = 3,
 MDVI_SET_SHRINK = 4,
 MDVI_SET_XSHRINK = 5,
 MDVI_SET_YSHRINK = 6,
 MDVI_SET_GAMMA = 7,
 MDVI_SET_DENSITY = 8,
 MDVI_SET_MAGNIFICATION = 9,
 MDVI_SET_DRIFT = 10,
 MDVI_SET_HDRIFT = 11,
 MDVI_SET_VDRIFT = 12,
 MDVI_SET_ORIENTATION = 13,
 MDVI_SET_FOREGROUND = 14,
 MDVI_SET_BACKGROUND = 15
} DviParamCode;

struct _DviBuffer {
 Uchar *data;
 size_t size;
 size_t length;
 size_t pos;
 int frozen;
};


struct _DviState {
 int h;
 int v;
 int hh;
 int vv;
 int w;
 int x;
 int y;
 int z;
};

struct _DviColorPair {
 Ulong fg;
 Ulong bg;
};

struct _DviContext {
 char *filename;
 FILE *in;
 char *fileid;
 int npages;
 int currpage;
 int depth;
 DviBuffer buffer;
 DviParams params;
 DviPaper paper;
 Int32 num;
 Int32 den;
 DviFontRef *fonts;
 DviFontRef **fontmap;
 DviFontRef *currfont;
 int nfonts;
 Int32 dvimag;
 double dviconv;
 double dvivconv;
 int dvi_page_w;
 int dvi_page_h;
 Ulong modtime;
 PageNum *pagemap;
 DviState pos;
 DviPageSpec *pagesel;
 int curr_layer;
 DviState *stack;
 int stacksize;
 int stacktop;
 DviDevice device;
 Ulong curr_fg;
 Ulong curr_bg;

 DviColorPair *color_stack;
 int color_top;
 int color_size;

 DviFontRef *(*findref) (DviContext *, Int32);
 void *user_data;
};

typedef enum {
 MDVI_RANGE_BOUNDED,
 MDVI_RANGE_LOWER,
 MDVI_RANGE_UPPER,
 MDVI_RANGE_UNBOUNDED
} DviRangeType;

struct _DviRange {
 DviRangeType type;
 int from;
 int to;
 int step;
};

typedef void (*DviSpecialHandler)
 (DviContext *dvi, const char *prefix, const char *arg);
# 473 "./mdvi.h"
extern int mdvi_reload (DviContext *, DviParams *);
extern void mdvi_setpage (DviContext *, int);
extern int mdvi_dopage (DviContext *, int);
extern void mdvi_shrink_glyph (DviContext *, DviFont *, DviFontChar *, DviGlyph *);
extern void mdvi_shrink_box (DviContext *, DviFont *, DviFontChar *, DviGlyph *);
extern void mdvi_shrink_glyph_grey (DviContext *, DviFont *, DviFontChar *, DviGlyph *);
extern int mdvi_find_tex_page (DviContext *, int);
extern int mdvi_configure (DviContext *, DviParamCode, ...);

extern int get_tfm_chars (DviParams *, DviFont *, TFMInfo *, int);
extern int tfm_load_file (const char *, TFMInfo *);
extern int afm_load_file (const char *, TFMInfo *);
extern TFMInfo *get_font_metrics (const char *, int, const char *);
extern char *lookup_font_metrics (const char *, int *);
extern void free_font_metrics (TFMInfo *);
extern void flush_font_metrics (void);



extern void mdvi_sort_pages (DviContext *, DviPageSort);

extern void mdvi_init_kpathsea (const char *, const char *, const char *, int, const char *);

extern DviContext* mdvi_init_context (DviParams *, DviPageSpec *, const char *);
extern void mdvi_destroy_context (DviContext *);
# 523 "./mdvi.h"
extern DviRange* mdvi_parse_range (const char *, DviRange *, int *, char **);
extern DviPageSpec* mdvi_parse_page_spec (const char *);
extern void mdvi_free_page_spec (DviPageSpec *);
extern int mdvi_in_range (DviRange *, int, int);
extern int mdvi_range_length (DviRange *, int);
extern int mdvi_page_selected (DviPageSpec *, PageNum, int);


extern int mdvi_register_special ( const char *label, const char *prefix, const char *regex, DviSpecialHandler handler, int replace);





extern int mdvi_unregister_special (const char *prefix);
extern int mdvi_do_special (DviContext *dvi, char *dvi_special);
extern void mdvi_flush_specials (void);
# 555 "./mdvi.h"
extern DviFontRef *font_reference (DviParams *params, Int32 dvi_id, const char *font_name, Int32 checksum, int xdpi, int ydpi, Int32 scale_factor);
# 564 "./mdvi.h"
extern void font_drop_one (DviFontRef *);


extern void font_drop_chain (DviFontRef *);


extern void font_reset_one_glyph (DviDevice *, DviFontChar *, int);


extern void font_reset_font_glyphs (DviDevice *, DviFont *, int);


extern void font_reset_chain_glyphs (DviDevice *, DviFontRef *, int);

extern void font_finish_definitions (DviContext *);


extern DviFontRef* font_find_flat (DviContext *, Int32);
extern DviFontRef* font_find_mapped (DviContext *, Int32);


extern int font_reopen (DviFont *);


extern DviFontChar* font_get_glyph (DviContext *, DviFont *, int);


extern void font_transform_glyph (DviOrientation, DviGlyph *);


extern int font_free_unused (DviDevice *);





extern int mdvi_encode_font (DviParams *, DviFont *);


extern int mdvi_register_font_type (DviFontInfo *, int);
extern char **mdvi_list_font_class (int);
extern int mdvi_get_font_classes (void);
extern int mdvi_unregister_font_type (const char *, int);
extern char *mdvi_lookup_font (DviFontSearch *);
extern DviFont *mdvi_add_font (const char *, Int32, int, int, Int32);
extern int mdvi_font_retry (DviParams *, DviFont *);



extern int mdvi_set_logfile (const char *);
extern int mdvi_set_logstream (FILE *);
extern int mdvi_set_loglevel (int);





extern char* mdvi_getenv (const char *);
# 25 "bitmap.c" 2
# 1 "./color.h" 1
# 24 "./color.h"
extern Ulong *get_color_table(DviDevice *dev,
     int nlevels, Ulong fg, Ulong bg, double gamma, int density);

extern void mdvi_set_color (DviContext *, Ulong, Ulong);
extern void mdvi_push_color (DviContext *, Ulong, Ulong);
extern void mdvi_pop_color (DviContext *);
extern void mdvi_reset_color (DviContext *);
# 26 "bitmap.c" 2



static BmUnit bit_masks[] = {
 0x0, 0x1, 0x3, 0x7,
 0xf, 0x1f, 0x3f, 0x7f,
 0xff,

   0x1ff, 0x3ff, 0x7ff,
 0xfff, 0x1fff, 0x3fff, 0x7fff,
 0xffff,

   0x1ffff, 0x3ffff, 0x7ffff,
 0xfffff, 0x1fffff, 0x3fffff, 0x7fffff,
 0xffffff, 0x1ffffff, 0x3ffffff, 0x7ffffff,
 0xfffffff, 0x1fffffff, 0x3fffffff, 0x7fffffff,
 0xffffffff


};
# 65 "bitmap.c"
static int sample_count[] = {
 0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3, 2, 3, 3, 4,
 1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,
 1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,
 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
 1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,
 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
 3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,
 1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,
 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
 3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,
 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
 3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,
 3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,
 4, 5, 5, 6, 5, 6, 6, 7, 5, 6, 6, 7, 6, 7, 7, 8
};


static Uchar bit_swap[] = {
 0x00, 0x80, 0x40, 0xc0, 0x20, 0xa0, 0x60, 0xe0,
 0x10, 0x90, 0x50, 0xd0, 0x30, 0xb0, 0x70, 0xf0,
 0x08, 0x88, 0x48, 0xc8, 0x28, 0xa8, 0x68, 0xe8,
 0x18, 0x98, 0x58, 0xd8, 0x38, 0xb8, 0x78, 0xf8,
 0x04, 0x84, 0x44, 0xc4, 0x24, 0xa4, 0x64, 0xe4,
 0x14, 0x94, 0x54, 0xd4, 0x34, 0xb4, 0x74, 0xf4,
 0x0c, 0x8c, 0x4c, 0xcc, 0x2c, 0xac, 0x6c, 0xec,
 0x1c, 0x9c, 0x5c, 0xdc, 0x3c, 0xbc, 0x7c, 0xfc,
 0x02, 0x82, 0x42, 0xc2, 0x22, 0xa2, 0x62, 0xe2,
 0x12, 0x92, 0x52, 0xd2, 0x32, 0xb2, 0x72, 0xf2,
 0x0a, 0x8a, 0x4a, 0xca, 0x2a, 0xaa, 0x6a, 0xea,
 0x1a, 0x9a, 0x5a, 0xda, 0x3a, 0xba, 0x7a, 0xfa,
 0x06, 0x86, 0x46, 0xc6, 0x26, 0xa6, 0x66, 0xe6,
 0x16, 0x96, 0x56, 0xd6, 0x36, 0xb6, 0x76, 0xf6,
 0x0e, 0x8e, 0x4e, 0xce, 0x2e, 0xae, 0x6e, 0xee,
 0x1e, 0x9e, 0x5e, 0xde, 0x3e, 0xbe, 0x7e, 0xfe,
 0x01, 0x81, 0x41, 0xc1, 0x21, 0xa1, 0x61, 0xe1,
 0x11, 0x91, 0x51, 0xd1, 0x31, 0xb1, 0x71, 0xf1,
 0x09, 0x89, 0x49, 0xc9, 0x29, 0xa9, 0x69, 0xe9,
 0x19, 0x99, 0x59, 0xd9, 0x39, 0xb9, 0x79, 0xf9,
 0x05, 0x85, 0x45, 0xc5, 0x25, 0xa5, 0x65, 0xe5,
 0x15, 0x95, 0x55, 0xd5, 0x35, 0xb5, 0x75, 0xf5,
 0x0d, 0x8d, 0x4d, 0xcd, 0x2d, 0xad, 0x6d, 0xed,
 0x1d, 0x9d, 0x5d, 0xdd, 0x3d, 0xbd, 0x7d, 0xfd,
 0x03, 0x83, 0x43, 0xc3, 0x23, 0xa3, 0x63, 0xe3,
 0x13, 0x93, 0x53, 0xd3, 0x33, 0xb3, 0x73, 0xf3,
 0x0b, 0x8b, 0x4b, 0xcb, 0x2b, 0xab, 0x6b, 0xeb,
 0x1b, 0x9b, 0x5b, 0xdb, 0x3b, 0xbb, 0x7b, 0xfb,
 0x07, 0x87, 0x47, 0xc7, 0x27, 0xa7, 0x67, 0xe7,
 0x17, 0x97, 0x57, 0xd7, 0x37, 0xb7, 0x77, 0xf7,
 0x0f, 0x8f, 0x4f, 0xcf, 0x2f, 0xaf, 0x6f, 0xef,
 0x1f, 0x9f, 0x5f, 0xdf, 0x3f, 0xbf, 0x7f, 0xff
};
# 127 "bitmap.c"
BITMAP *bitmap_convert_lsb8(Uchar *bits, int w, int h, int stride)
{
 BITMAP *bm;
 int i;
 Uchar *unit;
 register Uchar *curr;
 int bytes;

 __debug ((1 << 12), "convert LSB %dx%d@8 -> bitmap\n", w, h);

 bm = bitmap_alloc_raw(w, h);


 bytes = (((w) + (8) - 1) / (8));
 unit = (Uchar *)bm->data;
 curr = bits;

 for(i = 0; i < h; i++) {

  memcpy(unit, curr, bytes);
  curr += stride;







  memset((unit + bytes), 0, (bm->stride - bytes));
  unit += bm->stride;
 }
 if(((_mdvi_debug_mask & (1 << 12)) && (_mdvi_debug_mask & (1 << 13))))
  bitmap_print(stderr, bm);
 return bm;
}

BITMAP *bitmap_convert_msb8(Uchar *data, int w, int h, int stride)
{
 BITMAP *bm;
 Uchar *unit;
 Uchar *curr;
 int i;
 int bytes;

 bm = bitmap_alloc(w, h);
 bytes = (((w) + (8) - 1) / (8));
 unit = (Uchar *)bm->data;
 curr = data;
 for(i = 0; i < h; i++) {

  int j;

  for(j = 0; j < bytes; curr++, j++)
   unit[j] = bit_swap[*curr];
  curr += stride - bytes;




  memset((unit + bytes), 0, (bm->stride - bytes));
  unit += bm->stride;
 }
 if(((_mdvi_debug_mask & (1 << 12)) && (_mdvi_debug_mask & (1 << 13))))
  bitmap_print(stderr, bm);
 return bm;
}

BITMAP *bitmap_copy(BITMAP *bm)
{
 BITMAP *nb = bitmap_alloc(bm->width, bm->height);

 __debug ((1 << 12), "copy %dx%d\n", bm->width, bm->height);
 memcpy(nb->data, bm->data, bm->height * bm->stride);
 return nb;
}

BITMAP *bitmap_alloc(int w, int h)
{
 BITMAP *bm;

 bm = (BITMAP *)mdvi_malloc(sizeof(BITMAP));
 bm->width = w;
 bm->height = h;
 bm->stride = (((((bm)->width) + ((4 << 3)) - 1) / ((4 << 3))) * 4);
 if(h && bm->stride)
  bm->data = (BmUnit *)mdvi_calloc(h, bm->stride);
 else
  bm->data = ((void*)0);

 return bm;
}

BITMAP *bitmap_alloc_raw(int w, int h)
{
 BITMAP *bm;

 bm = (BITMAP *)mdvi_malloc(sizeof(BITMAP));
 bm->width = w;
 bm->height = h;
 bm->stride = (((((bm)->width) + ((4 << 3)) - 1) / ((4 << 3))) * 4);
 if(h && bm->stride)
  bm->data = (BmUnit *)mdvi_malloc(h * bm->stride);
 else
  bm->data = ((void*)0);

 return bm;
}

void bitmap_destroy(BITMAP *bm)
{
 if(bm->data)
  free(bm->data);
 free(bm);
}

void bitmap_print(FILE *out, BITMAP *bm)
{
 int i, j;
 BmUnit *a, mask;
 static const char labels[] = {
  '1', '2', '3', '4', '5', '6', '7', '8', '9', '0'
 };
 int sub;

 a = bm->data;
 fprintf(out, "    ");
 if(bm->width > 10) {
  putchar('0');
  sub = 0;
  for(j = 2; j <= bm->width; j++)
   if((j %10) == 0) {
    if((j % 100) == 0) {
     fprintf(out, "*");
     sub += 100;
    } else
     fprintf(out, "%d", (j - sub)/10);
   } else
    putc(' ', out);
  fprintf(out, "\n    ");
 }
 for(j = 0; j < bm->width; j++)
  putc(labels[j % 10], out);
 putchar('\n');
 for(i = 0; i < bm->height; i++) {
  mask = ((BmUnit)1 << (0));
  a = (BmUnit *)((char *)bm->data + i * bm->stride);
  fprintf(out, "%3d ", i+1);
  for(j = 0; j < bm->width; j++) {
   if(*a & mask)
    putc('#', out);
   else
    putc('.', out);
   if(mask == ((BmUnit)1 << (((4 << 3) - 1)))) {
    a++;
    mask = ((BmUnit)1 << (0));
   } else
    ((mask) <<= 1);
  }
  putchar('\n');
 }
}

void bitmap_set_col(BITMAP *bm, int row, int col, int count, int state)
{
 BmUnit *ptr;
 BmUnit mask;

 ptr = (BmUnit *)((Uchar *)((bm)->data) + ((row) * (bm)->stride + ((col) / (4 << 3)) * 4));
 mask = ((BmUnit)1 << (((col) % (4 << 3))));

 while(count-- > 0) {
  if(state)
   *ptr |= mask;
  else
   *ptr &= ~mask;

  ptr = (BmUnit *)((Uchar *)(ptr) + (bm->stride));
 }
}
# 317 "bitmap.c"
void bitmap_paint_bits(BmUnit *ptr, int n, int count)
{

 if(n + count > (4 << 3)) {
  *ptr |= (bit_masks[(4 << 3) - n] << (n));
  count -= (4 << 3) - n;
  ptr++;
 } else {
  *ptr |= (bit_masks[count] << (n));
  return;
 }


 for(; count >= (4 << 3); count -= (4 << 3))
  *ptr++ = bit_masks[(4 << 3)];


 if(count > 0)
  *ptr |= (bit_masks[count] << (0));
}





void bitmap_clear_bits(BmUnit *ptr, int n, int count)
{
 if(n + count > (4 << 3)) {
  *ptr &= ~(bit_masks[(4 << 3) - n] << (n));
  count -= (4 << 3);
  ptr++;
 } else {
  *ptr &= ~(bit_masks[count] << (n));
  return;
 }

 for(; count >= (4 << 3); count -= (4 << 3))
  *ptr++ = 0;

 if(count > 0)
  *ptr &= ~(bit_masks[count] << (0));
}




void bitmap_set_row(BITMAP *bm, int row, int col, int count, int state)
{
 BmUnit *ptr;

 ptr = (BmUnit *)((Uchar *)((bm)->data) + ((row) * (bm)->stride + ((col) / (4 << 3)) * 4));
 if(state)
  bitmap_paint_bits(ptr, col & ((4 << 3)-1), count);
 else
  bitmap_clear_bits(ptr, col & ((4 << 3)-1), count);
}





void bitmap_flip_horizontally(BITMAP *bm)
{
 BITMAP nb;
 BmUnit *fptr, *tptr;
 BmUnit fmask, tmask;
 int w, h;

 nb.width = bm->width;
 nb.height = bm->height;
 nb.stride = bm->stride;
 nb.data = mdvi_calloc(bm->height, bm->stride);

 fptr = bm->data;
 tptr = (BmUnit *)((Uchar *)((&nb)->data) + ((0) * (&nb)->stride + ((nb.width-1) / (4 << 3)) * 4));
 for(h = 0; h < bm->height; h++) {
  BmUnit *fline, *tline;

  fline = fptr;
  tline = tptr;
  fmask = ((BmUnit)1 << (0));
  tmask = ((BmUnit)1 << (((nb.width-1) % (4 << 3))));
  for(w = 0; w < bm->width; w++) {
   if(*fline & fmask)
    *tline |= tmask;
   if(fmask == ((BmUnit)1 << (((4 << 3) - 1)))) {
    fmask = ((BmUnit)1 << (0));
    fline++;
   } else
    ((fmask) <<= 1);
   if(tmask == ((BmUnit)1 << (0))) {
    tmask = ((BmUnit)1 << (((4 << 3) - 1)));
    tline--;
   } else
    ((tmask) >>= 1);
  }
  fptr = (BmUnit *)((Uchar *)(fptr) + (bm->stride));
  tptr = (BmUnit *)((Uchar *)(tptr) + (bm->stride));
 }
 __debug ((1 << 12), "flip_horizontally (%d,%d) -> (%d,%d)\n", bm->width, bm->height, nb.width, nb.height);

 mdvi_free(bm->data);
 bm->data = nb.data;
 if(((_mdvi_debug_mask & (1 << 12)) && (_mdvi_debug_mask & (1 << 13))))
  bitmap_print(stderr, bm);
}

void bitmap_flip_vertically(BITMAP *bm)
{
 BITMAP nb;
 BmUnit *fptr, *tptr;
 BmUnit fmask;
 int w, h;

 nb.width = bm->width;
 nb.height = bm->height;
 nb.stride = bm->stride;
 nb.data = mdvi_calloc(bm->height, bm->stride);

 fptr = bm->data;
 tptr = (BmUnit *)((Uchar *)((&nb)->data) + ((nb.height-1) * (&nb)->stride + ((0) / (4 << 3)) * 4));
 for(h = 0; h < bm->height; h++) {
  BmUnit *fline, *tline;

  fline = fptr;
  tline = tptr;
  fmask = ((BmUnit)1 << (0));
  for(w = 0; w < bm->width; w++) {
   if(*fline & fmask)
    *tline |= fmask;
   if(fmask == ((BmUnit)1 << (((4 << 3) - 1)))) {
    fmask = ((BmUnit)1 << (0));
    fline++;
    tline++;
   } else
    ((fmask) <<= 1);
  }
  fptr = (BmUnit *)((Uchar *)(fptr) + (bm->stride));
  tptr = (BmUnit *)((char *)tptr - bm->stride);
 }
 __debug ((1 << 12), "flip_vertically (%d,%d) -> (%d,%d)\n", bm->width, bm->height, nb.width, nb.height);

 mdvi_free(bm->data);
 bm->data = nb.data;
 if(((_mdvi_debug_mask & (1 << 12)) && (_mdvi_debug_mask & (1 << 13))))
  bitmap_print(stderr, bm);
}

void bitmap_flip_diagonally(BITMAP *bm)
{
 BITMAP nb;
 BmUnit *fptr, *tptr;
 BmUnit fmask, tmask;
 int w, h;

 nb.width = bm->width;
 nb.height = bm->height;
 nb.stride = bm->stride;
 nb.data = mdvi_calloc(bm->height, bm->stride);

 fptr = bm->data;
 tptr = (BmUnit *)((Uchar *)((&nb)->data) + ((nb.height-1) * (&nb)->stride + ((nb.width-1) / (4 << 3)) * 4));
 for(h = 0; h < bm->height; h++) {
  BmUnit *fline, *tline;

  fline = fptr;
  tline = tptr;
  fmask = ((BmUnit)1 << (0));
  tmask = ((BmUnit)1 << (((nb.width-1) % (4 << 3))));
  for(w = 0; w < bm->width; w++) {
   if(*fline & fmask)
    *tline |= tmask;
   if(fmask == ((BmUnit)1 << (((4 << 3) - 1)))) {
    fmask = ((BmUnit)1 << (0));
    fline++;
   } else
    ((fmask) <<= 1);
   if(tmask == ((BmUnit)1 << (0))) {
    tmask = ((BmUnit)1 << (((4 << 3) - 1)));
    tline--;
   } else
    ((tmask) >>= 1);
  }
  fptr = (BmUnit *)((Uchar *)(fptr) + (bm->stride));
  tptr = (BmUnit *)((Uchar *)(tptr) + (-nb.stride));
 }
 __debug ((1 << 12), "flip_diagonally (%d,%d) -> (%d,%d)\n", bm->width, bm->height, nb.width, nb.height);

 mdvi_free(bm->data);
 bm->data = nb.data;
 if(((_mdvi_debug_mask & (1 << 12)) && (_mdvi_debug_mask & (1 << 13))))
  bitmap_print(stderr, bm);
}

void bitmap_rotate_clockwise(BITMAP *bm)
{
 BITMAP nb;
 BmUnit *fptr, *tptr;
 BmUnit fmask, tmask;
 int w, h;

 nb.width = bm->height;
 nb.height = bm->width;
 nb.stride = (((((&nb)->width) + ((4 << 3)) - 1) / ((4 << 3))) * 4);
 nb.data = mdvi_calloc(nb.height, nb.stride);

 fptr = bm->data;
 tptr = (BmUnit *)((Uchar *)((&nb)->data) + ((0) * (&nb)->stride + ((nb.width - 1) / (4 << 3)) * 4));

 tmask = ((BmUnit)1 << (((nb.width-1) % (4 << 3))));
 for(h = 0; h < bm->height; h++) {
  BmUnit *fline, *tline;

  fmask = ((BmUnit)1 << (0));
  fline = fptr;
  tline = tptr;
  for(w = 0; w < bm->width; w++) {
   if(*fline & fmask)
    *tline |= tmask;
   if(fmask == ((BmUnit)1 << (((4 << 3) - 1)))) {
    fmask = ((BmUnit)1 << (0));
    fline++;
   } else
    ((fmask) <<= 1);

   tline = (BmUnit *)((Uchar *)(tline) + (nb.stride));
  }
  fptr = (BmUnit *)((Uchar *)(fptr) + (bm->stride));
  if(tmask == ((BmUnit)1 << (0))) {
   tmask = ((BmUnit)1 << (((4 << 3) - 1)));
   tptr--;
  } else
   ((tmask) >>= 1);
 }

 __debug ((1 << 12), "rotate_clockwise (%d,%d) -> (%d,%d)\n", bm->width, bm->height, nb.width, nb.height);

 mdvi_free(bm->data);
 bm->data = nb.data;
 bm->width = nb.width;
 bm->height = nb.height;
 bm->stride = nb.stride;
 if(((_mdvi_debug_mask & (1 << 12)) && (_mdvi_debug_mask & (1 << 13))))
  bitmap_print(stderr, bm);
}

void bitmap_rotate_counter_clockwise(BITMAP *bm)
{
 BITMAP nb;
 BmUnit *fptr, *tptr;
 BmUnit fmask, tmask;
 int w, h;

 nb.width = bm->height;
 nb.height = bm->width;
 nb.stride = (((((&nb)->width) + ((4 << 3)) - 1) / ((4 << 3))) * 4);
 nb.data = mdvi_calloc(nb.height, nb.stride);

 fptr = bm->data;
 tptr = (BmUnit *)((Uchar *)((&nb)->data) + ((nb.height - 1) * (&nb)->stride + ((0) / (4 << 3)) * 4));

 tmask = ((BmUnit)1 << (0));
 for(h = 0; h < bm->height; h++) {
  BmUnit *fline, *tline;

  fmask = ((BmUnit)1 << (0));
  fline = fptr;
  tline = tptr;
  for(w = 0; w < bm->width; w++) {
   if(*fline & fmask)
    *tline |= tmask;
   if(fmask == ((BmUnit)1 << (((4 << 3) - 1)))) {
    fmask = ((BmUnit)1 << (0));
    fline++;
   } else
    ((fmask) <<= 1);

   tline = (BmUnit *)((Uchar *)(tline) + (-nb.stride));
  }
  fptr = (BmUnit *)((Uchar *)(fptr) + (bm->stride));
  if(tmask == ((BmUnit)1 << (((4 << 3) - 1)))) {
   tmask = ((BmUnit)1 << (0));
   tptr++;
  } else
   ((tmask) <<= 1);
 }

 __debug ((1 << 12), "rotate_counter_clockwise (%d,%d) -> (%d,%d)\n", bm->width, bm->height, nb.width, nb.height);

 mdvi_free(bm->data);
 bm->data = nb.data;
 bm->width = nb.width;
 bm->height = nb.height;
 bm->stride = nb.stride;
 if(((_mdvi_debug_mask & (1 << 12)) && (_mdvi_debug_mask & (1 << 13))))
  bitmap_print(stderr, bm);
}

void bitmap_flip_rotate_clockwise(BITMAP *bm)
{
 BITMAP nb;
 BmUnit *fptr, *tptr;
 BmUnit fmask, tmask;
 int w, h;

 nb.width = bm->height;
 nb.height = bm->width;
 nb.stride = (((((&nb)->width) + ((4 << 3)) - 1) / ((4 << 3))) * 4);
 nb.data = mdvi_calloc(nb.height, nb.stride);

 fptr = bm->data;
 tptr = (BmUnit *)((Uchar *)((&nb)->data) + ((nb.height-1) * (&nb)->stride + ((nb.width-1) / (4 << 3)) * 4));

 tmask = ((BmUnit)1 << (((nb.width-1) % (4 << 3))));
 for(h = 0; h < bm->height; h++) {
  BmUnit *fline, *tline;

  fmask = ((BmUnit)1 << (0));
  fline = fptr;
  tline = tptr;
  for(w = 0; w < bm->width; w++) {
   if(*fline & fmask)
    *tline |= tmask;
   if(fmask == ((BmUnit)1 << (((4 << 3) - 1)))) {
    fmask = ((BmUnit)1 << (0));
    fline++;
   } else
    ((fmask) <<= 1);

   tline = (BmUnit *)((Uchar *)(tline) + (-nb.stride));
  }
  fptr = (BmUnit *)((Uchar *)(fptr) + (bm->stride));
  if(tmask == ((BmUnit)1 << (0))) {
   tmask = ((BmUnit)1 << (((4 << 3) - 1)));
   tptr--;
  } else
   ((tmask) >>= 1);
 }
 __debug ((1 << 12), "flip_rotate_clockwise (%d,%d) -> (%d,%d)\n", bm->width, bm->height, nb.width, nb.height);

 mdvi_free(bm->data);
 bm->data = nb.data;
 bm->width = nb.width;
 bm->height = nb.height;
 bm->stride = nb.stride;
 if(((_mdvi_debug_mask & (1 << 12)) && (_mdvi_debug_mask & (1 << 13))))
  bitmap_print(stderr, bm);
}

void bitmap_flip_rotate_counter_clockwise(BITMAP *bm)
{
 BITMAP nb;
 BmUnit *fptr, *tptr;
 BmUnit fmask, tmask;
 int w, h;

 nb.width = bm->height;
 nb.height = bm->width;
 nb.stride = (((((&nb)->width) + ((4 << 3)) - 1) / ((4 << 3))) * 4);
 nb.data = mdvi_calloc(nb.height, nb.stride);

 fptr = bm->data;
 tptr = nb.data;
 tmask = ((BmUnit)1 << (0));

 for(h = 0; h < bm->height; h++) {
  BmUnit *fline, *tline;

  fmask = ((BmUnit)1 << (0));
  fline = fptr;
  tline = tptr;
  for(w = 0; w < bm->width; w++) {
   if(*fline & fmask)
    *tline |= tmask;
   if(fmask == ((BmUnit)1 << (((4 << 3) - 1)))) {
    fmask = ((BmUnit)1 << (0));
    fline++;
   } else
    ((fmask) <<= 1);

   tline = (BmUnit *)((Uchar *)(tline) + (nb.stride));
  }
  fptr = (BmUnit *)((Uchar *)(fptr) + (bm->stride));
  if(tmask == ((BmUnit)1 << (((4 << 3) - 1)))) {
   tmask = ((BmUnit)1 << (0));
   tptr++;
  } else
   ((tmask) <<= 1);
 }

 __debug ((1 << 12), "flip_rotate_counter_clockwise (%d,%d) -> (%d,%d)\n", bm->width, bm->height, nb.width, nb.height);

 mdvi_free(bm->data);
 bm->data = nb.data;
 bm->width = nb.width;
 bm->height = nb.height;
 bm->stride = nb.stride;
 if(((_mdvi_debug_mask & (1 << 12)) && (_mdvi_debug_mask & (1 << 13))))
  bitmap_print(stderr, bm);
}
# 755 "bitmap.c"
static int do_sample(BmUnit *data, int stride, int step, int w, int h)
{
 BmUnit *ptr, *end, *cp;
 int shift, n;
 int bits_left;
 int wid;

 ptr = data + step / (4 << 3);
 end = (BmUnit *)((Uchar *)(data) + (h * stride));
 shift = ((step) % (4 << 3));
 bits_left = w;
 n = 0;
 while(bits_left) {

  wid = (4 << 3) - shift;



  if(wid > bits_left)
   wid = bits_left;
  if(wid > 8)
   wid = 8;



  for(cp = ptr; cp < end; cp = (BmUnit *)((Uchar *)(cp) + (stride)))
   n += sample_count[(*cp >> shift) & bit_masks[wid]];

  shift += wid;







  if(shift == (4 << 3)) {
   shift = 0;
   ptr++;
  }

  bits_left -= wid;
 }
 return n;
}

void mdvi_shrink_box(DviContext *dvi, DviFont *font,
 DviFontChar *pk, DviGlyph *dest)
{
 int x, y, z;
 DviGlyph *glyph;
 int hs, vs;

 hs = dvi->params.hshrink;
 vs = dvi->params.vshrink;
 glyph = &pk->glyph;

 x = (int)glyph->x / hs;
 if((int)glyph->x - x * hs > 0)
  x++;
 dest->w = x + ((((int)glyph->w - glyph->x) + (hs) - 1) / (hs));

 z = (int)glyph->y + 1;
 y = z / vs;
 if(z - y * vs <= 0)
  y--;
 dest->h = y + ((((int)glyph->h - z) + (vs) - 1) / (vs)) + 1;
 dest->x = x;
 dest->y = glyph->y / vs;
 dest->data = ((void *)1);
 __debug ((1 << 8), "shrink_box: (%dw,%dh,%dx,%dy) -> (%dw,%dh,%dx,%dy)\n", glyph->w, glyph->h, glyph->x, glyph->y, dest->w, dest->h, dest->x, dest->y);


}

void mdvi_shrink_glyph(DviContext *dvi, DviFont *font,
 DviFontChar *pk, DviGlyph *dest)
{
 int rows_left, rows, init_cols;
 int cols_left, cols;
 BmUnit *old_ptr, *new_ptr;
 BITMAP *oldmap, *newmap;
 BmUnit m, *cp;
 DviGlyph *glyph;
 int sample, min_sample;
 int old_stride;
 int new_stride;
 int x, y;
 int w, h;
 int hs, vs;

 hs = dvi->params.hshrink;
 vs = dvi->params.vshrink;

 min_sample = vs * hs * dvi->params.density / 100;

 glyph = &pk->glyph;
 oldmap = (BITMAP *)glyph->data;

 x = (int)glyph->x / hs;
 init_cols = (int)glyph->x - x * hs;
 if(init_cols <= 0)
  init_cols += hs;
 else
  x++;
 w = x + ((((int)glyph->w - glyph->x) + (hs) - 1) / (hs));

 cols = (int)glyph->y + 1;
 y = cols / vs;
 rows = cols - y * vs;
 if(rows <= 0) {
  rows += vs;
  y--;
 }
 h = y + ((((int)glyph->h - cols) + (vs) - 1) / (vs)) + 1;


 newmap = bitmap_alloc(w, h);
 dest->data = newmap;
 dest->x = x;
 dest->y = glyph->y / vs;
 dest->w = w;
 dest->h = h;

 old_ptr = oldmap->data;
 old_stride = oldmap->stride;
 new_ptr = newmap->data;
 new_stride = newmap->stride;
 rows_left = glyph->h;

 while(rows_left) {
  if(rows > rows_left)
   rows = rows_left;
  cols_left = glyph->w;
  m = ((BmUnit)1 << (0));
  cp = new_ptr;
  cols = init_cols;
  while(cols_left > 0) {
   if(cols > cols_left)
    cols = cols_left;
   sample = do_sample(old_ptr, old_stride,
    glyph->w - cols_left, cols, rows);
   if(sample >= min_sample)
    *cp |= m;
   if(m == ((BmUnit)1 << (((4 << 3) - 1)))) {
    m = ((BmUnit)1 << (0));
    cp++;
   } else
    ((m) <<= 1);
   cols_left -= cols;
   cols = hs;
  }
  new_ptr = (BmUnit *)((Uchar *)(new_ptr) + (new_stride));
  old_ptr = (BmUnit *)((Uchar *)(old_ptr) + (rows * old_stride));
  rows_left -= rows;
  rows = vs;
 }
 __debug ((1 << 8), "shrink_glyph: (%dw,%dh,%dx,%dy) -> (%dw,%dh,%dx,%dy)\n", glyph->w, glyph->h, glyph->x, glyph->y, dest->w, dest->h, dest->x, dest->y);


 if((_mdvi_debug_mask & (1 << 13)))
  bitmap_print(stderr, newmap);
}

void mdvi_shrink_glyph_grey(DviContext *dvi, DviFont *font,
 DviFontChar *pk, DviGlyph *dest)
{
 int rows_left, rows;
 int cols_left, cols, init_cols;
 long sampleval, samplemax;
 BmUnit *old_ptr;
 void *image;
 int w, h;
 int x, y;
 DviGlyph *glyph;
 BITMAP *map;
 Ulong *pixels;
 int npixels;
 Ulong colortab[2];
 int hs, vs;
 DviDevice *dev;

 hs = dvi->params.hshrink;
 vs = dvi->params.vshrink;
 dev = &dvi->device;

 glyph = &pk->glyph;
 map = (BITMAP *)glyph->data;

 x = (int)glyph->x / hs;
 init_cols = (int)glyph->x - x * hs;
 if(init_cols <= 0)
  init_cols += hs;
 else
  x++;
 w = x + ((((int)glyph->w - glyph->x) + (hs) - 1) / (hs));

 cols = (int)glyph->y + 1;
 y = cols / vs;
 rows = cols - y * vs;
 if(rows <= 0) {
  rows += vs;
  y--;
 }
 h = y + ((((int)glyph->h - cols) + (vs) - 1) / (vs)) + 1;
 do { if(!(w && h)) mdvi_crash("%s:%d: Assertion %s failed\n", "bitmap.c", 960, "w && h"); } while(0);


 image = dev->create_image(dev->device_data, w, h, (4 << 3));
 if(image == ((void*)0)) {
  mdvi_shrink_glyph(dvi, font, pk, dest);
  return;
 }


 pk->fg = (dvi)->curr_fg;
 pk->bg = (dvi)->curr_bg;

 samplemax = vs * hs;
 npixels = samplemax + 1;
 pixels = get_color_table(&dvi->device, npixels, pk->fg, pk->bg,
   dvi->params.gamma, dvi->params.density);
 if(pixels == ((void*)0)) {
  npixels = 2;
  colortab[0] = pk->fg;
  colortab[1] = pk->bg;
  pixels = &colortab[0];
 }


 dest->data = image;
 dest->x = x;
 dest->y = glyph->y / vs;
 dest->w = w;
 dest->h = h;

 y = 0;
 old_ptr = map->data;
 rows_left = glyph->h;

 while(rows_left && y < h) {
  x = 0;
  if(rows > rows_left)
   rows = rows_left;
  cols_left = glyph->w;
  cols = init_cols;
  while(cols_left && x < w) {
   if(cols > cols_left)
    cols = cols_left;
   sampleval = do_sample(old_ptr, map->stride,
    glyph->w - cols_left, cols, rows);

   if(npixels - 1 != samplemax)
    sampleval = ((npixels-1) * sampleval) / samplemax;
   do { if(!(sampleval < npixels)) mdvi_crash("%s:%d: Assertion %s failed\n", "bitmap.c", 1009, "sampleval < npixels"); } while(0);
   dev->put_pixel(image, x, y, pixels[sampleval]);
   cols_left -= cols;
   cols = hs;
   x++;
  }
  for(; x < w; x++)
   dev->put_pixel(image, x, y, pixels[0]);
  old_ptr = (BmUnit *)((Uchar *)(old_ptr) + (rows * map->stride));
  rows_left -= rows;
  rows = vs;
  y++;
 }

 for(; y < h; y++) {
  for(x = 0; x < w; x++)
   dev->put_pixel(image, x, y, pixels[0]);
 }

        dev->image_done(image);
 __debug ((1 << 8), "shrink_glyph_grey: (%dw,%dh,%dx,%dy) -> (%dw,%dh,%dx,%dy)\n", glyph->w, glyph->h, glyph->x, glyph->y, dest->w, dest->h, dest->x, dest->y);


}
