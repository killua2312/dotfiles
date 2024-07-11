#!/bin/bash

# ~/.config/polybar/scripts/redshift-toggle.sh

PIDFILE="/tmp/redshift.pid"

if [ -e "$PIDFILE" ]; then
    PID=$(cat "$PIDFILE")
    if ps -p $PID > /dev/null; then
        kill $PID
        rm "$PIDFILE"
        echo "Redshift turned off"
    else
        rm "$PIDFILE"
        redshift -l 55.7:12.6 -t 5700:3600 -r &
        echo $! > "$PIDFILE"
        echo "Redshift turned on"
    fi
else
    redshift -l 55.7:12.6 -t 5700:3600 -r &
    echo $! > "$PIDFILE"
    echo "Redshift turned on"
fi