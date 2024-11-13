#!/usr/bin/env sh

LABEL="$(ipconfig getsummary en0 | awk -F ' SSID : ' '/ SSID : / {print $2}')"

if [[ "$LABEL" == *"You are not associated with an AirPort network."* ]]; then
  sketchybar --set wifi label="Disconnected"
else
  LABEL=$(echo "$LABEL")
  sketchybar --set wifi label="$LABEL"
fi
