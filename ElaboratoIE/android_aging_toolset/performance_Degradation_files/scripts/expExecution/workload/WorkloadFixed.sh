#!/bin/bash

echo -e "${LIGHT_BLUE}Fixed Workload Test Started${NC}"

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


while true; do


adb shell monkey -p com.google.android.videos -p com.sec.android.app.camera -p com.android.phone -p com.sec.android.app.sbrowser -p com.android.email -p com.android.contacts -p com.android.chrome -p  com.android.calendar -p com.google.android.music -p com.sec.android.app.popupcalculator -p com.google.android.youtube -p com.sec.android.gallery3d -p com.android.settings --throttle 100 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes -s 1 -v -v --pct-touch 0 --pct-motion 0 --pct-trackball 33 --pct-nav 17 --pct-majornav 16 --pct-appswitch 34 --pct-syskeys 0 400000 | grep "##" >> resultsWL.txt

echo -e "${LIGHT_BLUE}Fixed Workload test terminated${NC}" 
echo "Fixed Workload test terminated" >> LogWorkloadScript.txt
date >> LogWorkloadScript.txt

done

echo -e "${LIGHT_BLUE}STOPPING PHONE APPS...${NC}"

date

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


echo -e "${LIGHT_BLUE}PHONE APPS STOPPED${NC}"

