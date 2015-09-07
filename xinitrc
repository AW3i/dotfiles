#!/bin/sh

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
exec ck-launch-session dbus-launch --exit-with-session i3
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
