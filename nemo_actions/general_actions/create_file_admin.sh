#!/bin/bash
#Enter file name
NAME=$(zenity --entry --width 250 --title="Entire file name." --text="Please type a name for your new file.")
if [ -z "$NAME" ]; then
  exit 1; 
fi
#Check not overwriting an existing file or directory
if [ -e "$1/$NAME" ]; then
  zenity --info --width=250 --text="Error creating file. $1/$NAME already exists. Try again."
  exit 1
fi
#Is destination writeable?
if [ ! -w "$1" ] ; then
  PASS=$(zenity --password --title="Authenticate to create file.")
  if [ -z "$PASS" ]; then
   exit 1
  fi
  echo -e "$PASS" | sudo -S touch "$1/$NAME"
else
  touch "$1/$NAME"
fi
if [ $? = 1 ]; then
  zenity --info --width=250 --text="Error creating file. Try again."
  exit 1
else
  notify-send --expire-time=200000 "Successfully created $1/$NAME"
  exit 0
fi
