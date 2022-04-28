#!/bin/dash
for i in "$@"; do
  if [ $(stat -c %U "$i") = "$USER" ] ; then
    exit 1
  fi
done
exit 0
