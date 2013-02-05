## Process this file with autoconf to produce configure script

## Copyright (C) 2012 Flammie Pirinen

## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.

## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.

## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

# autoconf >= 2.62 required for ...
AC_PREREQ([2.62])

# init must be at the start
AC_INIT([zhfst-installer], [0.0.1], [flammie@iki.fi], [zhfst-installer], 
        [https://github.com/flammie/zhfst-installer])
AC_CONFIG_AUX_DIR([build-aux])

# automake >= 1.11 required for color-tests, silent-rules
AM_INIT_AUTOMAKE([1.11 -Wall -Werror std-options foreign check-news color-tests silent-rules])
AM_SILENT_RULES([yes])

AC_CONFIG_MACRO_DIR([m4])

# Options

# Checks for programs
AM_PROG_VALAC
AC_PROG_INSTALL
AC_PROG_LN_S
AC_PROG_MAKE_SET

# Checks for libraries
PKG_CHECK_MODULES([HFST], [hfst >= 3.4])
PKG_CHECK_MODULES([HFSTOSPELL], [hfstospell >= 0.2])
PKG_CHECK_MODULES([GLIB], [glib-2.0 >= 2.12])
PKG_CHECK_MODULES([LIBXML], [libxml-2.0 >= 2.6.19])
AC_CHECK_LIB([archive], [main],
             , [AC_MSG_ERROR[libarchive is needed for zhfst installing])

# Checks for header files

# Checks for types

# Checks for structures

# Checks for compiler characteristics

# Checks for library functions

# Checks for system services

# config files
AC_CONFIG_FILES([Makefile])

# output
AC_OUTPUT

cat <<EOF
-- To build $PACKAGE_STRING, say make
EOF

