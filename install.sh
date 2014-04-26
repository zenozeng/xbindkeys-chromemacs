type dotxbindkeys >/dev/null 2>&1 || { echo >&2 "dotxbindkeys not installed, aborting."; exit 1; }
mkdir -p ~/.dotxbindkeys/plugins/chromemacs
cp -f chromemacs.scm chromemacs-daemon ~/.dotxbindkeys/plugins/chromemacs
