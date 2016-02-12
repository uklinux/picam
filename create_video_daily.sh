#!/bin/bash

cd /var/tmp/front/vid
DAY=`date +%a_%d_%b_%y`
DAY1=`date +%Y%m%d`
DAY2=`date +%a_%d_%b_%y`
sleep 1500
HOST=`hostname`
DIR=/var/tmp/${HOST}
FILES=`ls -tr ${DAY}_*_${HOST}.avi|tr '\n' ' '`
VID=${DAY}_${HOST}.avi
sleep 30
mencoder -ovc copy -forceidx ${FILES} -o ${VID}
rm -f ${DIR}/vid/${DAY2}_????_${HOST}.avi
