#!/bin/sh

function run {
  if ! pgrep $1;
  then
    $@&
  fi
}

nitrogen --restore &

run fcitx &
run picom --config $HOME/.config/picom/picom.conf --experimental-backends -b &
