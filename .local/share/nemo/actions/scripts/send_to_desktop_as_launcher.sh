#!/bin/bash
#Set destination directory
DEST=$(xdg-user-dir DESKTOP)
if [ -z "$DEST" ]; then
  exit 1; 
fi
#Confirm name of launcher
LAUNCHER=$(basename "$1")
#Double check not overwriting an existing file or directory
if [ -e "$DEST/$LAUNCHER".desktop ]; then
  notify-send --expire-time=200000 "Error creating launcher. $DEST/$LAUNCHER already exists. Try again."
  exit 1
fi
echo -e "[Desktop Entry]\nName=$LAUNCHER\nExec=xdg-open $1\nComment=\nTerminal=false\nIcon=folder\nType=Application" > "$DEST/$LAUNCHER".desktop
chmod u+x "$DEST/$LAUNCHER".desktop
if [ $? = 1 ]; then
    notify-send --expire-time=200000 "Error creating launcher. Try again."
  exit 1
else
  notify-send --expire-time=200000 "Successfully created launcher $DEST/$LAUNCHER"
  exit 0
fi
