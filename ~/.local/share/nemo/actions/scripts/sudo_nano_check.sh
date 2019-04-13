#!/bin/dash
if ls -l "$1" | grep -q $USER; then
	nano "$1"
else
	sudo nano "$1"
fi
