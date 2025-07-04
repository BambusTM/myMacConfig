#!/bin/bash

direction="$1"

# Get current window ID
cur_win=$(yabai -m query --windows --window | jq '.id')

# Try to focus a window in the given direction
yabai -m window --focus "$direction"
sleep 0.05

# Get new window ID
new_win=$(yabai -m query --windows --window | jq '.id')

# If focus did not change and direction is horizontal, move display focus
if [ "$cur_win" = "$new_win" ]; then
  if [ "$direction" = "east" ] || [ "$direction" = "west" ]; then
    yabai -m display --focus "$direction"
  fi
fi
