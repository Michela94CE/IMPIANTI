#!/bin/sh

adb shell logcat -v time | grep -E --line-buffered "[IWEFS]/art" >> gc.txt
