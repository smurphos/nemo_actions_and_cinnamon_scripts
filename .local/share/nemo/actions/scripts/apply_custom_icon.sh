#!/bin/dash
#Shell script for nemo action apply_custom_icon
#Requires zenity - apt install zenity
#Picker
if [ -d "$1" ]; then
  SOURCE_DIR="$1"
  else
  SOURCE_DIR=$(xdg-user-dir PICTURES)
fi
SOURCE_PIC=$(zenity --file-selection --filename="$SOURCE_DIR"/ --file-filter='Supported media (jpg/png/gif/tiff) | *.jp*g *JP*G *.png *.PNG *.gif *.GIF *.tif* *.TIF^' --file-filter='All files | *' --title "Select source file")
if [ -z "$SOURCE_PIC" ]; then
  exit 1;
fi
#Apply new icon
gio set -t string "$1" metadata::custom-icon "file://$SOURCE_PIC"
touch "$1"

