#!/bin/bash

echo -e "${RED}}L and K CLASS 1${NC}"

#launch N apps once to measure the launch time


COUNTER=1
while true; do
RANDOM_SLEEP=$[ ( $RANDOM % 10 ) + 1 ]
echo -e "${RED}SLEEP: $RANDOM_SLEEP${NC}"
sleep $RANDOM_SLEEP

RANDOM_APP=$[ ( $RANDOM % 9 ) + 1 ]
echo -e "${RED}APP: $RANDOM_APP${NC}"
date
echo -e "${RED}The counter is $COUNTER${NC}"
case "$RANDOM_APP" in
1) echo -e "${RED}CLASS 1 - APP 1${NC}"
adb shell monkey -p com.sec.android.gallery3d -s 1 --pct-appswitch 100 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes 1
sleep 1
adb shell am force-stop com.sec.android.gallery3d
;;
2) echo -e "${RED}CLASS 1 - APP 2${NC}"
adb shell monkey -p com.sec.android.app.camera -s 1 --pct-appswitch 100 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes 1
sleep 1
adb shell am force-stop com.sec.android.app.camera
;;
3) echo -e "${RED}CLASS 1 - APP 3${NC}"
adb shell monkey -p com.google.android.youtube -s 1 --pct-appswitch 100 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes 1
sleep 1
adb shell am force-stop com.google.android.youtube
;;
4) echo -e "${RED}CLASS 1 - APP 4${NC}"
adb shell monkey -p com.google.android.music -s 1 --pct-appswitch 100 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes 1
sleep 1
adb shell am force-stop com.google.android.music
;;
5) echo -e "${RED}CLASS 1 - APP 5${NC}"
adb shell monkey -p com.google.android.videos -s 1 --pct-appswitch 100 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes 1
sleep 1
adb shell am force-stop com.google.android.videos
;;
esac

let COUNTER=COUNTER+1

done

