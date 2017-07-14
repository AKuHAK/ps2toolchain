#!/bin/bash
# newlib-2.5.0.sh by AKuHAK
# Based on newlib-1.10.0.sh by Dan Peori (danpeori@oopo.net)

NEWLIB_VERSION=2.5.0
## Download the source code.
SOURCE=http://sourceforge.net/projects/devkitpro/files/sources/newlib/newlib-$NEWLIB_VERSION.tar.gz
wget --continue $SOURCE || { exit 1; }

## Unpack the source code.
echo Decompressing newlib $NEWLIB_VERSION. Please wait.
rm -Rf newlib-$NEWLIB_VERSION && tar xfz newlib-$NEWLIB_VERSION.tar.gz || { exit 1; }

## Enter the source directory and patch the source code.
cd newlib-$NEWLIB_VERSION || { exit 1; }
if [ -e ../../patches/newlib-$NEWLIB_VERSION-PS2.patch ]; then
	cat ../../patches/newlib-$NEWLIB_VERSION-PS2.patch | patch -p1 || { exit 1; }
fi

## Determine the maximum number of processes that make can work with.
## MinGW's make doesn't work properly with multi-core processors.
OSVER=$(uname)
if [ ${OSVER:0:10} == MINGW32_NT ]; then
	PROC_NR=2
elif [ ${OSVER:0:6} == Darwin ]; then
	PROC_NR=$(sysctl -n hw.ncpu)
else
	PROC_NR=$(nproc)
fi

TARG_NAME="ee"
TARGET="mips64r5900el-ps2-elf"
## Create and enter the build directory.
mkdir build-$TARG_NAME && cd build-$TARG_NAME || { exit 1; }

## configure the build.
../configure --enable-silent-rules --prefix="$PS2DEV/$TARG_NAME" --target="$TARGET" || { exit 1; }

## Compile and install.
make "$PS2MKFLAGS" clean && make "$PS2MKFLAGS" -j $PROC_NR && make "$PS2MKFLAGS" install && make "$PS2MKFLAGS" clean || { exit 1; }
