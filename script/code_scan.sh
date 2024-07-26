#!/bin/bash

get_screenshot_text() {
    temp_screenshot=$(mktemp --suffix=.png)
    if ! grim -g "$(slurp -b 00000000 -c 00000000)" "$temp_screenshot"; then
        echo "Screenshot capture failed." >&2
        rm "$temp_screenshot"
        exit 1
    fi
    tesseract -l eng "$temp_screenshot" - --oem 1 --psm 6 -c preserve_interword_spaces=1 | wl-copy
    rm "$temp_screenshot"
}

get_ai_response() {
    clipboard_content=$(wl-paste)
    echo "$clipboard_content" | sed 's/"/'\''/g' | sed "s/’/'/g" | sed "s/1st/lst/g" | sed "s/‘/'/g" | sed "s/“/'/g" > "$HOME/Desktop/demo.py"

    if [ -s "$HOME/Desktop/demo.py" ]; then
        ai_response=$(cat "$HOME/Desktop/demo.py")
        wl-copy < "$HOME/Desktop/demo.py" # Copy directly from the file
        notify-send -h string:bgcolor:#FFFFFF -h string:fgcolor:#ADACAD "." "..." -t 2500
    else
        echo "No response received from the AI." >&2
    fi
}

trap 'echo "Exiting..." >&2; exit 1' INT

get_screenshot_text || exit
get_ai_response & 


