#!/bin/bash
#Get destination directory
DEST=$(zenity --file-selection --directory --title "Select the directory to copy to.")
if [ -z "$DEST" ]; then
  exit 1; 
fi
#Get ownership of $DEST
DESTOWNER=$(stat -c %U "$DEST")
for i in "$@"; do
#Check not overwriting an existing file or directory
  FILE=$(basename "$i")
  if [ -e "$DEST/$FILE" ]; then
    if ! zenity --question --icon-name=dialog-warning --width=250 --default-cancel --title="File conflict" --text="$DEST/$FILE already exists. Overwrite existing?"; then
	  NAME=$(zenity --entry --width=250 --title "File name" --text="Select an alternative file name or press cancel to abort." --entry-text="$FILE(Copy)")
      if [ -z "$NAME" ]; then
       exit 1
      fi
    else
      NAME=$FILE
    fi
  else
    NAME=$FILE
  fi
#Is destination under ownership of user?
if [ "$DESTOWNER" != "$USER" ] ; then
    if [ -z "$PASS" ]; then
      PASS=$(zenity --password --title="Authenticate to paste.")
    fi
    if [ -z "$PASS" ]; then
     exit 1
    fi
    echo -e "$PASS" | sudo -S -u "$DESTOWNER" cp -r  "$i" "$DEST/$NAME"
  else
    cp -r "$i" "$DEST/$NAME"
  fi
  if [ $? = 1 ]; then
    zenity --info --width=250 --text="Error copying $i. Try again."
    exit 1
  else
    notify-send --expire-time=200000 "Successfully copied $i to $DEST/$NAME"
  fi
done
