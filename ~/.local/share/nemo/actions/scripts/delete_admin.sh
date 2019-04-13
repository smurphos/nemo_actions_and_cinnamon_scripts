#!/bin/bash
for i in "$@"; do
#Is directory writeable?
  if [ ! -w $(dirname "$i") ]; then
    if [ -z "$PASS" ]; then
    PASS=$(zenity --password --title="Authenticate to delete.")
    fi
    if [ -z "$PASS" ]; then
      exit 1
    fi
    if zenity --question --width=250 --default-cancel --title="Please confirm file deletion." --text="This action cannot be undone! Delete $i?"; then
      echo -e "$PASS" | sudo -S rm -r "$i"
    else
      exit 1
    fi
  else
    if zenity --question --width=250 --default-cancel --title="Please confirm file deletion." --text="This action cannot be undone! Delete $i?"; then
      rm -r "$i"
    else
      exit 1
    fi
  fi
  if [ $? = 1 ]; then
    zenity --info --width=250 --text="Error deleting $i. Try again."
    exit 1
  else
    notify-send --expire-time=200000 "Successfully deleted $i"
  fi
done
