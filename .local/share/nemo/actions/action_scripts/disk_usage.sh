#!/bin/bash
for DIR in "$@"; do
  if [ -L "$DIR" ]; then
    if zenity --question --icon-name=dialog-question --no-wrap --text="One of your selections is a symlink.\n\nDo you want to include the disk usage of symlinked files and directories?"; then
      zenity --info --no-wrap --title="Disk Usage (Inc. Symlinks)" --text="Combined Disk Usage of\n\n$(printf '%s\n' "$@")\n\n$(du -Lhc "$@" | tail -n1 | cut -d '	' -f 1)"
      exit
    else
      break
    fi
  fi
done
zenity --info --no-wrap --title="Disk Usage" --text="Combined Disk Usage of\n\n$(printf '%s\n' "$@")\n\n$(du -hc "$@" | tail -n1 | cut -d '	' -f 1)"


