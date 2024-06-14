#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Clipboard Manager. This script uses cliphist, rofi, and wl-copy.

# Actions:
# CTRL Del to delete an entry
# ALT Del to wipe clipboard contents

while true; do
    result=$(
        rofi -no-lazy-grab \
            -dmenu \
            -kb-custom-1 "Control-Delete" \
            -kb-custom-2 "Alt-Delete" \
            -theme ~/.config/rofi/themes/appsmenu.rasi < <(cliphist list)
    )

    case "$?" in
        1)
            exit
            ;;
        0)
            case "$result" in
                "")
                    continue
                    ;;
                *)
                    cliphist decode <<<"$result" | wl-copy
                    exit
                    ;;
            esac
            ;;
        10)
            cliphist delete <<<"$result"
            ;;
        11)
            cliphist wipe
            ;;
    esac
done
