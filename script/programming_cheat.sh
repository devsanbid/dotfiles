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
    # Directly read from wl-paste into the file
    temp_content=$(mktemp)
    clipboard_content=$(wl-paste)
    clipboard_content+="
You're an expert Python programmer.

You come across a Python code snippet with errors such as incorrect indentation and syntax mistakes, like missing quotation marks. Your task is to correct these syntax and indentation errors without changing the logic, optimizing, or refactoring the code. You're requested to provide only the corrected code without any explanation. Ensure that you only correct the indentation and syntax, not anything else, even if it results in a Runtime Error. 
Like your are doing OCR and fixing incorrect indentation and syntax only"
    echo $clipboard_content | ollama run gemma2:latest 2>/dev/null | sed 's/``.*//g' | sed 's/<|res.*//g' > "$HOME/Desktop/demo.py"

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

