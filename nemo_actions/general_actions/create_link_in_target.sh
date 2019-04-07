#!/bin/dash
#Get destination directory
DEST=$(zenity --file-selection --directory --title "Select the directory to create the link in.")
if [ -z "$DEST" ]; then
  exit 1; 
fi
#Is destination writeable?
if [ ! -w "$DEST" ] ; then
   zenity --info --width=200 --text="Error creating link. You do not have permission to create a link in $DEST"
   exit 1
fi
#Confirm name of link
if [ ! -e "$DEST/$2" ]; then
  NAME=$(zenity --entry --width=200 --title "Link name" --text="Confirm link name" --entry-text="$2" )
else
  NAME=$(zenity --entry --width=200 --title "Link name" --text="Confirm link name" --entry-text="Link to $2" )
fi
if [ -z "$NAME" ]; then
  exit 1;
fi
#Check not overwriting an existing file or directory
if [ -e "$DEST/$NAME" ]; then
   zenity --info --width=200 --text="Error creating link. $DEST/$NAME already exists."
   exit 1
fi
#Create link
notify-send "Creating link to $1 at $DEST/$NAME"
ln -s "$1" "$DEST/$NAME"
