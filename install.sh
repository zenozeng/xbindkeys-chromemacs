type dotxbindkeys-send-message >/dev/null 2>&1 || { echo >&2 "dotxbindkeys not installed, aborting."; exit 1; }
mkdir -p ~/.dotxbindkeys/plugins/chromemacs/modes
cp -f modes/*.scm ~/.dotxbindkeys/plugins/chromemacs/modes
cp -f chromemacs-daemon ~/.dotxbindkeys/plugins/chromemacs
touch ~/.dotxbindkeys/plugins/chromemacs/config.scm
echo "xbindkeys-chromemacs installed."
