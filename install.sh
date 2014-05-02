type dotxbindkeys-send-message >/dev/null 2>&1 || { echo >&2 "dotxbindkeys not installed, aborting."; exit 1; }
mkdir -p ~/.dotxbindkeys/plugins/chromemacs/modes
cp -f modes/*.scm ~/.dotxbindkeys/plugins/chromemacs/modes
cp -f chromemacs-daemon chromemacs.scm ~/.dotxbindkeys/plugins/chromemacs
echo "(set! chromemacs-set-mark-key '(shift space))" > ~/.dotxbindkeys/plugins/chromemacs/config.scm
echo "xbindkeys-chromemacs installed."
