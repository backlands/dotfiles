#!/bin/bash

rofi_command="rofi -theme themes/scrotmenu.rasi -no-show-icons"

### Options ###
screen=""
area=""
window=""
# Variable passed to rofi
options="$screen\n$area\n$window"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 1)"
case $chosen in
    $screen)
        sleep 1; i3-scrot
        ;;
    $area)
        i3-scrot -s
        ;;
    $window)
        sleep 1; i3-scrot -w
        ;;
esac

