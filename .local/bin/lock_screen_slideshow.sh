#!/bin/bash

# Script to set a custom background or slideshow for Cinnamon's default lockscreen & screensaver
# Built and tested with Cinnamon 4.0.9 on Mint 19.1, but will probably work with older versions of Cinnamon
# Save the script as ~/bin/lock_screen_slideshow.sh or ~/.local/bin/lock_screen_slideshow.sh and make executable
# Add a entry to Startup Applications to launch the script after user login with a delay of 30 seconds
# Install dependency qdbus - apt install qdbus

# These variables are intended to be set by the end user.

# Set STATIC_BACKGROUND to the path to your image of choice for static image mode
STATIC_BACKGROUND="/usr/share/backgrounds/linuxmint/default_background.jpg"

# Set SLIDESHOW to true if you want a lock-screen / screensaver slideshow, false if you want a static image
SLIDESHOW=true

# Set SLIDESHOW_DIR to a directory of your choice
# This directory and it's sub-directorys will be searched for images
# for display in a random order in slideshow mode
SLIDESHOW_DIR="/usr/share/backgrounds"

# Set SLIDESHOW_RANDOM to true if you want the display of images in slideshow mode to be randomised, false if not
SLIDESHOW_RANDOM=true

# Set to PERSISTENT_INDEX=true if you want to remember the position of a non-random slideshow between sessions, false if not
PERSISTENT_INDEX=true

# INTERVAL is the time time in seconds between background transitions in slideshow mode
INTERVAL=10

# Main script starts here
# Check for existing instances and kill them leaving current instance running
for PID in $(pidof -o %PPID -x "${0##*/}"); do
    if [ "$PID" != $$ ]; then
        kill -9 "$PID"
    fi 
done

# set initial status
ACTIVE=false

# Populate IMAGES array in non random slideshow mode
if ( $SLIDESHOW && ! $SLIDESHOW_RANDOM ); then
  if ( $PERSISTENT_INDEX ) && [ -f ~/.local/bin/lock_screen_index ]; then
    INDEX=$(cat ~/.local/bin/lock_screen_index)
  else
    INDEX=0
  fi
  IMAGES=()
  while IFS=  read -r -d $'\n'; do
    IMAGES+=("$REPLY")
  done < <(find "$SLIDESHOW_DIR" -iname '*.*p*g' | sort -n)
fi

# Start the main loop to monitor screensaver status changes
dbus-monitor --profile "interface='org.cinnamon.ScreenSaver', member='ActiveChanged'" | while read -r
do
  # Screensaver active loop.
  while $(qdbus org.cinnamon.ScreenSaver /org/cinnamon/ScreenSaver org.cinnamon.ScreenSaver.GetActive) == true
  do
    # If screensaver just activated check status of native background slide-show, get user background and either set static
    # lock screen background or start slideshow
    if ( ! $ACTIVE ) ; then
      NATIVE_SLIDESHOW_STATE=$(gsettings get org.cinnamon.desktop.background.slideshow slideshow-enabled)
      DESK_BACKGROUND=$(gsettings get org.cinnamon.desktop.background picture-uri)
      ACTIVE=true
      if ( ! $SLIDESHOW ) ; then
        gsettings set org.cinnamon.desktop.background picture-uri "file://$STATIC_BACKGROUND"
      fi
      TIMER="$INTERVAL"
    fi
    # Update background if in slideshow mode
    if ( $SLIDESHOW ); then
      if [ $TIMER == $INTERVAL ] ; then
        if ( $SLIDESHOW_RANDOM ); then
          LOCK_BACKGROUND="$(find "$SLIDESHOW_DIR" -iname '*.*p*g' | shuf -n1)"
        else
          LOCK_BACKGROUND="${IMAGES[$INDEX]}"
          ((INDEX++))
          if [ $INDEX -ge "${#IMAGES[@]}" ]; then
            INDEX=0
          fi
          if ( $PERSISTENT_INDEX ); then
            echo "$INDEX" > ~/.local/bin/lock_screen_index
          fi
        fi
        gsettings set org.cinnamon.desktop.background picture-uri "file://$LOCK_BACKGROUND"
        TIMER=0
      fi
      ((TIMER++))
    fi
    sleep 1
  done 
  # Set background back to the user background and unpause native slideshow on screensaver de-activation
  if ( $ACTIVE ) ; then
    if ( $NATIVE_SLIDESHOW_STATE ) ; then
      gsettings set org.cinnamon.desktop.background.slideshow slideshow-enabled "$NATIVE_SLIDESHOW_STATE"
    else
      gsettings set org.cinnamon.desktop.background picture-uri "$DESK_BACKGROUND"
    fi
    ACTIVE=false
  fi
done
