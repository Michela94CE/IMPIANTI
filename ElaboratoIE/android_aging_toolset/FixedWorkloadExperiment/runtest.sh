#!/bin/bash

if [ $# -lt 2 ]
  then
    echo -e "${BROWNORANGE}Usage: ./runtest.sh num_of_secs mode"
    echo
    echo "	where:"
    echo "		num_of_secs 		is the duration of the test (in seconds)"
    echo -e "		mode			is the type of workload chosen. Can be either 'fixed' or 'variable'${NC}"
    exit
fi

if [ $2 != 'fixed' ] && [ $2 != 'variable' ]
  then
    echo -e "${BROWNORANGE}The input mode is invalid. It can only be either 'fixed' or 'variable'${NC}"
    exit
fi

DURATION=$1
MODE=$2
export PARENT_NAME=`dirname $PWD`
export SCRIPTDIR=$PARENT_NAME/performance_Degradation_files/scripts/expExecution

echo -e "${BROWNORANGE}TEST STARTED AT:${NC} "`date`
echo "TEST STARTED AT: "`date` > testtime.txt

#Scripts for Launch Time and for Memory analysis

echo -e "${BROWNORANGE}Starting the script for dumping memory...${NC}"
$SCRIPTDIR/dumpOnlyMeminfo.sh &
export DUMP_MEMCPUDISK=$!

echo -e "${BROWNORANGE}Starting the logcat_displayed script...${NC}"
$SCRIPTDIR/log_collection/logcat_displayed.sh &
export LOGCAT_DISPLAYED=$!

#Scripts for further optional analyses

echo -e "${BROWNORANGE}Starting the optional logcat_art script...${NC}"
$SCRIPTDIR/log_collection/logcat_art.sh &
export LOGCAT_ART=$!

echo -e "${BROWNORANGE}Starting the optional script for dumping tasks...${NC}"
$SCRIPTDIR/dumpTask.sh system_server &
export DUMP_SYSTEM_SERVER=$!

$SCRIPTDIR/dumpTask.sh mediaserver &
export DUMP_MEDIASERVER=$!

$SCRIPTDIR/dumpTask.sh systemui &
export DUMP_SYSTEMUI=$!

$SCRIPTDIR/dumpTask.sh surfaceflinger &
export DUMP_SURFACEFLINGER=$!

echo -e "${BROWNORANGE}Starting the script for Launch Time measurements...${NC}"
#Script for periodic Launch Time measurement
$SCRIPTDIR/launch/LaunchTimeMeasurement.sh &
export LAUNCH_KILL=$!

# ---- Workload Scripts ----

if [ $2 == 'fixed' ]
  then
    echo -e "${BROWNORANGE}Starting the Fixed Workload script...${NC}"
    $SCRIPTDIR/workload/WorkloadFixed.sh &
elif [ $2 == 'variable'  ]
  then  
    echo -e "${BROWNORANGE}Starting the Variable Workload script...${NC}"
    $SCRIPTDIR/workload/WorkloadVariable.sh &
fi

#Scripts for termination

echo -e "${BROWNORANGE}Starting script for scheduled termination after ${DURATION} seconds...${NC}"
$SCRIPTDIR/utility/kill_after_time.sh $DURATION
export KILL_TIME=$!

echo -e "${BROWNORANGE}TEST ENDED AT:${NC} "`date`
echo "TEST ENDED AT: "`date` >> testtime.txt

echo -e "${BROWNORANGE}KILLING ALL DUMP AND LOG SCRIPTS STILL IN EXECUTION, IF ANY...${NC}"

kill -9 $DUMP_SYSTEM_SERVER
kill -9 $DUMP_MEDIASERVER
kill -9 $DUMP_SYSTEMUI
kill -9 $DUMP_SURFACEFLINGER

kill -9 $DUMP_MEMCPUDISK
kill -9 $LAUNCH_KILL

kill -9 $LOGCAT_ART
kill -9 $LOGCAT_DISPLAYED

echo -e "${BROWNORANGE}ALL REMAINING DUMP AND LOG SCRIPTS HAVE BEEN KILLED${NC}"

