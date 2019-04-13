#!/bin/dash
if ls -l "$1" | grep -q $USER; then
	xed "$1"
else
	xed admin://"$1"
fi
