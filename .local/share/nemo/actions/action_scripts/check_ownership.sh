#!/bin/bash
for i in "$@"; do
  if [ "$(stat -c %U "$i")" = "$USER" ] ; then
    RESULT="1"
    continue
  else
    RESULT="0"
    break
  fi
done
exit "$RESULT"
