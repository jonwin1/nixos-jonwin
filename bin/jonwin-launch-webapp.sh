#!/usr/bin/env bash

exec setsid uwsm-app -- zen-beta --new-window "$1" "${@:2}"
