#!/bin/sh
#/usr/bin/picom --config /home/zeheater/.config/picom/picom.conf

# Swap Capslock and Ctrl
#setxkbmap -model thinkpad -layout us -option caps:ctrl_modifier,ctrl:swapcaps

# Capslock also as Ctrl
setxkbmap -layout us -option caps:ctrl_modifier

# Restore Capslock and Ctrl
#setxkbmap -model thinkpad -layout us -option caps:capslock,ctrl:aa_ctrl

#xrandr --output HDMI-0 --off --output eDP-1-1 --dpi 96x96 --auto
#xrandr --output HDMI-0 --off --output DP-2 --dpi 96x96 --auto
#xrandr --output HDMI-0 --dpi 96x96 --auto --right-of DP-2 --output DP-2 --dpi 96x96 --auto

onescreen="--output DP-2 --dpi 96x96 --auto --brightness 0.6"

twoscreen="--output DP-2 --dpi 96x96 --auto --brightness 0.6 --output HDMI-0 --auto --right-of DP-2 --brightness 0.6"

if [[ -n "$2" ]]; then
  if [[ "$2" == "one" ]]; then
    xrandr $onescreen
    /usr/bin/spectrwm -c ~/.spectrwmone.conf
  elif [[ "$2" == "two" ]]; then
    xrandr $twoscreen -c ~/.spectrwmtwo.conf
    /usr/bin/spectrwm
  else
    echo "Unknown parameter"
    exit 1
  fi
else
  xrandr $onescreen
  /usr/bin/spectrwm -c ~/.spectrwmone.conf
fi

#/usr/bin/jwm
