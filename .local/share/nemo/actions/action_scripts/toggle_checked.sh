#!/bin/dash
for i in "$@"; do
  if gio info "$i" | grep "emblem-default"; then
    gio set -t unset "$i" metadata::emblems
  else
    gio set -t stringv "$i" metadata::emblems emblem-default
  fi
  touch "$i"
done
exit
  

   
