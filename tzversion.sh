#!/bin/bash
SEARCHPATH=$1
for i in `find $SEARCHPATH -name zi -type d | grep -v javavm`; do echo ' '; ls -ld $i | awk '{print $3,$4,$9}'; strings $i/ZoneInfoMappings |head -n 2| tail -1; done
echo ' '
