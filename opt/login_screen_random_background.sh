#!/bin/bash
# Script to randomly set slick-greeter's (Mint's Login screen) background from pictures in a directory

# Save as /opt/login_screen_random_background.sh and make executable
# Run sudo crontab -e
# Add the lines 

# @reboot /opt/login_screen_random_background.sh
# 0,30 * * * * /opt/login_screen_random_background.sh

# Ctrl-O and then Ctrl-X to save the crontab.
# The login-screen background will then update on boot and every half an hour.

# These variables are intended to be set by the end user. 
# Set PICS_DIR to a directory of your choice that is not in an encrypted home folder.
# This directory and it's sub-directories will be searched for images
# for display on the login screen.
PICS_DIR="/usr/share/backgrounds"

# Ensure that the directory and it contents permissions allow for all users to read the contents
# e.g.
# find /path/to/folder -type d -exec chmod -c 775 {} ";"
# find /path/to/folder -type f -exec chmod -c 664 {} ";

# This variable controls whether the order of images is random (true) or sequential (false)
RANDOM_ORDER=true

# Main script
# Set Working Directory
cd /etc/lightdm || exit
# Check for draw-user-backgrounds=false declaration and add it if missing
if (! grep -q "draw-user-backgrounds=false" slick-greeter.conf) ; then 
    echo "draw-user-backgrounds=false" >> slick-greeter.conf
fi
# Populate IMAGES array in sequential mode
if ( ! $RANDOM_ORDER ); then
  if [ -f /opt/login_screen_index ]; then
    INDEX=$(cat /opt/login_screen_index)
  else
	INDEX=0
  fi
  IMAGES=()
  while IFS=  read -r -d $'\0'; do
    IMAGES+=("$REPLY")
  done < <(find "$PICS_DIR" -iname '*.*p*g' -print0)
fi
# Get current background (if any)
OLD_PIC=$(grep "^background=" slick-greeter.conf)
# Get new background
if ( $RANDOM_ORDER ); then
  NEW_PIC="background=$(find "$PICS_DIR" -iname '*.*p*g' | shuf -n1)"
else
  NEW_PIC="background=${IMAGES[$INDEX]}"
  ((INDEX++))
  if [ $INDEX -ge "${#IMAGES[@]}" ]; then
    INDEX=0
  fi
  echo $INDEX > /opt/login_screen_index
fi
# Command to set or replace background image
if [ -n "$OLD_PIC" ]; then 
    sed -i "s|$OLD_PIC|$NEW_PIC|g" slick-greeter.conf
else
    echo "$NEW_PIC" >> slick-greeter.conf
fi
