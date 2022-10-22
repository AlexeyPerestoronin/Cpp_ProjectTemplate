
#ifndef TASKSLIB_EXPORT_H
#define TASKSLIB_EXPORT_H

#ifdef TASKSLIB_STATIC_DEFINE
#  define TASKSLIB_EXPORT
#  define TASKSLIB_NO_EXPORT
#else
#  ifndef TASKSLIB_EXPORT
#    ifdef TasksLib_EXPORTS
        /* We are building this library */
#      define TASKSLIB_EXPORT 
#    else
        /* We are using this library */
#      define TASKSLIB_EXPORT 
#    endif
#  endif

#  ifndef TASKSLIB_NO_EXPORT
#    define TASKSLIB_NO_EXPORT 
#  endif
#endif

#ifndef TASKSLIB_DEPRECATED
#  define TASKSLIB_DEPRECATED __declspec(deprecated)
#endif

#ifndef TASKSLIB_DEPRECATED_EXPORT
#  define TASKSLIB_DEPRECATED_EXPORT TASKSLIB_EXPORT TASKSLIB_DEPRECATED
#endif

#ifndef TASKSLIB_DEPRECATED_NO_EXPORT
#  define TASKSLIB_DEPRECATED_NO_EXPORT TASKSLIB_NO_EXPORT TASKSLIB_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef TASKSLIB_NO_DEPRECATED
#    define TASKSLIB_NO_DEPRECATED
#  endif
#endif

#endif /* TASKSLIB_EXPORT_H */
