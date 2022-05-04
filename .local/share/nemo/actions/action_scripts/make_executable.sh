#!/bin/bash
export SUDO_ASKPASS="$HOME/.local/share/nemo/actions/action_scripts/zenity_askpass.sh"
SUCCESSSTRING="Made executable:"
for i in "$@"; do
if [ -x "$i" ]; then
  continue
fi
#Get ownership
  OWNER=$(stat -c %U "$i")
  if [ "$OWNER" != "$USER" ] ; then
    sudo -A -u "OWNER" chmod +x "$i"
  else
    chmod +x "$i"
  fi
  if [ $? = 1 ]; then
    zenity --info --width=250 --text="Error making $i executable. Try again."
    exit 1
  else
    SUCCESSSTRING+="
    $i"
  fi
done
notify-send "$SUCCESSSTRING"
