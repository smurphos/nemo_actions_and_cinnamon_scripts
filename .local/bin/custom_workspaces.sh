#!/bin/bash
# Script to set a per workspace desktop background in Cinnamon.
# It also includes optional support for having a different Desktop folder associated with each workspace.
# The latter feature is disabled by default and requires cinnamon to be patched for it to work effectively.
# A patcher script in included in /nemo_actions_and_cinnamon_scripts/patcher.
# This should be run before enabling the feature.

# Save as  ~/.local/bin/custom_workspaces.sh and make executable
# Add an entry in startup applications to launch the script on start-up.

# The following variables are intended to be set by the end user.

# Set AUTO_BACKGROUND to true to populate your workspace backgrounds from a directory of images, false to define specific images in the script
AUTO_BACKGROUND=true

# Set the path for the directory to be used for AUTO_BACKGROUND. There should be at least as many images in this folder and it's subfolders
# as you intend to have workspaces. Cinnamon support upto 36 workspaces (0 to 35).
# The script will load images into an array sorted by filename. You can name your background images 00.jpg, 01.jpg, 02.jpg ... 33.jpg, 34.jpg, 35.jpg
# to associate specific backgrounds with specific workspaces.
AUTO_BACKGROUND_DIR="/home/steve/Pictures/Wallpapers/Desktop/Workspace_Backgrounds"

# If AUTO_BACKGROUND is false set specific workspace background images here
# Add extra WORKSPACE_BACKGROUND[X] entries as necessary for your maximum number of workspaces. Cinnamon supports workspace numbers 1 to 36.
WORKSPACE_BACKGROUND[0]="/opt/backgrounds/People/2048x1401_People_19c4165b4b8e97d487f862ed7bf8ea01f4d8a8a657ef431f12e040b5feacc70d.jpg"
WORKSPACE_BACKGROUND[1]="/opt/backgrounds/Personal/IMG_20190902_060119-01.jpeg"
WORKSPACE_BACKGROUND[2]="/opt/backgrounds/Personal/IMG_20190831_150512-01.jpeg"

# Set SWITCH_DESKTOP_WITH_WS to true to have a different desktop folder associated with each workspace.
SWITCH_DESKTOP_WITH_WS=true

# Main script starts here

# Check for existing instances and kill them leaving current instance running
for PID in $(pidof -o %PPID -x "${0##*/}"); do
    if [ "$PID" != $$ ]; then
        kill -9 "$PID"
    fi 
done

# Check for patched cinnamon components if running with SWITCH_DESKTOP_WITH_WS=true
# to do..grep the files for a patch string??

# Populate WORKSPACE_BACKGROUND array in AUTO_BACKGROUND MODE
if ( $AUTO_BACKGROUND ); then
  WORKSPACE_BACKGROUND=()
  while IFS=  read -r -d $'\n'; do
    WORKSPACE_BACKGROUND+=("$REPLY")
  done < <(find "$AUTO_BACKGROUND_DIR" -iname '*.*p*g' | sort -n)
  printf '%s\n' "${WORKSPACE_BACKGROUND[@]}"
fi

# Monitor for workspace changes and set the background / desktop directory on change.
xprop -root -spy _NET_CURRENT_DESKTOP | while read -r; do
  CURRENT_WS=$(echo "${REPLY}" | cut -d" " -f3)
  gsettings set org.cinnamon.desktop.background picture-uri "file://${WORKSPACE_BACKGROUND[$CURRENT_WS]}"
  if ( $SWITCH_DESKTOP_WITH_WS ); then
    WS_NUMBER=$((CURRENT_WS + 1))
    if [ ! -d "$HOME/Workspaces/Workspace_$WS_NUMBER" ]; then
      mkdir -p "$HOME/Workspaces/Workspace_$WS_NUMBER"
    fi
    xdg-user-dirs-update --set DESKTOP "$HOME/Workspaces/Workspace_$WS_NUMBER"
    xdg-user-dirs-gtk-update    
    nemo-desktop -q 2> /dev/null
    nemo-desktop 2> /dev/null & 
  fi
done
