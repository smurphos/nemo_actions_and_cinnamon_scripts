#!/bin/dash
if [ "$(stat -c %U "$1")" = "$USER" ]; then
	xed "$1"
else
	xed admin://"$1"
fi
