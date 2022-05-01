#!/bin/bash
CONFIRM=false
SUCCESSSTRING="Successfully deleted:"
export SUDO_ASKPASS="$HOME/.local/share/nemo/actions/action_scripts/zenity_askpass.sh"
for i in "$@"; do
#Is directory writeable?
  if [ ! -w "$(dirname "$i")" ]; then
    if ( ! $CONFIRM ); then
      if zenity --question --icon-name=dialog-warning --width=250 --default-cancel --title="Please confirm deletion" --text="This action cannot be undone!\n\nDelete $# files/directories?"; then
        CONFIRM=true
        sudo -A rm -r "$i"
      else
        exit 1
      fi
    else
      sudo -A rm -r "$i"
    fi
  else
    if ( ! $CONFIRM ); then
      if zenity --question --icon-name=dialog-warning --width=250 --default-cancel --title="Please confirm deletion" --text="This action cannot be undone!\n\nDelete $# files/directories?"; then
        CONFIRM=true
        rm -r "$i"
      else
        exit 1
      fi
    else
      rm -r "$i"
    fi 
  fi
  if [ $? = 1 ]; then
    zenity --warning --width=250 --text="Error deleting $i\n\nOperation aborted."
    exit 1
  else
    SUCCESSSTRING+="
    $i"
  fi
done
notify-send "$SUCCESSSTRING"
