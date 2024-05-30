#!/usr/bin/env sh

if [ -z "$XDG_PICTURES_DIR" ] ; then
    XDG_PICTURES_DIR="$HOME/Pictures"
fi
ScrDir=`dirname $(realpath $0)`
source $ScrDir/globalcontrol.sh
swpy_dir="$HOME/.config/swappy"
save_dir="$HOME/Documents/Screenshot/"
save_file=$(date +'%y%m%d_%Hh%Mm%Ss_screenshot.png')
temp_screenshot="/tmp/screenshot.jpg"

mkdir -p $save_dir
mkdir -p $swpy_dir
echo -e "[Default]\nsave_dir=$save_dir\nsave_filename_format=$save_file" > $swpy_dir/config

function print_error
{
cat << "EOF"
    ./screenshot.sh <action>
    ...valid actions are...
        p : print all screens
        s : snip current screen
        x : copy screenshot text
        m : print focused monitor
EOF
}

case $1 in
p)  # print all outputs
    grimblast copysave area $temp_screenshot && swappy -f $temp_screenshot ;;
x)  # drag to manually snip an area / click on a window to print it
    grimblast copysave area $temp_screenshot && tesseract -l eng $temp_screenshot - --oem 1 --psm 6 -c preserve_interword_spaces=1 | wl-copy ;;
s) grimblast copysave area $temp_screenshot && wl-copy;;
m)  # print focused monitor
    grimblast copysave outp && swappy -f $temp_screenshot ;;
*)  # invalid option
    print_error ;;
esac

rm "$temp_screenshot"

if [ -f "$save_dir/$save_file" ] ; then
    dunstify "t1" -a "saved in $save_dir" -i "$save_dir/$save_file" -r 91190 -t 2200
fi

