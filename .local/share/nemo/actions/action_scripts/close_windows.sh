#!/bin/dash

# Close windows gracefully
# depends on xdotool (apt install xdotool) and wmctrl (apt install wmctrl)

# Usage 
# close_windows.sh workspace: Closes all windows in current workspaces
# close_windows.sh all: Closes all windows all workspace

# you can exlude windows by their WM_CLASS
# e.g EXCLUSION1=Gnome-terminal
# add additional EXCLUSIONx lines as required
EXCLUSION1=foo
EXCLUSION2=foo

case "$1"
in
	all )       # get windows 
                WINDOWS=$(wmctrl -l | cut -f1 -d' ');;
	workspace ) # get current workspace with xdotool
                WORKSPACE=$(xdotool get_desktop)
                # get windows in current workspace
                WINDOWS=$(wmctrl -l | awk "/ $WORKSPACE /" | cut -f1 -d' ');;
	* )         echo "Usage\n\nclose_windows.sh workspace: Closes all windows in current workspaces\nclose_windows.sh all: Closes all windows all workspace";
	            exit 1;;
esac

# get ignored windows from exclusions and desktop
# expand awk statement with additional `|| /$EXCLUSIONx/` as required
NOTWINDOWS=$(wmctrl -l | awk "/ -1 / || /$EXCLUSION1/ || /$EXCLUSION2/" | cut -f1 -d' ')

# close windows gracefully
for i in $WINDOWS; do
  if ! echo "$NOTWINDOWS" | grep -wq "$i" ; then
    wmctrl -ic "$i"
  fi
  sleep 0.1
done
