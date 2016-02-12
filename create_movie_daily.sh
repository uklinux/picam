#!/bin/bash

# Debug
#set -xv

HOST=`hostname`
DIR=/var/tmp/${HOST}
cd ${DIR}/avi
DAY=`date +%Y%m%d`
DAY1=`date +%a_%d_%b_%y`
FILES=`ls -tr *${DAY}*.avi|tr '\n' ' '`
VID=${DIR}/vid/${DAY1}_movie_${HOST}.avi
sleep 5
mencoder -ovc copy -forceidx ${FILES} -o ${VID}
FILE=`echo $VID`
if [ -s ${FILE} ];then
        rm -f ${DIR}/avi/*${DAY}*.avi
        else
        exit 1
fi
exit 0
