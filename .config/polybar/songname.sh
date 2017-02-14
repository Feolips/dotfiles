#!/bin/sh

WINDOW_DATA=`wmctrl -l | grep "Google Play Music"`

if [ -z "$WINDOW_DATA" ]; then
	exit 1
fi

HOSTNAME=`hostname`

echo "$WINDOW_DATA" | grep -oP '(?<='"$HOSTNAME"' ).*(?= - Google Play Music)' | awk \
	-F ' - ' \
		'{
			if ($2 != "") {
				print "  " $2 " - " $1
			} else {
				print ""
			}
		}'
