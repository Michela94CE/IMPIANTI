#!/bin/bash

echo -e "${LIGHT_PURPLE}Variable Workload Test Started${NC}"

#continuously run monkey, with random workload, setting the stress level

echo -e "${LIGHT_PURPLE}Launching the variable probe workload${NC}"

# THIS LIST CAN BE CUSTOMIZED DEPENDING ON THE DEVICE
#CLASSE 1: Stressing "Information and Content" processing: video, music, gaming, ebooks (multimedia). 5 Apps. Examples:

adb shell am force-stop com.google.android.videos
adb shell am force-stop com.google.android.music
adb shell am force-stop com.google.android.youtube
adb shell am force-stop com.sec.android.app.camera
adb shell am force-stop com.sec.android.gallery3d
#adb shell am force-stop com.google.android.play.games

#CLASSE 2: Stressing "Communication": Browser, Email, IM, video phone, social. 5 Apps. Examples:

adb shell am force-stop com.android.chrome
adb shell am force-stop com.sec.android.app.sbrowser
adb shell am force-stop com.android.email
adb shell am force-stop com.whatsapp
adb shell am force-stop com.facebook.katana
#Further examples
#com.google.android.apps.maps
#twitter

#CLASSE 3: Basic utilities: contacts, phones, SMS, MMS, settings, calculator, power manager,...

adb shell am force-stop com.android.phone
adb shell am force-stop com.android.contacts
adb shell am force-stop com.android.calendar
adb shell am force-stop com.android.settings
adb shell am force-stop com.sec.android.app.popupcalculator
#package for SMS


# NUMBER OF STATES: 3 CLASSES OF APPLICATIONS x 3 FREQUENCY OF EVENTS = 9 states

#STATE=0
COUNTER=0
while true; do

echo -e "${LIGHT_PURPLE}...${NC}"

SLEEP_TIME=$[ ( $RANDOM % 10 ) + 1 ]  # RANDOM SLEEP TO GO FROM THE CURRENT STATE TO THE NEXT STATE
echo -e "${LIGHT_PURPLE}SLEEP: $SLEEP_TIME seconds${NC}"
echo "SLEEP: $SLEEP_TIME" >> resultsWL.txt
sleep $SLEEP_TIME

STATE=$[ ( $RANDOM % 12 ) + 1 ] # # RANDOM STATE

let COUNTER=COUNTER+1
#let STATE=STATE+1

if [ $STATE -gt 9 ] #IT GOES WITH A PROBABILITY = 0.25 (3 out of 12 possibilities) to GO INTO THE SLEEPING STATE
then
echo -e "${LIGHT_PURPLE}State leading to sleep: $STATE ${NC}"
STATE=10
SLEEP_IN_IDLE=$[ ( $RANDOM % 600 ) + 1 ] # RANDOM SLEEP IN THE IDLE STATE
echo -e "${LIGHT_PURPLE}SLEEP_IN_IDLE: $SLEEP_IN_IDLE ${NC}"
echo "SLEEP_IN_IDLE: $SLEEP_IN_IDLE" >> resultsWL.txt
fi
echo -e "${LIGHT_PURPLE}Entering State...${NC}"
echo "Entering State..." >> resultsWL.txt
echo -e "${LIGHT_PURPLE}STATE: $STATE ${NC}"
echo "STATE: $STATE" >> resultsWL.txt
date
date >> resultsWL.txt

EVENTS_NUM=$[ ( $RANDOM % 1000 ) + 1 ]  # RANDOM NUMBER OF EVENTS
echo -e "${LIGHT_PURPLE}EVENTS_NUM: $EVENTS_NUM ${NC}"
echo $EVENTS_NUM >> resultsWL.txt

case "$STATE" in
1) echo "Commands for State1" >> resultsWL.txt

# CLASSE 1
$SCRIPTDIR/workload/LaunchTimeWorkloadCLASS_1.sh &
# Frequency 500;

adb shell monkey -p com.google.android.videos -p com.google.android.music -p com.google.android.youtube -p com.sec.android.app.camera -p com.sec.android.gallery3d --throttle 500 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes -s 1 -v -v --pct-touch 0 --pct-motion 0 --pct-trackball 33 --pct-nav 17 --pct-majornav 16 --pct-appswitch 34 --pct-syskeys 0 $EVENTS_NUM  >> resultsWL.txt

pkill -f LaunchTimeWorkloadCLASS_1.sh
;;

2) echo "Commands for State2" >> resultsWL.txt
# CLASSE 1
$SCRIPTDIR/workload/LaunchTimeWorkloadCLASS_1.sh &
# F=1500;

adb shell monkey -p com.google.android.videos -p com.google.android.music -p com.google.android.youtube -p com.sec.android.app.camera -p com.sec.android.gallery3d --throttle 1500 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes -s 1 -v -v --pct-touch 0 --pct-motion 0 --pct-trackball 33 --pct-nav 17 --pct-majornav 16 --pct-appswitch 34 --pct-syskeys 0 $EVENTS_NUM  >> resultsWL.txt

pkill -f LaunchTimeWorkloadCLASS_1.sh
;;
3) echo "Commands for State3" >> resultsWL.txt
# CLASSE 1

