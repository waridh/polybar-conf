#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
# polybar-msg cmd quit
# Otherwise you can use the nuclear option:
killall -q polybar

echo "---" | tee -a /tmp/polybar1.log
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload --config="$HOME/.config/polybar/config" bar1 2>&1 | tee -a /tmp/polybar1.log &
  done
else
  polybar --reload --config="$HOME/.config/polybar/config" bar1 2>&1 | tee -a /tmp/polybar1.log &
fi

echo "Bars launched..."
