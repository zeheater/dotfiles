#!/bin/sh
#/usr/bin/picom --config /home/zeheater/.config/picom/picom.conf

# Swap Capslock and Ctrl
#setxkbmap -model thinkpad -layout us -option caps:ctrl_modifier,ctrl:swapcaps

# Capslock also as Ctrl
setxkbmap -layout us -option caps:ctrl_modifier

# Restore Capslock and Ctrl
#setxkbmap -model thinkpad -layout us -option caps:capslock,ctrl:aa_ctrl

# Disable bell sound
xset b 0

# Chinese IME
export GTK_IM_MODULE='fcitx'
export QT_IM_MODULE='fcitx'
export SDL_IM_MODULE='fcitx'
export XMODIFIERS='@im=fcitx'
export GLFW_IM_MODULE='ibus kitty'

#xrandr --output HDMI-0 --off --output eDP-1-1 --dpi 96x96 --auto
#xrandr --output HDMI-0 --off --output DP-2 --dpi 96x96 --auto
#xrandr --output HDMI-0 --dpi 96x96 --auto --right-of DP-2 --output DP-2 --dpi 96x96 --auto

primary="--output eDP-1-0 --primary"
secondary="--output HDMI-0"

onescreen="$secondary --off $primary --dpi 142x142 --mode 1920x1080 --pos 0x0 --rotate normal --brightness 0.7"
#onescreen="--output DP-2 --dpi 96x96 --auto --brightness 0.8"

twoscreen="$secondary --auto --dpi 142x142 --pos 1920x0 --rotate left $primary --dpi 142x142 --mode 1920x1080 --pos 0x840"
#twoscreen="--output DP-2 --primary --dpi 96x96 --auto --brightness 0.7 --output HDMI-0 --auto --right-of DP-2 --rotate left --brightness 0.7"
#twoscreen="--output DP-2 --dpi 96x96 --auto --brightness 0.7 --output HDMI-0 --auto --right-of DP-2 --rotate left --brightness 0.7"

if [[ -n "$2" ]]; then
  if [[ "$2" == "one" ]]; then
    xrandr $onescreen
    # exec /usr/bin/spectrwm -c ~/.spectrwmone.conf
    exec /usr/bin/i3 -c ~/.config/i3/config
  elif [[ "$2" == "two" ]]; then
    xrandr $twoscreen
    # exec /usr/bin/spectrwm -c ~/.spectrwmtwo.conf
    exec /usr/bin/i3 -c ~/.config/i3/config_presentation
  elif [[ "$2" == "jwm" ]]; then
    xrandr $onescreen
    exec /usr/bin/jwm
  elif [[ "$2" == "i3" ]]; then
    xrandr $onescreen
    exec /usr/bin/i3
  else
    echo "Unknown parameter"
    exit 1
  fi
else
  xrandr $onescreen
  exec /usr/bin/i3 -c ~/.config/i3/config
fi

#/usr/bin/jwm

# Note
## use dbus-launch for flameshot gui to work correctly
