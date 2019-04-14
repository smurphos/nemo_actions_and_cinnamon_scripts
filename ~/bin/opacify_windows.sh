#!/bin/bash

# A script to set window opacity depending on window status & type.
# Save as ~/bin/opacify_windows.sh or ~./local/bin/opacify_windows.sh and make executable
# Add a startup applications entry to run opacify_windows.sh when you log-in.

# Requires xdotool and wmctrl - apt install xdotool wmctrl

# These variables define the opacity of various window types - values 1 to 100
EXCLUDE_OPACITY=100           # Excluded windows
FULLSCREEN_OPACITY=100        # Full screen windows
TILED_OPACITY=100             # Tiled focused windows
MAXIMISED_OPACITY=100         # Maximised focused windows
DEMANDS_ATTENTION_OPACITY=100 # Any window demanding attention
FOCUS_OPACITY=98              # Focused non-maximised application
GROUP_OPACITY=95              # Unfocussed applications that share a PID with the focussed application
DEFAULT_OPACITY=75            # Any others - e.g unfocused applications.

# Any window types to exclude. See https://standards.freedesktop.org/wm-spec/latest/ar01s05.html
EXCLUDE_TYPE='DESKTOP|DOCK|SPLASH'

# Any Window classes to exclude. This is a way of excluding specific applications from the opacify function.
# You can determine window classes for currently open applications using wmctrl -lx
EXCLUDE_CLASS='Firefox|Google-chrome|Xplayer|vlc'

# This function is called on a change of Window state and updates the opacity of all windows on the current workspace.
function opacify_windows {
  # get current workspace with xdotool
  WORKSPACE=$(xdotool get_desktop)
  # set focused window opacity
if xprop -id "$1" _NET_WM_WINDOW_TYPE | grep -E $EXCLUDE_TYPE || xprop -id "$1" WM_CLASS | grep -E $EXCLUDE_CLASS; then
  xprop -id "$1" -f _NET_WM_WINDOW_OPACITY 32c -set _NET_WM_WINDOW_OPACITY "$(printf 0x%x $((0xffffffff * EXCLUDE_OPACITY / 100)))"
elif xprop -id "$1" _NET_WM_STATE | grep -q FULLSCREEN; then
  xprop -id "$1" -f _NET_WM_WINDOW_OPACITY 32c -set _NET_WM_WINDOW_OPACITY "$(printf 0x%x $((0xffffffff * FULLSCREEN_OPACITY / 100)))"
elif xprop -id "$1" _NET_WM_STATE | grep -q TILE; then
  xprop -id "$1" -f _NET_WM_WINDOW_OPACITY 32c -set _NET_WM_WINDOW_OPACITY "$(printf 0x%x $((0xffffffff * TILED_OPACITY / 100)))"
elif xprop -id "$1" _NET_WM_STATE | grep -q MAXIMIZED; then
  xprop -id "$1" -f _NET_WM_WINDOW_OPACITY 32c -set _NET_WM_WINDOW_OPACITY "$(printf 0x%x $((0xffffffff * MAXIMISED_OPACITY / 100)))"
elif xprop -id "$1" _NET_WM_STATE | grep -q DEMANDS; then
  xprop -id "$1" -f _NET_WM_WINDOW_OPACITY 32c -set _NET_WM_WINDOW_OPACITY "$(printf 0x%x $((0xffffffff * DEMANDS_ATTENTION_OPACITY / 100)))"
else
  xprop -id "$1" -f _NET_WM_WINDOW_OPACITY 32c -set _NET_WM_WINDOW_OPACITY "$(printf 0x%x $((0xffffffff * FOCUS_OPACITY / 100)))"
fi
# Don't update all windows unless there has been a change in focus
if [ "$1" == "$2" ]; then
  return
fi
# get list of all window IDs in workspace
  WIDS=$(wmctrl -l | awk "/ $WORKSPACE /" | awk '{print$1}')
# run through list and update opacity
for w in $WIDS; do
  if xprop -id "$w" _NET_WM_WINDOW_TYPE | grep -E $EXCLUDE_TYPE || xprop -id "$w" WM_CLASS | grep -E $EXCLUDE_CLASS; then
    xprop -id "$w" -f _NET_WM_WINDOW_OPACITY 32c -set _NET_WM_WINDOW_OPACITY "$(printf 0x%x $((0xffffffff * EXCLUDE_OPACITY / 100)))"
  elif xprop -id "$w" _NET_WM_STATE | grep -q DEMANDS; then
    xprop -id "$w" -f _NET_WM_WINDOW_OPACITY 32c -set _NET_WM_WINDOW_OPACITY "$(printf 0x%x $((0xffffffff * DEMANDS_ATTENTION_OPACITY / 100)))"
  elif [ "$w" != "$1" ] && diff <(xprop -id "$w" _NET_WM_PID) <(xprop -id "$1" _NET_WM_PID); then
    xprop -id "$w" -f _NET_WM_WINDOW_OPACITY 32c -set _NET_WM_WINDOW_OPACITY "$(printf 0x%x $((0xffffffff * GROUP_OPACITY / 100)))"
  elif [ "$w" != "$1" ]; then
    xprop -id "$w" -f _NET_WM_WINDOW_OPACITY 32c -set _NET_WM_WINDOW_OPACITY "$(printf 0x%x $((0xffffffff * DEFAULT_OPACITY / 100)))"
  fi
done }

# Check for existing instance and exit if already running
for PID in $(pgrep -f "${0##*/}"); do
    if [ "$PID" != $$ ]; then
        exit 1
    fi  
done
# main loop
while :
do
  # get current focused window
  while ! xdotool getactivewindow 2> /dev/null; do true; done
  INITID=$(printf 0x0%x "$(xdotool getactivewindow)")
  # wait for any change in state in the originally focused window
  xprop -notype -id "$INITID" -spy _NET_WM_STATE 2> /dev/null | while read -r;
  do
    sleep 0.1;
    # update the currently focused window in case the change was a change in focus
    while ! xdotool getactivewindow 2> /dev/null; do true; done
    FOCUSID=$(printf 0x0%x "$(xdotool getactivewindow)")
    # call opacify function
    opacify_windows "$FOCUSID" "$INITID"
    # if change was a change in focus kill the xprop -spy process and restart loop
    if [ "$INITID" != "$FOCUSID" ]; then
     pkill -P $$ xprop
     break
    fi
  done
done
