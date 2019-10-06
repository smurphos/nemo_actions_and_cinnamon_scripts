#!/bin/dash

# Script to send persistent notification on low battery events
# Depends on zenity - apt install zenity
# Save script in ~/bin or ~/.local/bin and make executable.
# Add an entry to your startup applications.

# This script will update Cinnamon's backend power settings to base low battery warnings and actions on
# remaining battery percentage rather than time. It also updates the thresholds for the native notification 
# and actions to those set in the variables listed below.

# Low Battery Warning Level
LOW_BAT=20

# Critical Battery Warning Level
CRIT_BAT=13

# Critical Battery Action Level
CRIT_BAT_ACTION=10

# Check for existing instance and exit if already running
if pidof -o %PPID -x "${0##*/}"; then
  exit 1
fi

#Find battery
if upower -e | grep battery; then
	BATTERY=$(upower -e | grep battery)
else
	echo "Error could not find battery"
	exit 1
fi

# Update Gsettings
gsettings set org.cinnamon.settings-daemon.plugins.power use-time-for-policy false
gsettings set org.cinnamon.settings-daemon.plugins.power percentage-low "$LOW_BAT"
gsettings set org.cinnamon.settings-daemon.plugins.power percentage-critical "$CRIT_BAT";
gsettings set org.cinnamon.settings-daemon.plugins.power percentage-action "$CRIT_BAT_ACTION";

# Get Critical Battery Action from Gsettings

CRIT_ACTION=$(gsettings get org.cinnamon.settings-daemon.plugins.power critical-battery-action)

# Start loop
while true; do
STATE=$(upower -i "$BATTERY" | grep -E state|xargs|cut -d' ' -f2|sed s/%//)
if [ "$STATE" != "discharging" ]; then
    STATUS="OK"
	sleep 1m
	continue
else
	LEVEL=$(upower -i "$BATTERY" | grep -E percentage|xargs|cut -d' ' -f2|sed s/%//)
	if [ "$LEVEL" -gt "$LOW_BAT" ]; then
		STATUS="OK"
		sleep 1m
		continue
	elif [ "$LEVEL" -le "$CRIT_BAT" ] && [ "$STATUS" != "Critical" ] ; then
		zenity --warning --text="\nBattery Critically Low - $LEVEL% left.\n\nPlugin to AC as soon as possible.\n\nThe system will $CRIT_ACTION at $CRIT_BAT_ACTION%" --width=400
		STATUS="Critical"
		sleep 1m
		continue
	elif [ "$LEVEL" -le "$LOW_BAT" ] && [ "$STATUS" != "Low" ] && [ "$STATUS" != "Critical" ]; then
        zenity --warning --text="\nBattery Low - $LEVEL% left.\n\nPlugin to AC.\n\nThe System will $CRIT_ACTION at $CRIT_BAT_ACTION%" --width=400
		STATUS="Low"
		sleep 1m
		continue
	fi
fi
sleep 1m
done
