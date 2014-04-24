#!/bin/bash

while [ 1 == 1 ]; do
    current_window=`xdotool getwindowfocus`
    current_window_class=`xprop -id $((current_window)) WM_CLASS`
    if [[ $current_window_class == *google-chrome* ]]
    then
        echo -e "chrome"
        xdotool key --clearmodifiers control+shift+F11
    else
        echo -e "! chrome"
        xdotool key --clearmodifiers control+shift+F12
    fi
    sleep 1
done
