#ifndef {{LIBRARY}}_DLLAPI_H
#define {{LIBRARY}}_DLLAPI_H

#ifdef {{LIBRARY}}_STATIC_DEFINE
#  define {{LIBRARY}}_DLLAPI
#  define {{LIBRARY}}_NO_EXPORT
#else
#  ifndef {{LIBRARY}}_DLLAPI
#    ifdef console_bridge_EXPORTS
        /* We are building this library */
#      define {{LIBRARY}}_DLLAPI __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define {{LIBRARY}}_DLLAPI __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef {{LIBRARY}}_NO_EXPORT
#    define {{LIBRARY}}_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef {{LIBRARY}}_DEPRECATED
#  define {{LIBRARY}}_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef {{LIBRARY}}_DEPRECATED_EXPORT
#  define {{LIBRARY}}_DEPRECATED_EXPORT {{LIBRARY}}_DLLAPI {{LIBRARY}}_DEPRECATED
#endif

#ifndef {{LIBRARY}}_DEPRECATED_NO_EXPORT
#  define {{LIBRARY}}_DEPRECATED_NO_EXPORT {{LIBRARY}}_NO_EXPORT {{LIBRARY}}_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef {{LIBRARY}}_NO_DEPRECATED
#    define {{LIBRARY}}_NO_DEPRECATED
#  endif
#endif

#endif /* {{LIBRARY}}_DLLAPI_H */
