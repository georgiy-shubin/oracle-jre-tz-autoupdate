#!/bin/bash
TZUPD_HOME=`pwd`
SEARCHPATH=$1
TZDATALINK=$2
case "$TZDATALINK" in
        'http'*|'HTTP'*)
                FILENAME=`echo $TZDATALINK | rev | cut -d"/" -f 1 | rev`
                wget -P $TZUPD_HOME/tzdata/ $TZDATALINK
                for i in $FILENAME; do sha512sum $TZUPD_HOME/tzdata/$i | awk '{print $1}' > $TZUPD_HOME/tzdata/$i.sha512; done
                TZDATA=file://$TZUPD_HOME/tzdata/$FILENAME
        ;;
        'tzdata'*'.tar.gz')
                TZDATA=file://$TZUPD_HOME/tzdata/$TZDATALINK
        ;;
        *)
                echo '  Please specify a correct filename or URL'
                echo
                exit
        ;;
esac
case "$3" in
        '-f')
                FORCE="-f"
        ;;
        *)
                FORCE=""
        ;;
esac
for i in `/bin/find $SEARCHPATH -name java | grep jre`; do echo ' '; $i -jar tzupdater.jar -l $TZDATA -v $FORCE; echo ' '; done