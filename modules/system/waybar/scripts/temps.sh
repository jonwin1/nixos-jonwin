#!/usr/bin/env bash

# Get CPU package temp
# Try several common sensor labels in order
cpu_temp=$(sensors 2>/dev/null | awk '
    /Package id 0:/   {gsub(/\+|°C/, "", $4); print int($4); exit}
    /Tctl:/           {gsub(/\+|°C/, "", $2); print int($2); exit}
    /Tdie:/           {gsub(/\+|°C/, "", $2); print int($2); exit}
')

# If still empty, set to 0 (to avoid JSON error)
cpu_temp=${cpu_temp:-0}

# Get GPU temp
if command -v nvidia-smi &>/dev/null; then
    gpu_temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits | head -n1)
else
    gpu_temp=0
fi

# Get the max of the two
if (( gpu_temp > cpu_temp )); then
    max_temp=$gpu_temp
else
    max_temp=$cpu_temp
fi

# Set color and class depending on max temp
if   (( max_temp < 50 )); then
    icon=""; class="cool"
elif (( max_temp < 70 )); then
    icon=""; class="warm"
elif (( max_temp < 85 )); then
    icon=""; class="hot"
else
    icon=""; class="critical"
fi

tooltip="CPU: ${cpu_temp}°C\\nGPU: ${gpu_temp}°C"

printf '{"text":"%s","tooltip":"%s","class":"%s"}\n' \
  "$icon" "$tooltip" "$class"
