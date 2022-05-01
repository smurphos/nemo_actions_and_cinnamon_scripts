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
#Is destination under ownership of user?
DESTOWNER=$(stat -c %U "$1")
if [ "$DESTOWNER" != "$USER" ] ; then
  export SUDO_ASKPASS="$HOME/.local/share/nemo/actions/action_scripts/zenity_askpass.sh"
  sudo -A -u "$DESTOWNER" touch "$1/$NAME"
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
