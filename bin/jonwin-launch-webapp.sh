#!/usr/bin/env bash

exec setsid uwsm-app -- zen-beta "$1" "${@:2}"
