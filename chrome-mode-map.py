#!/usr/bin/python

import subprocess
import sys

def is_chrome():
    print "test"
    output = subprocess.check_output("xprop -id `xdotool getactivewindow` WM_CLASS", shell=True)
    return 'Google-chrome' in output

def press(key):
    subprocess.call(["xdotool", "key", "--clearmodifiers", key])

def next_line():
    press("Down")

def prev_line():
    press("Up")

def forward_char():
    press("Left")

def backward_char():
    press("Right")

mode_map = {
    "control+n": next_line,
    "control+p": prev_line,
    "control+f": forward_char,
    "control+b": backward_char
}

if len(sys.argv) < 2:
    raise Exception("Usage: chrome-mode-map <key>")
else:
    key = sys.argv[1] # [0] is the file path
    if is_chrome():
        if key in mode_map:
            mode_map[key]()
        else:
            print "Keybinding Not Found: " + key
    else:
        press(key)
        
