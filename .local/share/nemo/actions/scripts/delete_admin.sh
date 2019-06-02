#!/bin/bash
CONFIRM=false
SUCCESSSTRING="Successfully deleted:"
for i in "$@"; do
#Is directory writeable?
  if [ ! -w "$(dirname "$i")" ]; then
    if [ -z "$PASS" ]; then
    PASS=$(zenity --password --title="Authenticate to delete")
    fi
    if [ -z "$PASS" ]; then
      exit 1
    fi
    if ( ! $CONFIRM ); then
      if zenity --question --icon-name=dialog-warning --width=250 --default-cancel --title="Please confirm deletion" --text="This action cannot be undone!\n\nDelete $# files/directories?"; then
        CONFIRM=true
        echo -e "$PASS" | sudo -S rm -r "$i"
      else
        exit 1
      fi
    else
      echo -e "$PASS" | sudo -S rm -r "$i"
    fi
  else
    if ( ! $CONFIRM ); then
      if zenity --question --icon-name=dialog-warning --width=250 --default-cancel --title="Please confirm deletion" --text="This action cannot be undone!\n\nDelete $# files/directories?"; then
        CONFIRM=true
        rm -r "$i"
      else
        exit 1
      fi
    else
      rm -r "$i"
    fi 
  fi
  if [ $? = 1 ]; then
    zenity --warning --width=250 --text="Error deleting $i\n\nOperation aborted."
    exit 1
  else
    SUCCESSSTRING+="
    $i"
  fi
done
    notify-send "$SUCCESSSTRING"
