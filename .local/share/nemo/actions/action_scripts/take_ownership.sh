#!/bin/bash
export SUDO_ASKPASS="$HOME/.local/share/nemo/actions/action_scripts/zenity_askpass.sh"
SUCCESSSTRING="Ownership changed to $USER:$USER -"
COMMAND="sudo -A chown"
for i in "$@"; do
  if [ "$(stat -c %U "$i")" = "$USER" ] ; then
    continue
  fi
  if [ -d "$i" ]; then
    if zenity --question --icon-name=dialog-question --no-wrap --title="Take ownership" --text="Take ownership of directories recursively?"; then
    COMMAND="sudo -A chown -R"
    fi
    break
  fi
done
 for i in "$@"; do
  if stat -c %U "$i" | grep "$USER"; then
    continue
  fi
  eval "$COMMAND $USER:$USER '$i'"
  if [ $? = 1 ]; then
    zenity --info --width=250 --text="Error taking ownership of $i. Try again."
    exit 1
  else
    SUCCESSSTRING+="
    $i"
  fi
done
notify-send "$SUCCESSSTRING"
