#!/usr/bin/env bash

if pgrep -x hypridle >/dev/null; then
    systemctl --user stop hypridle.service
    notify-send "Idle Inhibitor" "Enabled"
else
    systemctl --user start hypridle.service
    notify-send "Idle Inhibitor" "Disabled"
fi
