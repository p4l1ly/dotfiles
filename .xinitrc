#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

compton -CGb --invert-color-include 'WM_INVERSE_COLORS:8c = 1'
xrdb ~/.Xresources
feh --bg-fill ~/.background.png &
exec xmonad
