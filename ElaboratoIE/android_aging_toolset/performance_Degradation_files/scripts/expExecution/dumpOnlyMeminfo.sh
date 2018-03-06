#!/bin/bash

echo -e "${LIGHT_GREEN}Dumping memory usage${NC}"

COUNTER=1
while true; do

echo "Sample number is $COUNTER" >> systemServerSERVICE.txt
date >> systemServerSERVICE.txt

adb shell dumpsys meminfo -d system >> systemServerSERVICE.txt

#echo The counter is $COUNTER>> meminfo.txt
date >> meminfo.txt
adb shell dumpsys meminfo -d >> meminfo.txt

#echo The counter is $COUNTER>> com.android.systemui.txt
# date>>com.android.systemui.txt
#adb shell dumpsys meminfo -d com.android.systemui >> com.android.systemui.txt

sleep 30

echo -e "${LIGHT_GREEN}Dumping memory - Sample number:${NC} " $COUNTER
date
let COUNTER=COUNTER+1

done

