type xbindkeys >/dev/null 2>&1 || { echo >&2 "xbindkeys not installed, aborting."; exit 1; }
type xdotool >/dev/null 2>&1 || { echo >&2 "xdotool not installed, aborting."; exit 1; }
type git >/dev/null 2>&1 || { echo >&2 "git not installed, aborting."; exit 1; }
cd /tmp
rm -rf xbindkeys-chromemacs-easy-install
mkdir -p xbindkeys-chromemacs-easy-install
cd xbindkeys-chromemacs-easy-install
git clone https://github.com/zenozeng/dotxbindkeys.git
cd dotxbindkeys
sudo "./install.sh"
cd ..
git clone https://github.com/zenozeng/xbindkeys-chromemacs.git
cd xbindkeys-chromemacs
./install.sh
