#!/usr/bin/env bash

if (($# == 0)); then
    echo "Usage: jonwin-launch-or-focus-webapp [window-pattern] [url-and-flags...]"
    exit 1
fi

WINDOW_PATTERN="$1"
shift
LAUNCH_COMMAND="jonwin-launch-webapp $*"

exec jonwin-launch-or-focus "$WINDOW_PATTERN" "$LAUNCH_COMMAND"
