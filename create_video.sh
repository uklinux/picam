#!/bin/bash
#################################################################################
#										#
#  Collate a list of jpeg stills and generate a time lapse avi file		#
#										#
#################################################################################

# Declare variables
DAY=`date +%d%m%Y` 
TIME=`date +%H%M`
SDATE=`date +%a_%d_%b_%y`
VDATE=`date +%a_%d_%b_%y`
HOST=`hostname`
DIR=/var/tmp/${HOST}
STILLS=${DIR}/${SDATE}_${DAY}.txt
VID=${DIR}/vid/${VDATE}_${TIME}_${HOST}.avi

# Check if mencoder is running
MEN=`ps -eaf|grep mencoder|grep -v grep|awk '{print $2}'`

if [ -z "$MEN" ] ;then
mv ${DIR}/jpg/*.jpg ${DIR}/tmp/
mv ${DIR}/jpg/*.avi ${DIR}/avi/
JPG=`ls -l ${DIR}/tmp/*.jpg|awk '{print $9}'|head -1`

	if [ -f "$JPG" ];then
	> $STILLS
	ls -l ${DIR}/tmp/*.jpg|awk '{print $9}' >>$STILLS

	# Generate the video
	mencoder -nosound -ovc lavc -lavcopts vcodec=mpeg4:aspect=16/9:vbitrate=8000000 -vf scale=800:600 -o ${VID} -mf type=jpeg:fps=10 mf://@${STILLS} 

	# Cleanup
	rm $STILLS
	cd ${DIR}/tmp/
	rm -f *.jpg
	fi
fi
exit 0
