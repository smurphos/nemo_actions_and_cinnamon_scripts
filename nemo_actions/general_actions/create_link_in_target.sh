#!/bin/bash
#Get destination directory
DEST=$(zenity --file-selection --directory --title "Select the directory to create the link in.")
if [ -z "$DEST" ]; then
  exit 1; 
fi
#Confirm name of link
if [ ! -e "$DEST/$2" ]; then
  NAME=$(zenity --entry --width=250 --title "Link name" --text="Confirm link name" --entry-text="$2" )
else
  NAME=$(zenity --entry --width=250 --title "Link name" --text="Confirm link name" --entry-text="Link to $2" )
fi
if [ -z "$NAME" ]; then
  exit 1;
fi
#Check not overwriting an existing file or directory
if [ -e "$DEST/$NAME" ]; then
  zenity --info --width=250 --text="Error creating link. $DEST/$NAME already exists. Try again."
  exit 1
fi
#Is destination writeable?
if [ ! -w "$DEST" ] ; then
  PASS=$(zenity --password --title="Authenticate to create link.")
  echo -e "$PASS" | sudo -S ln -s "$1" "$DEST/$NAME"
else
  ln -s "$1" "$DEST/$NAME"
fi
if [ $? = 1 ]; then
  zenity --info --width=250 --text="Error creating link. Try again."
  exit 1
else
  notify-send --expire-time=200000 "Successfully created link from $DEST/$NAME to $1"
  exit 0
fi
