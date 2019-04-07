#!/bin/dash
if gio info "$1" | grep "emblem-checked"; then
  gio set -t unset "$1" metadata::emblems
else
  gio set -t stringv "$1" metadata::emblems emblem-checked
fi
touch "$1"
exit
  

   
