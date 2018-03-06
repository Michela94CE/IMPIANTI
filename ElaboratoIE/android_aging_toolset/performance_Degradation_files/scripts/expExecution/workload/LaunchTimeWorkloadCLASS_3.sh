#!/bin/bash

echo -e "${RED}L and K CLASS 3${NC}"

#launch N apps once to measure the launch time


COUNTER=1
while true; do
RANDOM_SLEEP=$[ ( $RANDOM % 10 ) + 1 ]
echo -e "${RED}SLEEP: $RANDOM_SLEEP${NC}"
sleep $RANDOM_SLEEP

RANDOM_APP=$[ ( $RANDOM % 4 ) + 1 ]
echo -e "${RED}APP: $RANDOM_APP${NC}"
date
echo -e "${RED}The counter is $COUNTER ${NC}"

case "$RANDOM_APP" in
1) echo -e "${RED}CLASS 3 - APP 1${NC}"
adb shell monkey -p com.android.phone -s 1 --pct-appswitch 100 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes 1
sleep 1
adb shell am force-stop com.android.phone
;;
2) echo -e "${RED}CLASS 3 - APP 2${NC}"
adb shell monkey -p com.android.contacts -s 1 --pct-appswitch 100 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes 1
sleep 1
adb shell am force-stop com.android.contacts
;;
3) echo -e "${RED}CLASS 3 - APP 3${NC}"
adb shell monkey -p com.android.calendar -s 1 --pct-appswitch 100 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes 1
sleep 1
adb shell am force-stop com.android.calendar
;;
4) echo -e "${RED}CLASS 3 - APP 4${NC}"
adb shell monkey -p com.android.settings -s 1 --pct-appswitch 100 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes 1
sleep 1
adb shell am force-stop com.android.settings
;;
5) echo -e "${RED}CLASS 3 - APP 5${NC}"
adb shell monkey -p com.sec.android.app.popupcalculator -s 1 --pct-appswitch 100 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes 1
sleep 1
adb shell am force-stop com.sec.android.app.popupcalculator
;;
esac

let COUNTER=COUNTER+1

done

