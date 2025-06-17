#ifndef foo_DLLAPI_H
#define foo_DLLAPI_H

#ifdef foo_STATIC_DEFINE
#  define foo_DLLAPI
#  define foo_NO_EXPORT
#else
#  ifndef foo_DLLAPI
#    ifdef console_bridge_EXPORTS
        /* We are building this library */
#      define foo_DLLAPI __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define foo_DLLAPI __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef foo_NO_EXPORT
#    define foo_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef foo_DEPRECATED
#  define foo_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef foo_DEPRECATED_EXPORT
#  define foo_DEPRECATED_EXPORT foo_DLLAPI foo_DEPRECATED
#endif

#ifndef foo_DEPRECATED_NO_EXPORT
#  define foo_DEPRECATED_NO_EXPORT foo_NO_EXPORT foo_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef foo_NO_DEPRECATED
#    define foo_NO_DEPRECATED
#  endif
#endif

#endif /* foo_DLLAPI_H */
