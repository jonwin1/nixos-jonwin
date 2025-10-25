#!/usr/bin/env bash
set -euo pipefail

# Get info for main drive (for color state)
read total used percent _ < <(df -h --output=size,used,pcent "/" | tail -n1)
percent_num=${percent%\%} # remove trailing %

# Gather all relevant disks, excluding tmpfs/devtmpfs/overlay/squashfs
mapfile -t lines < <(df -h --output=target,used,size,pcent -x tmpfs -x devtmpfs -x overlay -x squashfs | tail -n +2)

# Filter out mounts
EXCLUDE_REGEX='^/(sys|dev|run|proc|tmp|boot|efi|snap|var/lib/docker|var/snap)(/|$)'

tooltip=""
for line in "${lines[@]}"; do
  read -r path used total percent <<<"$line"
  if [[ ! "$path" =~ $EXCLUDE_REGEX ]]; then
    tooltip+="${path}: ${used}/${total} (${percent})\\n"
  fi
done

# Remove trailing newline escape
tooltip=${tooltip%\\n}

# Determine state (low, medium, high)
if   (( percent_num >= 90 )); then state="high"
elif (( percent_num >= 80 )); then state="medium"
elif (( percent_num >= 70 )); then state="low"
else state="normal"; fi

# Escape double quotes in tooltip just in case
tooltip=${tooltip//\"/\\\"}

# Output JSON for Waybar
printf '{"text":"󰋊","tooltip":"%s","class":"%s"}\n' "$tooltip" "$state"
