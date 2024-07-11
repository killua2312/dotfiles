#!/bin/bash

# ~/.config/polybar/scripts/redshift-status.sh

PIDFILE="/tmp/redshift.pid"

if [ -e "$PIDFILE" ]; then
    PID=$(cat "$PIDFILE")
    if ps -p $PID > /dev/null; then
        echo "%{T3}%{T-} On"
    else 
        echo "%{T3}%{T-} Off"
    fi
else
    echo "%{T3}%{T-} Off"
fi