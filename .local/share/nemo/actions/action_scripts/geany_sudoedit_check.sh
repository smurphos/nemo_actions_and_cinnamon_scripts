#!/bin/bash
FILEOWNER=$(stat -c %U "$1")
if [ "$FILEOWNER" = "$USER" ]; then
  geany -si "$1"
else
  export SUDO_EDITOR="geany -si"
  export SUDO_ASKPASS="$HOME/.local/share/nemo/actions/action_scripts/zenity_askpass.sh"
  sudoedit -A -u "$FILEOWNER" "$1"
fi

