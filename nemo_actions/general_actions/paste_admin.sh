#!/bin/bash
#Get destination directory
DEST=$(zenity --file-selection --directory --title "Select the directory to paste into.")
if [ -z "$DEST" ]; then
  exit 1; 
fi
#Check not overwriting an existing file or directory
if [ -e "$DEST/$2" ]; then
  NAME=$(zenity --entry --width=250 --title "File name" --text="$DEST/$2 already exists. Please select an alternative file name" --entry-text="$2_(Copy)")
  else
  NAME=$2
fi
#Is destination writeable?
if [ ! -w "$DEST" ] ; then
  PASS=$(zenity --password --title="Authenticate to paste.")
  echo -e "$PASS" | sudo -S cp -r "$1" "$DEST/$NAME"
else
  cp -r "$1" "$DEST/$NAME"
fi
if [ $? = 1 ]; then
  zenity --info --width=250 --text="Error copying $1. Try again."
  exit 1
else
  notify-send --expire-time=200000 "Successfully copied $1 to $DEST/$NAME"
  exit 0
fi
