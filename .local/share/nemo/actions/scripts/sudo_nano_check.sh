#!/bin/dash
if [ "$(stat -c %U "$1")" = "$USER" ]; then
	nano "$1"
else
	sudo nano "$1"
fi
