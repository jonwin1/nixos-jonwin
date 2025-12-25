#!/usr/bin/env bash

exec setsid uwsm-app -- ghostty \
    --class="se.jonwin.$(basename "$1")" \
    --command="$1" "${@:2}"
