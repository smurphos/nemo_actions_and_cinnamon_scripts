#!/bin/bash
export SUDO_ASKPASS="$HOME/.local/share/nemo/actions/scripts/zenity_askpass.sh"
SUCCESSSTRING="Ownership changed to $USER:$USER:"
for i in "$@"; do
  sudo -A chown "$USER:$USER" "$i"
  if [ $? = 1 ]; then
    zenity --info --width=250 --text="Error taking ownership of $i. Try again."
    exit 1
  else
    SUCCESSSTRING+="
    $i"
  fi
done
notify-send "$SUCCESSSTRING"
