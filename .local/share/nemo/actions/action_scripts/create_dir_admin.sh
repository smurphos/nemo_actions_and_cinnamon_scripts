#!/bin/bash
#Enter directory name
NAME=$(zenity --entry --width 250 --title="Entire directory name." --text="Please type a name for your new directory.")
if [ -z "$NAME" ]; then
  exit 1; 
fi
#Check not overwriting an existing file or directory
if [ -e "$1/$NAME" ]; then
  zenity --info --width=250 --text="Error creating directory. $1/$NAME already exists. Try again."
  exit 1
fi
#Is destination under ownership of user?
DESTOWNER=$(stat -c %U "$1")
if [ "$DESTOWNER" != "$USER" ] ; then
  export SUDO_ASKPASS="$HOME/.local/share/nemo/actions/action_scripts/zenity_askpass.sh"
  sudo -A -u "$DESTOWNER" mkdir "$1/$NAME"
else
  mkdir "$1/$NAME"
fi
if [ $? = 1 ]; then
  zenity --info --width=250 --text="Error creating directory. Try again."
  exit 1
else
  notify-send --expire-time=200000 "Successfully created $1/$NAME"
  exit 0
fi
