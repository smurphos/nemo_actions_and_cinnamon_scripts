#!/bin/bash
# Script to set a per workspace desktop background in Cinnamon.
# Save as ~/bin/workspace_backgrounds_switcher.sh or ~/.local/bin/workspace_backgrounds_switcher.sh and make executable
# Add an entry in startup applications to launch the script on start-up.

# Set your images here - one per active workspace.
# Add extra WORKSPACE_BACKGROUND[X] entries as necessary.
WORKSPACE_BACKGROUND[0]="/usr/share/backgrounds/linuxmint/bookwood_linuxmint.jpg"
WORKSPACE_BACKGROUND[1]="/usr/share/backgrounds/linuxmint/edesigner_linuxmint.png"
WORKSPACE_BACKGROUND[2]="/usr/share/backgrounds/linuxmint/sele_linuxmint.png"


# Main script starts here
# Check for existing instances and kill them leaving current instance running
for PID in $(pidof -o %PPID -x "${0##*/}"); do
    if [ "$PID" != $$ ]; then
        kill -9 "$PID"
    fi 
done
# Monitor for workspace changes and set the background on change.
xprop -root -spy _NET_CURRENT_DESKTOP | while read -r;
  do
    gsettings set org.cinnamon.desktop.background picture-uri "file://${WORKSPACE_BACKGROUND[${REPLY: -1}]}"
  done
