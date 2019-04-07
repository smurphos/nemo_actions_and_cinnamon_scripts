#!/bin/dash
#Define target directory
DEST=$(zenity --file-selection --directory --title "Select the directory to create the link in.")
if [ -z "$DEST" ]; then exit 1; 
fi
#Confirm name of link
NAME=$(zenity --entry --width=200 --title "Link name" --text="Confirm link name" --entry-text="$2" )
if [ -z "$NAME" ]; then exit 1; 
#Create link
ln -s "$1" "$DEST/$NAME"
