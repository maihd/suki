#pragma once

#if defined(_MSC_VER) || (defined(_WIN32) && defined(__clang__))
#   ifndef SUKI_EXPORT
#       define SUKI_API __declspec(dllimport)
#   else
#       define SUKI_API __declspec(dllexport)
#   endif
#elif defined(__GNUC__)
#   define SUKI_API __attribute__((visible("default")))
#else
#   define SUKI_API 
#endif