#!/bin/bash


export PROC_NAME=$1

if [ "x${PROC_NAME}" == "x" ]
then
	echo
	echo -e "${YELLOW}Usage: $0 <process name> (es. 'system_server')${NC}"
	echo
	exit 1
fi


export PROC_PID=`adb shell ps -t | sort | awk '(/'${PROC_NAME}'/) { print $2; exit }'`

if [ "x${PROC_PID}" == "x" ]
then
	echo
	echo -e "${YELLOW}Unable to find process PID (${PROC_NAME})${NC}"
	echo
	exit 1
fi


echo -e "${YELLOW}Dumping Task ${PROC_NAME} (${PROC_PID})${NC}"


adb shell ls /proc/${PROC_PID}/task/ >> ${PROC_NAME}_task_stat.txt
echo >> ${PROC_NAME}_task_stat.txt
adb shell top -t -n 1 | grep --line-buffered ${PROC_NAME} >> ${PROC_NAME}_task_stat.txt


COUNTER=1
while true; do


	echo >> ${PROC_NAME}_task_stat.txt
	echo -e "${YELLOW}Dumping Task ${PROC_NAME} - Sample number: $COUNTER ${NC}"
	echo "Sample number is $COUNTER" >> ${PROC_NAME}_task_stat.txt
	date >> ${PROC_NAME}_task_stat.txt
	adb shell cat /proc/${PROC_PID}/task/*/{stat,statm,schedstat}  >> ${PROC_NAME}_task_stat.txt

sleep 30

let COUNTER=COUNTER+1
#echo The counter is $COUNTER
#date

done

