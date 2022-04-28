#!/bin/bash
URI=$(gsettings get org.cinnamon.desktop.background picture-uri)
UNQUOTED=${URI:1:-1}
FILE_PATH=${UNQUOTED#file:\/\/}
CHOICE=$(zenity --question --no-wrap --switch --extra-button="Open wallpaper directory" --extra-button="Open wallpaper in default image viewer" --extra-button="Cancel" --text="$FILE_PATH" --title="Current Wallpaper")
case "$CHOICE" in 
  "Open wallpaper directory")
    xdg-open "$(dirname "$FILE_PATH")";;
  "Open wallpaper in default image viewer")
    xdg-open "$FILE_PATH";;
     *)
     exit 1;;
esac

