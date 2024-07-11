#!/bin/bash

volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | sed 's/%//')
mute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

if [ "$mute" = "yes" ]; then
    echo "%{T3}󰝟%{T-} Muted"
else
    if [ "$volume" -eq 0 ]; then
        icon="%{T3}󰕿%{T-}"
    elif [ "$volume" -lt 50 ]; then
        icon="%{T3}󰖀%{T-}"
    else
        icon="%{T3}󰕾%{T-}"
    fi
    echo "$icon $volume%"
fi