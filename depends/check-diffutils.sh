#!/bin/sh
# check-diffutils.sh by AKuHAK

## Check for g++.
cmp --version 1> /dev/null || { echo "ERROR: Install ddiffutils before continuing."; exit 1; }