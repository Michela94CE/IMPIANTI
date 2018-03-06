#!/bin/bash

DURATION=$1

#while true
#do
adb wait-for-device

#TERMINATION TIME (in seconds)

echo -e "${LIGHT_RED}The experiment terminates in $DURATION seconds (about $[($DURATION/60)/60] hours)...${NC}"

#TERMINATION TIME 
sleep $DURATION

echo -e "${LIGHT_RED}The experiment is terminating, all scripts except this one are being stopped...${NC}"
ps aux | grep expExecution | grep -v grep | grep -v 'kill_after_time' | awk '{print $2}' | xargs kill -9
echo -e "${LIGHT_RED}All scripts stopped. Rebooting phone in 15 seconds...${NC}"
sleep 15


echo -e "${LIGHT_RED}Rebooting phone in recovery mode...${NC}"
adb reboot recovery
echo -e "${LIGHT_RED}Waiting for device...${NC}"
sleep 30
#adb wait-for-device
echo -e "${LIGHT_RED}Wiping cache...${NC}"
adb shell twrp wipe cache
echo -e "${LIGHT_RED}Wiping dalvik cache${NC}"
adb shell twrp wipe dalvik
echo -e "${LIGHT_RED}Rebooting the phone${NC}"
adb reboot
echo -e "${LIGHT_RED}THE EXPERIMENT ENDED${NC}"

#adb shell su -c kill -9 ${SYS_PID}