$SCRIPTDIR/workload/LaunchTimeWorkloadCLASS_1.sh &
# F=500;

adb shell monkey -p com.google.android.videos -p com.google.android.music -p com.google.android.youtube -p com.sec.android.app.camera -p com.sec.android.gallery3d --throttle 2500 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes -s 1 -v -v --pct-touch 0 --pct-motion 0 --pct-trackball 33 --pct-nav 17 --pct-majornav 16 --pct-appswitch 34 --pct-syskeys 0 $EVENTS_NUM  >> resultsWL.txt

pkill -f LaunchTimeWorkloadCLASS_1.sh
;;
4) echo "Commands for State4" >> resultsWL.txt

# CLASSE 2
$SCRIPTDIR/workload/LaunchTimeWorkloadCLASS_2.sh &

# F=L=500;
adb shell monkey -p com.android.chrome -p com.sec.android.app.sbrowser -p com.android.email --throttle 500 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes -s 1 -v -v --pct-touch 0 --pct-motion 0 --pct-trackball 33 --pct-nav 17 --pct-majornav 16 --pct-appswitch 34 --pct-syskeys 0 $EVENTS_NUM  >> resultsWL.txt

pkill -f LaunchTimeWorkloadCLASS_2.sh
;;
5) echo "Commands for State5" >> resultsWL.txt
# CLASSE 2

$SCRIPTDIR/workload/LaunchTimeWorkloadCLASS_2.sh &

# F=1500;
adb shell monkey -p com.android.chrome -p com.sec.android.app.sbrowser -p com.android.email --throttle 1500 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes -s 1 -v -v --pct-touch 0 --pct-motion 0 --pct-trackball 33 --pct-nav 17 --pct-majornav 16 --pct-appswitch 34 --pct-syskeys 0 $EVENTS_NUM  >> resultsWL.txt

pkill -f LaunchTimeWorkloadCLASS_2.sh
;;
6) echo "Commands for State6" >> resultsWL.txt
# CLASSE 2

$SCRIPTDIR/workload/LaunchTimeWorkloadCLASS_2.sh &

# F=L=2500;
adb shell monkey -p com.android.chrome -p com.sec.android.app.sbrowser -p com.android.email --throttle 2500 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes -s 1 -v -v --pct-touch 0 --pct-motion 0 --pct-trackball 33 --pct-nav 17 --pct-majornav 16 --pct-appswitch 34 --pct-syskeys 0 $EVENTS_NUM  >> resultsWL.txt

pkill -f LaunchTimeWorkloadCLASS_2.sh
;;
7) echo "Commands for State7" >> resultsWL.txt
# CLASSE 3
$SCRIPTDIR/workload/LaunchTimeWorkloadCLASS_3.sh &
# F=H=500;
adb shell monkey -p com.android.phone -p com.android.contacts -p com.android.settings -p com.sec.android.app.popupcalculator --throttle 500 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes -s 1 -v -v --pct-touch 16 --pct-motion 17 --pct-trackball 17 --pct-nav 16 --pct-majornav 17 --pct-appswitch 17 --pct-syskeys 0 $EVENTS_NUM  >> resultsWL.txt
pkill -f LaunchTimeWorkloadCLASS_3.sh
;;
8) echo "Commands for State8" >> resultsWL.txt
# CLASSE 3
$SCRIPTDIR/workload/LaunchTimeWorkloadCLASS_3.sh &
# F=H=1500;
adb shell monkey -p com.android.phone -p com.android.contacts -p com.android.settings -p com.sec.android.app.popupcalculator --throttle 1500 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes -s 1 -v -v --pct-touch 16 --pct-motion 17 --pct-trackball 17 --pct-nav 16 --pct-majornav 17 --pct-appswitch 17 --pct-syskeys 0 $EVENTS_NUM  >> resultsWL.txt
pkill -f LaunchTimeWorkloadCLASS_3.sh
;;
9) echo "Commands for State9" >> resultsWL.txt
# CLASSE 3
$SCRIPTDIR/workload/LaunchTimeWorkloadCLASS_3.sh &
# F=H=2500;
adb shell monkey -p com.android.phone -p com.android.contacts -p com.android.settings -p com.sec.android.app.popupcalculator --throttle 2500 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes -s 1 -v -v --pct-touch 16 --pct-motion 17 --pct-trackball 17 --pct-nav 16 --pct-majornav 17 --pct-appswitch 17 --pct-syskeys 0 $EVENTS_NUM  >> resultsWL.txt
pkill -f LaunchTimeWorkloadCLASS_3.sh
;;
10) echo "Commands for State10" >> resultsWL.txt
#IDLE STATE: sleep 10 minutes
sleep $SLEEP_IN_IDLE
;;
esac

echo -e "${LIGHT_PURPLE}Exiting state...${NC}"
date
echo "Exiting state..." >> resultsWL.txt
date >> resultsWL.txt

done

echo -e "${LIGHT_PURPLE}STOPPING...${NC}"
echo "STOPPING..." >> resultsWL.txt
date
date >> resultsWL.txt

echo -e "${LIGHT_PURPLE}STOPPED${NC}"
echo "STOPPED"  >> resultsWL.txt

