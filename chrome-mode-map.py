#!/usr/bin/python

import subprocess
import sys

def alert(msg):
    from gi.repository import Gtk
    dialog = Gtk.MessageDialog(None, 0, Gtk.MessageType.INFO,
                               Gtk.ButtonsType.OK, "debug")
    dialog.format_secondary_text(msg)
    dialog.run()

alert("hello world")

def is_chrome():
    output = subprocess.check_output("xprop -id `xdotool getwindowfocus` WM_CLASS", shell=True)
    alert(output)
    return 'Google-chrome' in output

def xte(key):
    alert(key)
    subprocess.call(["xte", key])
    # subprocess.call(["xdotool", "key", "--clearmodifiers", key])

def next_line():
    xte("key XF86Down")

def prev_line():
    xte("key XF86Up")

def forward_char():
    xte("key XF86Forward")

def backward_char():
    xte("key XF86Back")

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
