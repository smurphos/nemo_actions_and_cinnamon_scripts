#!/bin/bash
for i in "$@"; do
  shellcheck -W 10 "$i" > /tmp/shellcheck_"$(basename "$i")".txt;
  if [ -s /tmp/shellcheck_"$(basename "$i")".txt ]; then
    xdg-open /tmp/shellcheck_"$(basename "$i")".txt
    xdg-open "$i"
    gio set -t stringv "$i" metadata::emblems emblem-warning
  else
    gio set -t stringv "$i" metadata::emblems emblem-checked
  fi
touch "$i"
done
