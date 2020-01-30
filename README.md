# ps2toolchain

This program will automatically build and install a compiler and other tools used in the creation of homebrew software for the Sony PlayStation® 2
  videogame system.

## What these scripts do

These scripts download (with wget) and install [binutils 2.25.1](http://www.gnu.org/software/binutils/ "binutils") (ee/iop), [gcc 6.5.0](https://gcc.gnu.org/ "gcc") (ee/iop), [newlib 3.1.0](https://sourceware.org/newlib/ "newlib") (ee), [ps2sdk](https://github.com/ps2dev/ps2sdk "ps2sdk"), and [ps2client](https://github.com/ps2dev/ps2client "ps2client").

## Requirements

1. Install g++, gcc/clang, make, patch, git, mpc-dev, diffutils, texinfo and wget if you don't have those.

   - Install pigz, pv. Used for faster decompression.

2. Add this to your login script (example: ~/.bash_profile)
`export PS2DEV=/usr/local/ps2dev`
`export PS2SDK=$PS2DEV/ps2sdk`
`export PATH=$PATH:$PS2DEV/bin:$PS2DEV/ee/bin:$PS2DEV/iop/bin:$PS2DEV/dvp/bin:$PS2SDK/bin`

3. Run this before
`export PS2DEV=/usr/local/ps2dev_new`

4. build toolchain
`./toolchain.sh`

5. Run this after (when you want to swich back to old toolchain)
`export PS2DEV=/usr/local/ps2dev`
