#!/usr/bin/env bash

CURRENT_TEMP=$(hyprctl hyprsunset temperature 2>/dev/null | grep -oE '[0-9]+')

if [[ $CURRENT_TEMP == 6000 ]]; then
    hyprctl hyprsunset temperature 5000
    hyprctl hyprsunset gamma 80
    notify-send "Nightlight enabled"
else
    hyprctl hyprsunset temperature 6000
    hyprctl hyprsunset gamma 100
    notify-send "Nightlight disabled"
fi
