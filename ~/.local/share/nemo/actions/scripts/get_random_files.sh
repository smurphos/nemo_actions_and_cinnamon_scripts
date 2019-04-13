#!/bin/bash
#Define target directory and number of files
TARGET=$(zenity --file-selection --directory --title "Select a target directory.")
if [ -z "$TARGET" ]; then
  exit 1; 
fi
#Is target writeable?
if [ ! -w "$TARGET" ] ; then
   zenity --info --width=250 --text="You do not have permission to copy files to $TARGET"
   exit 1
fi
NUMBER=$(zenity --entry --title="How many random files?" --text="Please enter an integer.")
if ! [[ $NUMBER =~ ^[0-9]+$ ]]; then
   zenity --info --width=250 --text="That's not an integer. Aborting operation. Please try again.";
   exit 1
fi
#Send a notification for job start
notify-send --expire-time=100000  "Get random files is working."
find "$1/" -type f | shuf -n"$NUMBER" | while read -r FILE; do cp -v "$FILE" "$TARGET/${FILE##*/}"; done
notify-send --expire-time=200000  "Your random files are in $TARGET"
