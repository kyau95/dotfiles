#!/bin/bash

while pgrep polybar; do sleep 1; done

for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
  polybar --config="~/.config/openbox/polybar/config.ini" main &
done
