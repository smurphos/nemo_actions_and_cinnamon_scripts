#!/bin/dash
for i in "$@"; do
  # ignore $1 (not a file)
  if [ ! -f "$i" ]; then
    continue
  fi
  # is $i executable? 
  if [ -x "$i" ]; then
    # for action with executable as a condition
    if [ "$1" = "true" ]; then
      RESULT=0
      continue
    else
      exit 1
    fi
  fi
  # for action with not executable as a condition
  if [ "$1" = "false" ]; then
    RESULT=0
    continue
  else
    exit 1
  fi
done
exit "$RESULT"
