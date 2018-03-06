#!/bin/bash

export PARENT_NAME=`dirname $PWD`
export SCRIPTDIR=$PARENT_NAME/expExecution
#Scripts for Launch Time and for Memory analysis

$SCRIPTDIR/dumpOnlyMeminfo.sh &
export DUMP_MEMCPUDISK=$!

$SCRIPTDIR/log_collection/logcat_displayed.sh &
export LOGCAT_DISPLAYED=$!

#Scripts for further optional analyses

$SCRIPTDIR/log_collection/logcat_art.sh &
export LOGCAT_ART=$!

$SCRIPTDIR/dumpTask.sh system_server &
export DUMP_SYSTEM_SERVER=$!

$SCRIPTDIR/dumpTask.sh mediaserver &
export DUMP_MEDIASERVER=$!

$SCRIPTDIR/dumpTask.sh systemui &
export DUMP_SYSTEMUI=$!

$SCRIPTDIR/dumpTask.sh surfaceflinger &
export DUMP_SURFACEFLINGER=$!

#Scripts for termination

$SCRIPTDIR/utility/kill_after_time.sh &
export KILL_TIME=$!

echo "TEST STARTED AT: "`date` > testtime.txt

#Script for periodic Launch Time measurement
$SCRIPTDIR/launch/LaunchTimeMeasurement.sh &
export LAUNCH_KILL=$!

# ---- Workload Scripts ----

$SCRIPTDIR/workload/WorkloadFixed.sh
#$SCRIPTDIR/workload/WorkloadVariable.sh

echo "TEST ENDED AT: "`date` >> testtime.txt

kill -9 $DUMP_SYSTEM_SERVER
kill -9 $DUMP_MEDIASERVER
kill -9 $DUMP_SYSTEMUI
kill -9 $DUMP_SURFACEFLINGER

kill -9 $DUMP_MEMCPUDISK
kill -9 $LAUNCH_KILL

kill -9 $LOGCAT_ART
kill -9 $LOGCAT_DISPLAYED

