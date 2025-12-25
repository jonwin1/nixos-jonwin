#!/usr/bin/env bash

exec setsid uwsm-app -- chromium --app="$1" "${@:2}"
