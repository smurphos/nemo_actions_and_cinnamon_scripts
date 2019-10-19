#!/bin/bash
zenity --info --no-wrap --title="Disk Usage" --text="Combined Disk Usage of\n\n$(printf '%s\n' "$@")\n\n$(du -Lhc "$@" | tail -n1 | cut -d '	' -f 1)"
