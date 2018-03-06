#!/bin/bash

echo -e "${LIGHT_CYAN}Aging Stress Test Started${NC}"

#launch N apps once to measure the launch time
COUNTER=1
while true; do


adb shell monkey -p com.google.android.videos -s 1 --pct-appswitch 100 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes 1


sleep 1
adb shell monkey -p com.google.android.music -s 1 --pct-appswitch 100 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes 1


sleep 1
adb shell monkey -p com.google.android.youtube -s 1 --pct-appswitch 100 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes 1


sleep 1
adb shell monkey -p com.sec.android.app.camera -s 1 --pct-appswitch 100 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes 1


sleep 1
adb shell monkey -p com.sec.android.gallery3d -s 1 --pct-appswitch 100 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes 1


sleep 1
adb shell monkey -p com.android.chrome -s 1 --pct-appswitch 100 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes 1


sleep 1
adb shell monkey -p com.sec.android.app.sbrowser -s 1 --pct-appswitch 100 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes 1


sleep 1
adb shell monkey -p com.android.email -s 1 --pct-appswitch 100 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes 1

sleep 1
adb shell monkey -p com.android.phone -s 1 --pct-appswitch 100 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes 1

sleep 1
adb shell monkey -p com.android.contacts -s 1 --pct-appswitch 100 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes 1

sleep 1
adb shell monkey -p com.android.calendar -s 1 --pct-appswitch 100 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes 1

sleep 1
adb shell monkey -p com.android.settings -s 1 --pct-appswitch 100 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes 1

sleep 1
adb shell monkey -p com.sec.android.app.popupcalculator -s 1 --pct-appswitch 100 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes 1

sleep 1
adb shell monkey -p com.whatsapp -s 1 --pct-appswitch 100 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes 1

sleep 1
adb shell monkey -p com.facebook.katana -s 1 --pct-appswitch 100 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes 1


#echo "Sample number is " $COUNTER

let COUNTER=COUNTER+1

echo -e "${LIGHT_CYAN}Launch Time Measurement - Sample number:${NC} " $COUNTER
echo "Sample number is " $COUNTER >> LTsamples.txt
#echo Sample number $COUNTER

adb shell am force-stop com.google.android.videos
adb shell am force-stop com.google.android.music
adb shell am force-stop com.google.android.youtube
adb shell am force-stop com.sec.android.app.camera
adb shell am force-stop com.sec.android.gallery3d

adb shell am force-stop com.android.chrome
adb shell am force-stop com.sec.android.app.sbrowser
adb shell am force-stop com.android.email
adb shell am force-stop com.whatsapp
adb shell am force-stop com.facebook.katana

adb shell am force-stop com.android.phone
adb shell am force-stop com.android.contacts
adb shell am force-stop com.android.calendar
adb shell am force-stop com.android.settings
adb shell am force-stop com.sec.android.app.popupcalculator

sleep 60
done

