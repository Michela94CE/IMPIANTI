#!/bin/sh

adb shell logcat -v time | grep --line-buffered "Displayed" >> Displayed.txt
