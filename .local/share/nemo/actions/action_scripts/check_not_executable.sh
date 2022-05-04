#!/bin/bash
for i in "$@"; do
  if [ -x "$i" ]; then
      RESULT="1"
      continue
    else
      RESULT="0"
      break
  fi
done
exit "$RESULT"
