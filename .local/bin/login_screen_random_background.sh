#!/bin/dash
# Script to randomly set slick-greeter's (Mint's Login screen) background from pictures in a directory

# Save as ~/bin/login_screen_random_background.sh and make executable
# Run sudo crontab -e
# Add the lines 

# @reboot /home/yourusername/bin/login_screen_random_background.sh
# 0,30 * * * * /home/yourusername/bin/login_screen_random_background.sh

# Ctrl-O and then Ctrl-X to save the crontab.
# The login-screen background will then update on boot and every half an hour.

# This variable is intended to be set by the end user. 
# Set PICS_DIR to a directory of your choice that is not in an encrypted home folder.
# This directory and it's sub-directories will be searched for images
# for display on the login screen.
PICS_DIR="/usr/share/backgrounds"


# Set Working Directory
cd /etc/lightdm || exit
# Check for draw-user-backgrounds=false declaration and add it if missing
if (! grep -q "draw-user-backgrounds=false" slick-greeter.conf) ; then 
    echo "draw-user-backgrounds=false" >> slick-greeter.conf
fi
# Get current background (if any)
OLD_PIC=$(grep "^background=" slick-greeter.conf)
# Command to select a random jpg file from directory
NEW_PIC="background=$(find "$PICS_DIR" -iname '*.jp*g' -o -iname '*.png' | shuf -n1)"
# Command to set or replace background image
if [ -n "$OLD_PIC" ]; then 
    sed -i "s|$OLD_PIC|$NEW_PIC|g" slick-greeter.conf
else
    echo "$NEW_PIC" >> slick-greeter.conf
fi
