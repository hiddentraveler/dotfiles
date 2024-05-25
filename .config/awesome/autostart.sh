#!/bin/bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}


run nextcloud &
#run albert
run nitrogen --restore &
run nm-applet &
run pamac-tray &
run numlockx on &
run setxkbmap -option caps:escape &
run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
run picom --config ~/.config/picom.conf &
run /usr/lib/xfce4/notifyd/xfce4-notifyd &
run kdeconnect-indicator &
run /usr/bin/syncthing -no-browser -no-restart &
run ibus-daemon -drxR &
nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }" &
xrandr --output HDMI-0 --brightness 0.4 &
