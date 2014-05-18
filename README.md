# xbindkeys-chromemacs

__Note: This repository is no longer maintained. I think use xbindkeys doing this job is very dirty and I may write another emacs keybinding for chrome using python3-keybinder later.__

Emacs keybindings for Chrome / Chromium (for Linux Users)

Version: 0.1.3 (Unstable)

## Requirements

- xbindkeys (with guile enabled)

- xdotool

- netcat-openbsd

- [dotxbindkeys](https://github.com/zenozeng/dotxbindkeys) (v0.2.2+)

## Install

```
sudo apt-get install xbindkeys xdotool netcat-openbsd
git clone https://github.com/zenozeng/dotxbindkeys.git
cd dotxbindkeys
sudo ./install.sh
cd ..
git clone https://github.com/zenozeng/xbindkeys-chromemacs.git
cd xbindkeys-chromemacs
./install.sh
```

Or simply

```
sudo apt-get install xbindkeys xdotool netcat-openbsd
curl https://raw.githubusercontent.com/zenozeng/xbindkeys-chromemacs/master/easy-install.sh | bash
```

## Usage

### Start

`dotxbindkeys start`

### Debug Mode

`dotxbindkeys debug`

### Automatically start at start up

put `dotxbindkeys start` in your ~/.profile

### Keymap

#### Basic

`C-f`: Right

`C-b`: Left

`C-n`: Down

`C-p`: Up

`C-g`: Escape

`C-d`: Delete char

`M-d`: Delete word

`M-f`: Forward word

`M-b`: Backward word

`C-a`: Move beginning of line

`C-e`: Move end of line

`C-x h`: Mark all

`C-/`: Revocation

`C-x C-c`: Close Chrome

#### Cut, Copy & Paste

`C-w`: Cut

`M-w`: Copy

`C-y`: Paste

#### Tabs

`C-x k`: Kill tab

`C-x C-r`: Refresh

`C-x r`: Reopen last tab closed (Up to 10 tabs)

`C-t`: New Tab

#### ido-tab Mode (Early Release)

`C-x b`: Enter ido-tab mode

`C-s`: Next Tab

`C-r`: Prev Tab

`C-g`: Exit ido-tab mode

#### Url

`C-l`: Focus on the address bar

#### Search

`C-s`: Search Forward

`C-r`: Search Backward

`C-g`: Exit Search

## FAQ

### Gtk-key-theme?

`gsettings set org.gnome.desktop.interface gtk-key-theme "Default"`

## Ref

- http://askubuntu.com/questions/97213/application-specific-key-combination-remapping

- http://community.schemewiki.org/?guile-asyncs-batch-processing

- https://www.gnu.org/software/guile/docs/docs-1.6/guile-ref/Asyncs.html

- https://www.gnu.org/software/guile/manual/html_node/System-asyncs.html

- http://en.wikipedia.org/wiki/Table\_of\_keyboard_shortcuts
