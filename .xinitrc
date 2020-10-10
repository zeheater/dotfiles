#!/bin/sh
#/usr/bin/picom --config /home/zeheater/.config/picom/picom.conf

# Swap Capslock and Ctrl
#setxkbmap -model thinkpad -layout us -option caps:ctrl_modifier,ctrl:swapcaps

# Capslock also as Ctrl
setxkbmap -layout us -option caps:ctrl_modifier

# Restore Capslock and Ctrl
#setxkbmap -model thinkpad -layout us -option caps:capslock,ctrl:aa_ctrl

#xrandr --output HDMI-0 --off --output eDP-1-1 --dpi 96x96 --auto
xrandr --output HDMI-0 --off --output DP-2 --dpi 96x96 --auto
/usr/bin/jwm
#/usr/bin/spectrwm
