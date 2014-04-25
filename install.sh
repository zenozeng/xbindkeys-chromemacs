type dotxbindkeys >/dev/null 2>&1 || { echo >&2 "dotxbindkeys not installed, aborting."; exit 1; }
cp -i init.scm ~/.dotxbindkeys
yes | cp -f chromemacs.scm ~/.dotxbindkeys
yes | cp -f daemon.sh ~/.dotxbindkeys/bin/chromemacs-daemon
