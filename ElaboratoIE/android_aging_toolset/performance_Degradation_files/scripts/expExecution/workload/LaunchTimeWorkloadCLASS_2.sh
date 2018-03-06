#!/bin/bash

echo -e "${GREEN}L and K CLASS 2${NC}"

#launch N apps once to measure the launch time

COUNTER=1
while true; do
RANDOM_SLEEP=$[ ( $RANDOM % 10 ) + 1 ]
echo -e "${GREEN}SLEEP: $RANDOM_SLEEP${NC}"
sleep $RANDOM_SLEEP

RANDOM_APP=$[ ( $RANDOM % 8 ) + 1 ]
echo -e "${GREEN}APP: $RANDOM_APP${NC}"
date
echo -e "${GREEN}The counter is $COUNTER${NC}"

case "$RANDOM_APP" in
1) echo -e "${GREEN}CLASS 2 - APP 1${NC}"
adb shell monkey -p com.android.chrome -s 1 --pct-appswitch 100 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes 1
sleep 1
adb shell am force-stop com.android.chrome
;;
2) echo -e "${GREEN}CLASS 2 - APP 2${NC}"
adb shell monkey -p com.sec.android.app.sbrowser -s 1 --pct-appswitch 100 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes 1
sleep 1
adb shell am force-stop com.sec.android.app.sbrowser
;;
3) echo -e "${GREEN}CLASS 2 - APP 3${NC}"
adb shell monkey -p com.android.email -s 1 --pct-appswitch 100 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes 1
sleep 1
adb shell am force-stop com.android.email
;;
4) echo -e "${GREEN}CLASS 2 - APP 4${NC}"
adb shell monkey -p com.whatsapp -s 1 --pct-appswitch 100 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes 1
sleep 1
adb shell am force-stop com.whatsapp
;;
5) echo -e "${GREEN}CLASS 2 - APP 5${NC}"
adb shell monkey -p com.facebook.katana -s 1 --pct-appswitch 100 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes 1
sleep 1
adb shell am force-stop com.facebook.katana
;;
esac

let COUNTER=COUNTER+1

done

