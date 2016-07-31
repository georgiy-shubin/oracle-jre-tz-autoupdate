#!/bin/bash
IANALINK=$1
wget -P tzdata/ $IANALINK
for i in `ls tzdata/tzdata*.tar.gz`; do sha512sum $i | awk '{print $1}' > $i.sha512; done
