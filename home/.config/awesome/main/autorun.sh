#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run ~/.screenlayout/default.sh

# music
run mpd
run mpDris2 # add playerctl support to mpd

# File sync software
run insync start

# wallpaper (not recommended, use awesome instead)
# run nitrogen --restore #; sleep 1; compton -b
run feh --no-fehbg --randomize --bg-fill ~/.local/share/backgrounds/Arelith/* --bg-fill ~/.local/share/backgrounds/Arelith/*

# scratchpad applications
run keepassxc
run keepassxc-proxy
run slack

# Default screen configuration
# run $HOME/.screenlayout/default.sh

# compositor
run picom

# network manager
run nm-applet

# package manager tray
run pamac-tray

# redshift
# run redshift

# auth
# run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
