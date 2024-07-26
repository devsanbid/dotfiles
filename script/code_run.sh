#!/usr/bin/bash

temp_screenshot=$(mktemp --suffix=.png)

get_screenshot_text() {
    if ! grim -g "$(slurp -b 00000000 -c 00000000)" "$temp_screenshot"; then
        echo "Screenshot capture failed." >&2 
        rm "$temp_screenshot"  
        exit 1  
    fi

}

get_ai_response() {
    temp_response=/home/sanbid/Desktop/demo.py
    python /home/sanbid/ai/phi-vision/phi3v.py -m /home/sanbid/ai/phi-vision/cpu-int4-rtn-block-32-acc-level-4 -i $temp_screenshot  > $temp_response
    if [ -s "$temp_response" ]; then  
        ai_response=$(cat "$temp_response")
        cat "$temp_response" | wl-copy
        notify-send -h string:bgcolor:#FFFFFF  -h string:fgcolor:#ADACAD "." ".." -t 2000
    else
        echo "No response received from the AI." > /dev/null
    fi
}

trap 'echo "Exiting..." >&2; exit 1' INT

get_screenshot_text || exit  
get_ai_response &  


