#!/bin/bash
#Is directory writeable?
if [ ! -w "$2" ] ; then
  PASS=$(zenity --password --title="Authenticate to permanently delete.")
  if zenity --question --width=250 --default-cancel --title="Please confirm file deletion." --text="This action cannot be undone! Delete $1?"; then
    echo -e "$PASS" | sudo -S rm -r "$1"
  else
    exit 1
  fi
else
  if zenity --question --width=250 --default-cancel --title="Please confirm file deletion." --text="This action cannot be undone! Delete $1?"; then
    rm -r "$1"
  else
    exit 1
  fi
fi
if [ $? = 1 ]; then
  zenity --info --width=250 --text="Error deleting $1. Try again."
  exit 1
else
  notify-send --expire-time=200000 "Successfully deleted $1"
  exit 0
fi
