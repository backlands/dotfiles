# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Modified Script for Google Search
# Original Submitted by https://github.com/LeventKaanOguz

# Opens rofi in dmenu mod and waits for input. Then pushes the input to the query of the URL.
#

rofi_config="$HOME/.config/rofi/themes/appsmenu.rasi"

echo "" | rofi -no-lazy-grab -dmenu -config "$rofi_config" -p "Search:" | xargs -I{} xdg-open https://www.duckduckgo.com/search?q={}
