#!/usr/bin/env bash

# Adapted from omarchy-cmd-audio-switch to work with wpctl
# https://github.com/basecamp/omarchy/blob/1e859d37cb7fef6ac687442dc1fe515d01d1302d/bin/omarchy-cmd-audio-switch#L9

# List of output names
mapfile -t sinks < <(wpctl status \
  | awk '/Sinks:/{flag=1;next}/Sources:/{flag=0}flag' \
  | grep -oE '[0-9]+\. .+?\[' \
  | sed 's/\.$//; s/\[//; s/ *$//' \
  | awk '{$1=""; print substr($0,2)}')

# List of output ids
mapfile -t sink_ids < <(wpctl status \
  | awk '/Sinks:/{flag=1;next}/Sources:/{flag=0}flag' \
  | grep -oE '[0-9]+\. ' \
  | tr -d '. ')

current_sink_id=$(wpctl status \
  | awk '/Sinks:/{flag=1;next}/Sources:/{flag=0}flag' \
  | grep '^..\s*\*' \
  | grep -oE '[0-9]+\. ' \
  | tr -d '. ')

sinks_count=${#sink_ids[@]}

if [ "$sinks_count" -eq 0 ]; then
  swayosd-client \
    --custom-message "No audio devices found"
  exit 1
fi

current_sink_index=-1
for i in "${!sink_ids[@]}"; do
  if [[ "${sink_ids[$i]}" == "$current_sink_id" ]]; then
    current_sink_index=$i
    break
  fi
done

if [ "$current_sink_index" -ge 0 ]; then
  next_sink_index=$(( (current_sink_index + 1) % sinks_count ))
else
  next_sink_index=0
fi

next_sink_id="${sink_ids[$next_sink_index]}"
next_sink_name="${sinks[$next_sink_index]}"
next_sink_volume=$(wpctl get-volume "$next_sink_id" | awk '{print int($2*100)}')
next_sink_is_muted=$(wpctl get-volume "$next_sink_id" | grep -q MUTED && echo "true" || echo "false")

if [ "$next_sink_is_muted" = "true" ] || [ "$next_sink_volume" -eq 0 ]; then
  icon_state="muted"
elif [ "$next_sink_volume" -le 33 ]; then
  icon_state="low"
elif [ "$next_sink_volume" -le 66 ]; then
  icon_state="medium"
else
  icon_state="high"
fi

next_sink_volume_icon="sink-volume-${icon_state}-symbolic"

if [ "$next_sink_id" != "$current_sink_id" ]; then
  wpctl set-default "$next_sink_id"
fi

swayosd-client \
  --custom-message "$next_sink_name" \
  --custom-icon "$next_sink_volume_icon"
