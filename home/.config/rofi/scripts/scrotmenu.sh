#!/bin/bash

rofi_command="rofi -theme themes/scrotmenu.rasi -p Screenshot -mesg Screenshot -no-show-icons"

### Options ###
screen=""
area=""
window=""
# Variable passed to rofi
options="$screen\n$area\n$window"

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "Screenshot:" \
		-mesg "Screenshot:" \
		-theme $HOME/.config/rofi/themes/powermenu.rasi
}

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

