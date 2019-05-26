#!/bin/bash
FILEOWNER=$(stat -c %U "$1")
if [ "$FILEOWNER" = "$USER" ]; then
  geany -si "$1"
else
  export SUDO_EDITOR="geany -si"
  PASS=$(zenity --password --title="Authenticate to sudoedit.")
  if [ -z "$PASS" ]; then
   exit 1
  fi
  echo -e "$PASS" | sudoedit -S -u "$FILEOWNER" "$1"
fi

