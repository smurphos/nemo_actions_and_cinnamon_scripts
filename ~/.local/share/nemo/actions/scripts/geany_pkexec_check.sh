#!/bin/dash
if ls -l "$1" | grep -q $USER; then
	geany "$1"
else
	pkexec geany "$1"
fi
