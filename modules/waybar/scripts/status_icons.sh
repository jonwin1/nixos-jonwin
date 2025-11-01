#!/usr/bin/env bash

OUT=""

if pgrep -x hypridle >/dev/null; then
  OUT+="  " 
fi

echo "$OUT"
