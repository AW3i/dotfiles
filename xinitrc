#!/bin/sh
keychain ~/.ssh/id_dsa
[ -f ~/.keychain/$HOSTNAME-sh ] && . ~/.keychain/$HOSTNAME-sh 2>/dev/null
[ -f ~/.keychain/$HOSTNAME-sh-gpg ] && . ~/.keychain/$HOSTNAME-sh-gpg 2>/dev/null

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
exec ck-launch-session dbus-launch --exit-with-session i3
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
