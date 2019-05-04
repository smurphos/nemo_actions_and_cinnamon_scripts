#!/bin/bash
#Set destination directory
DEST=$(xdg-user-dir DESKTOP)
if [ -z "$DEST" ]; then
  exit 1; 
fi
#Confirm name of link
LINK=$(basename "$1")
#Double check not overwriting an existing file or directory
if [ -e "$DEST/$LINK".desktop ]; then
  notify-send --expire-time=200000 "Error creating link. $DEST/$LINK already exists. Try again."
  exit 1
fi
echo -e "[Desktop Entry]\nName=$LINK\nURL=$1\nComment=\nTerminal=false\nIcon=folder\nType=Link" > "$DEST/$LINK".desktop
chmod u+x "$DEST/$LINK".desktop
if [ $? = 1 ]; then
    notify-send --expire-time=200000 "Error creating link. Try again."
  exit 1
else
  notify-send --expire-time=200000 "Successfully created link $DEST/$LINK"
  exit 0
fi
