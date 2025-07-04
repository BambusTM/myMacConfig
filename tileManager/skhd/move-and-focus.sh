#!/bin/bash
direction="$1"
id=$(yabai -m query --windows --window | jq .id)
if [ -z "$id" ] || [ "$id" = "null" ]; then
  exit 0
fi
yabai -m window --display "$direction"
yabai -m display --focus "$direction"
yabai -m window --focus "$id"