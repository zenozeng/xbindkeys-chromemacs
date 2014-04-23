#!/bin/bash

while [ 1 == 1 ]; do
    current_window=`xdotool getwindowfocus`
    current_window_class=`xprop -id $((current_window)) WM_CLASS`
    if [[ $current_window_class == *google-chrome* ]]
    then
        echo -e "chrome"
        xbindkeys -fg xbindkeysrc.scm
        ps aux | grep xbindkeys
    else
        echo -e "! chrome"
        ps aux | grep xbindkeys | awk '{print $2}' | xargs kill -9
    fi
    sleep 1
done
