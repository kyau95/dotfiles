#!/usr/bin/env sh

# More info : https://github.com/jaagr/polybar/wiki

# Install the following applications for polybar and icons in polybar if you are on ArcoLinuxD
# awesome-terminal-fonts
# Tip : There are other interesting fonts that provide icons like nerd-fonts-complete
# --log=error
# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

desktop=$(echo $DESKTOP_SESSION)
count=$(xrandr --query | grep " connected" | cut -d" " -f1 | wc -l)


case $desktop in

    i3|/usr/share/xsessions/i3)
    if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload mainbar-i3 -c ~/.config/polybar/config &
      done
    else
    polybar --reload mainbar-i3 -c ~/.config/polybar/config &
    fi
    # second polybar at bottom
    # if type "xrandr" > /dev/null; then
    #   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    #     MONITOR=$m polybar --reload mainbar-i3-extra -c ~/.config/polybar/config &
    #   done
    # else
    # polybar --reload mainbar-i3-extra -c ~/.config/polybar/config &
    # fi
    ;;

    bspwm|/usr/share/xsessions/bspwm)
    if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload left -c ~/.config/polybar/config &
        MONITOR=$m polybar --reload middle -c ~/.config/polybar/config &
        MONITOR=$m polybar --reload right1 -c ~/.config/polybar/config &
        MONITOR=$m polybar --reload right2 -c ~/.config/polybar/config &
      done
    else
        polybar --reload left -c ~/.config/polybar/config &
        polybar --reload middle -c ~/.config/polybar/config &
        polybar --reload right1 -c ~/.config/polybar/config &
        polybar --reload right2 -c ~/.config/polybar/config &
    fi
    # second polybar at bottom
    # if type "xrandr" > /dev/null; then
    #   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    #     MONITOR=$m polybar --reload mainbar-bspwm-extra -c ~/.config/polybar/config &
    #   done
    # else
    # polybar --reload mainbar-bspwm-extra -c ~/.config/polybar/config &
    # fi
    ;;

    herbstluftwm|/usr/share/xsessions/herbstluftwm)
    if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload mainbar-herbstluftwm -c ~/.config/polybar/config &
      done
    else
    polybar --reload mainbar-herbstluftwm -c ~/.config/polybar/config &
    fi
    # second polybar at bottom
    # if type "xrandr" > /dev/null; then
    #   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    #     MONITOR=$m polybar --reload mainbar-herbstluftwm-extra -c ~/.config/polybar/config &
    #   done
    # else
    # polybar --reload mainbar-herbstluftwm-extra -c ~/.config/polybar/config &
    # fi
    ;;

     # second polybar at bottom
     # if type "xrandr" > /dev/null; then
     #  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
     #    MONITOR=$m polybar --reload mainbar-cwm-extra -c ~/.config/polybar/config &
     #  done
     # else
     # polybar --reload mainbar-cwm-extra -c ~/.config/polybar/config &
     # fi
esac
