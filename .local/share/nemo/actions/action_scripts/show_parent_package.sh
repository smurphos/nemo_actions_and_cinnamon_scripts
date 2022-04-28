#!/bin/dash
OUTPUT=$(dpkg -S "$1" | cut -f1 -d:)
if [ -z "$OUTPUT" ]; then
  zenity --info --ellipsize --text="$1\nis not provided by any known package"
else
  zenity --info --ellipsize --text="$1\nis from the package(s) $OUTPUT"
fi

  

   
