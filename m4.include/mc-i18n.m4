dnl @synopsis mc_I18N
dnl
dnl Check if environment is ready for get translations of docs from transifex
dnl
dnl @author Slava Zanko <slavazanko@gmail.com>
dnl @version 2011-02-10
dnl @license GPL
dnl @copyright Free Software Foundation, Inc.

AC_DEFUN([mc_I18N],[
    dnl User visible support for charset conversion.
    AC_ARG_ENABLE([charset],
        AS_HELP_STRING([--enable-charset], [Support for charset selection and conversion @<:@yes@:>@]))
    have_charset=
    charset_msg="no"
    if test "x$enable_charset" != "xno"; then
        AC_DEFINE(HAVE_CHARSET, 1, [Define to enable charset selection and conversion])
        have_charset=yes
        charset_msg="yes"

        AC_CHECK_HEADERS([gnu/libc-version.h])

        dnl Solaris has different name of Windows 1251 encoding
        case $host_os in
            solaris*)
                ENCODING_CP1251="ANSI-1251"
                ;;
            *)
                ENCODING_CP1251="CP1251"
                ;;
        esac

        if test "x$ac_cv_header_gnu_libc_version_h" != "xno"; then
            ENCODING_CP866="IBM866"
            ENCODING_ISO8859="ISO-8859"
        else
            ENCODING_CP866="CP866"
            ENCODING_ISO8859="ISO8859"
        fi

        AC_SUBST(ENCODING_CP1251)
        AC_SUBST(ENCODING_CP866)
    fi
])
