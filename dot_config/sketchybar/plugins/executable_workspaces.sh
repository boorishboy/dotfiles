#!/usr/bin/env bash

# Events update immediately; polling also recovers after AeroSpace restarts.
focused="${FOCUSED_WORKSPACE:-}"
if [ -z "$focused" ]; then
  focused=$(aerospace list-workspaces --focused 2>/dev/null) || exit 0
fi

args=()
workspaces=$( { printf '%s\n' {1..9}; aerospace list-workspaces --all 2>/dev/null; } | sort -nu)
for sid in $workspaces; do
  if [ "$sid" = "$focused" ]; then
    args+=(--set "workspace.$sid" icon.highlight=on
      background.color=0xff7aa2f7 background.drawing=on)
  else
    args+=(--set "workspace.$sid" icon.highlight=off
      background.color=0x00000000 background.drawing=off)
  fi
done
sketchybar "${args[@]}"
