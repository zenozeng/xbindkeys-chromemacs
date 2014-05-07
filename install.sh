type dotxbindkeys-send-message >/dev/null 2>&1 || {
    echo >&2 "dotxbindkeys not installed, aborting."; exit 1;
}
mkdir -p ~/.dotxbindkeys/plugins/chromemacs/modes
cp -f modes/*.scm ~/.dotxbindkeys/plugins/chromemacs/modes
cp -f chromemacs-daemon chromemacs.scm ~/.dotxbindkeys/plugins/chromemacs
set_mark_key="control space"
if [ ! -f ~/.dotxbindkeys/plugins/chromemacs/config.scm ]; then
    type fcitx >/dev/null 2>&1 && {
        echo "Seems that you have fcitx installed"
        echo "Use which key as set mark key?"
        echo "1) control space"
        echo "2) shift space"
        echo "3) other"
        read opt
        if [ "$opt" -eq "2" ]; then
            set_mark_key="shift space"
        fi
        if [ "$opt" -eq "3" ]; then
            echo "Your key for set-mark-command: (eg. control space)"
            read set_mark_key
        fi
        cmd="(set! chromemacs-set-mark-key '($set_mark_key))"
        echo $cmd
    }
    echo $cmd > ~/.dotxbindkeys/plugins/chromemacs/config.scm
fi
echo "xbindkeys-chromemacs installed."
echo "Now you can start xbindkeys-chromemacs with \"dotxbindkeys start\""
