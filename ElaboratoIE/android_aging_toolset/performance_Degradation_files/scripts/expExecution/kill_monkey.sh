#!/bin/sh

adb shell ps | awk '/com\.android\.commands\.monkey/ { system("adb shell kill " $2) }'
