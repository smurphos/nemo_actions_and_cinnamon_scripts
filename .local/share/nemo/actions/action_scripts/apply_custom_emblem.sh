#!/bin/bash

#Shell script for nemo action apply_custom_emblem
#Requires zenity - apt install zenity
#Requires imagemagick - apt install imagemagick
#Requires wmctrl - apt install wmctrl
#Requires xplayer-video-thumbnailer or totem-video-thumbnailer - apt install xplayer or apt install totem

#Make a local emblems directory if it does not exist
mkdir -p "$HOME"/.icons/hicolor/256x256/emblems

#Create emblem function
function create_emblem {
  #If source is jpg, png or tiff use source directly to create emblem, otherwise use thumb-nailer to create a temporary source image
  if file "$2" | grep JPEG || file "$2" | grep PNG || file "$2" | grep TIFF; then
    convert "$2" -resize 256x256^ / -gravity center -extent 256x256 /tmp/emblem.png
  else
    "$3" -s 1024 "$2" /tmp/thumbnail.png
    convert /tmp/thumbnail.png -resize 256x256^ / -gravity center -extent 256x256 /tmp/emblem.png
  fi
  OUTPUT_FILE="$HOME"/.icons/hicolor/256x256/emblems/emblem-custom-$(identify -format %#\\n /tmp/emblem.png | cut -c 1-24)
  mv -f /tmp/emblem.png "$OUTPUT_FILE".png
  #Apply new emblem to directory
  gio set -t stringv "$1" metadata::emblems "$(basename "$OUTPUT_FILE")"
}

# Check which thumb-nailer is available
if command -v xplayer-video-thumbnailer; then
  THUMBNAILER="xplayer-video-thumbnailer"
elif command -v totem-video-thumbnailer; then
  THUMBNAILER="totem-video-thumbnailer"
else
  zenity --info --width=250 --text="No supported thumbnailer available. Please install xplayer or totem";
  exit 1
fi

#Random image or picker?
if [ -f "$1" ] || ANSWER=$(zenity --question --icon-name=dialog-question  --extra-button="Cancel" --no-wrap --title="Use file selection dialogue?" --text="\nChoose YES to select an image to use as emblem for $1\n\nChoose NO to use a random emblem for $1"); then
  #Picker
  if [ -d "$1" ]; then
  SOURCE_DIR="$1"
  else
  SOURCE_DIR=$(xdg-user-dir PICTURES)
  fi
  SOURCE_PIC=$(zenity --file-selection --filename="$SOURCE_DIR"/ --file-filter='Supported media (jpg/png/gif/tiff/mp3/mp4/mkv/avi/mov) | *.jp*g *JP*G *.png *.PNG *.gif *.GIF *.tif* *.TIF^ *.mp* *.MP* *.mkv *.MKV *.avi *.AVI *.mov *.MOV' --file-filter='All files | *' --title "Select source file")
  if [ -z "$SOURCE_PIC" ]; then
   exit 1;
  fi
  create_emblem "$1" "$SOURCE_PIC" "$THUMBNAILER"
elif [ "$ANSWER" == "Cancel" ]; then
  exit 1;
else
  #Random image select a maxdepth
  DEPTH=$(zenity --entry --title="Select maximum depth." --entry-text="1" --text="Confirm the maximum number of sub directory levels to search for images\n\nThe value should be greater than 0\n")
  if [ -z "$DEPTH" ]; then
   exit 1;
  fi
  if [[ ! $DEPTH =~ ^[0-9]+$ ]] || [[ $DEPTH = "0" ]]; then
   zenity --info --width=250 --text="Depth must be an integer greater than 0. Aborting operation. Please try again.";
   exit 1
  fi
  #Apply random emblems to sub-directories recursively?
  if ANSWER=$(zenity --question --icon-name=dialog-question --extra-button="Cancel" --no-wrap --title="Apply emblems recursively?" --text="\nChoose YES to apply random emblems to $1 and it's sub-directories\n\nChoose NO to apply a random emblem to $1 only"); then
    COUNT=0
    PROGRESS=0
    MAX=$(find -L "$1" -type d | wc -l)
    INCREMENT=$(echo "scale=2;$MAX / 100" | bc)
    find -L "$1" -type d -print0 | while IFS= read -r -d $'\0' DIRS; do
    SOURCE_PIC=$(find -L "$DIRS" -maxdepth "$DEPTH" -iname '*.jp*g' -o -iname '*.png' -o -iname '*.gif' -o -iname '*.tif*' -o -iname '*.mp*' -o -iname '*.mkv' -o -iname '*.avi' -o -iname '*.mov' | shuf -n1)
    ((COUNT++))
    if [ -n "$SOURCE_PIC" ]; then
      create_emblem "$DIRS" "$SOURCE_PIC" "$THUMBNAILER"
    fi
    PROGRESS=$(echo "$COUNT / $INCREMENT" | bc)
    echo "$PROGRESS"
    echo "# $COUNT of $MAX : $PROGRESS% Processing: $(basename "$DIRS")"
    done > >(zenity --progress --auto-close --percentage=0 --time-remaining --text="Applying emblems to $1 and sub-directories                                                                              ")
  elif [ "$ANSWER" == "Cancel" ]; then
    exit 1;
  else
     SOURCE_PIC=$(find -L "$1" -maxdepth "$DEPTH" -iname '*.jp*g' -o -iname '*.png' -o -iname '*.gif' -o -iname '*.tif*' -o -iname '*.mp*' -o -iname '*.mkv' -o -iname '*.avi' -o -iname '*.mov' | shuf -n1)
    if [ -z "$SOURCE_PIC" ]; then
      zenity --error --width=250 --text="Could not apply a random custom emblem\n\nNo supported file type found in directory"
      exit 1;
    fi
    create_emblem "$1" "$SOURCE_PIC" "$THUMBNAILER"
  fi
fi
#Quit and restart nemo desktop to load new emblems
nemo-desktop -q
nemo-desktop &
# Only restart nemo if there is at least one nemo window open.
# This will reopen nemo in the same directory as was active when the action was launched.
# Todo - find a reliable way to get the path of all open nemo windows / tabs and restart all of them.
if wmctrl -lx | grep nemo.Nemo; then
  nemo -q
  nemo "$(dirname "$1")" &
else
  nemo -q
fi
