#!/bin/bash

polybar-msg cmd quit
while pgrep polybar; do sleep 1; done

for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar -c ~/.config/polybar/config.ini middle &
    MONITOR=$m polybar -c ~/.config/polybar/config.ini right &
    MONITOR=$m polybar -c ~/.config/polybar/config.ini left &
    MONITOR=$m polybar -c ~/.config/polybar/config.ini tasks &
    MONITOR=$m polybar -c ~/.config/polybar/config.ini panel &
done

if [ "$(cat ~/.config/polybar/msg)" ]; then polybar-msg hook display 2; else polybar-msg hook display 1; fi

