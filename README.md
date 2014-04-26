# xbindkeys-chromemacs

Emacs keybindings for Chrome / Chromium (for Linux Users)

Still coding.

## Requirements

- xbindkeys (with guile enabled)

- xdotool

- [dotxbindkeys](https://github.com/zenozeng/dotxbindkeys)

## Install

```
sudo apt-get install xbindkeys xdotool
git clone https://github.com/zenozeng/dotxbindkeys.git
cd dotxbindkeys
./install.sh
cd ..
git clone https://github.com/zenozeng/xbindkeys-chromemacs.git
cd xbindkeys-chromemacs
./install.sh
```

Or simply

```
sudo apt-get install xbindkeys xdotool
curl https://raw.githubusercontent.com/zenozeng/xbindkeys-chromemacs/master/easy-install.sh | bash
```

## Usage

### Start

`dotxbindkeys`

### Debug Mode

`dotxbindkeys -v`

### Keymap

#### Basic

`C-f`: `Right`

`C-b`: `Left`

`C-n`: `Down`

`C-p`: `Up`

`C-g`: `Escape`

`M-f`: `Forward word`

`M-b`: `Backward word`

`C-a`: `Move beginning of line`

`C-e`: `Move end of line`

`C-x h`: `Mark all`

#### Cut, Copy & Paste

`C-w`: `Cut`

`M-w`: `Copy`

`C-y`: `Paste`

#### Tab

`C-x k`: `Kill tab`

`C-x r`: `Refresh`

`C-t`: `New Tab`

#### Search

`C-s`: `Search Forward`

`C-r`: `Search Backward`

`C-g`: `Exit Search`

## FAQ

### Gtk-key-theme?

`gsettings set org.gnome.desktop.interface gtk-key-theme "Default"`

## Ref

- http://askubuntu.com/questions/97213/application-specific-key-combination-remapping

- http://www.nongnu.org/xbindkeys/xbindkeysrc.scm.html

- http://www.nongnu.org/xbindkeys/xbindkeysrc-combo.scm.html

- http://community.schemewiki.org/?guile-asyncs-batch-processing
