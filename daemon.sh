#!/bin/bash

current_window_is_chrome=0

while [ 1 == 1 ]; do
    current_window=`xdotool getwindowfocus`
    current_window_class=`xprop -id $((current_window)) WM_CLASS`
    if [[ $current_window_class == *google-chrome* ]]
    then
        echo -e "chrome"
        if [ $current_window_is_chrome == 0 ]; then
            echo -e "send msg"
            echo "start" > /tmp/chromemacs
            xdotool key --clearmodifiers alt+shift+F12
            current_window_is_chrome=1
        fi
    else
        echo -e "! chrome"
        if [ $current_window_is_chrome == 1 ]; then
            echo -e "send msg"
            echo "stop" > /tmp/chromemacs
            xdotool key --clearmodifiers alt+shift+F12
            current_window_is_chrome=0
        fi
    fi
    sleep 1
done
