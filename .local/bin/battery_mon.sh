#!/bin/dash

# Script to send persistent notification on low battery events
# Depends on zenity - apt install zenity
# Save script in ~/bin or ~/.local/bin and make executable.
# Add an entry to your startup applications.

# Check for existing instance and exit if already running
for PID in $(pgrep -f "${0##*/}"); do
    if [ "$PID" != $$ ]; then
        exit 1
    fi  
done

#Find battery
if upower -e | grep battery; then
	BATTERY=$(upower -e | grep battery)
else
	echo "Error could not find battery"
	exit 1
fi

# Start loop
while true; do
STATE=$(upower -i "$BATTERY" | grep -E state|xargs|cut -d' ' -f2|sed s/%//)
if [ "$STATE" != "discharging" ]; then
    STATUS="OK"
	sleep 1m
	continue
else
	LEVEL=$(upower -i "$BATTERY" | grep -E percentage|xargs|cut -d' ' -f2|sed s/%//)
	if [ "$LEVEL" -gt 30 ]; then
		STATUS="OK"
		sleep 1m
		continue
	elif [ "$LEVEL" -le 15 ] && [ "$STATUS" != "Critical" ] ; then
		zenity --warning --text="Battery Critically Low - $LEVEL%" --width=150
		STATUS="Critical"
		sleep 1m
		continue
	elif [ "$LEVEL" -le 30 ] && [ "$STATUS" != "Low" ] && [ "$STATUS" != "Critical" ]; then
		zenity --warning --text="Battery Low - $LEVEL%" --width=150
		STATUS="Low"
		sleep 1m
		continue
	fi
fi
sleep 1m
done
