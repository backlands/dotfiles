#!/bin/bash

scrot /tmp/screen.png
convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png

if [[ -f /tmp/screen.png ]]
  then
    i3lock -i /tmp/screen.png
  else
    echo "Error"
fi

mpc -q pause
amixer set Master mute

rm /tmp/screen.png
