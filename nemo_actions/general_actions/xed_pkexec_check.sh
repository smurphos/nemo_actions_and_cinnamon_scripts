#!/bin/dash
if ls -l "$1" | grep -q $USER; then
	xed "$1"
else
	pkexec xed "$1"
fi
