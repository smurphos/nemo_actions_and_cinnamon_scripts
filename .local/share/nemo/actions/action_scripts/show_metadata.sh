#!/bin/dash
OUTPUT=$(gio info "$1" | grep "metadata::")
if [ -z "$OUTPUT" ]; then
  OUTPUT="$1 has no metadata"
fi
zenity --info --ellipsize --text="Metadata for $1\n\n$OUTPUT"

  

   
