#!/bin/sh
# check-texinfo.sh by AKuHAK

## Check for g++.
makeinfo --version 1> /dev/null || { echo "ERROR: Install ddiffutils before continuing."; exit 1; }
