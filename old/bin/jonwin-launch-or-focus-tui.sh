#!/usr/bin/env bash

APP_ID="se.jonwin.$(basename "$1")"
LAUNCH_COMMAND="jonwin-launch-tui $*"

exec jonwin-launch-or-focus "$APP_ID" "$LAUNCH_COMMAND"
