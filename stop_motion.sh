#!/bin/bash
PID=`cat /var/run/motion/motion.pid`
sudo kill  $PID
exit 0
