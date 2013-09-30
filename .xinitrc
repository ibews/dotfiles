#!/bin/sh

# More recent X servers don't terminate on C-A-Backspace anymore.
# This enables it again.
setxkbmap "de"
setxkbmap -option terminate:ctrl_alt_bksp

# Currently, I don't use Neo. Have totally unlearned it.
# xmodmap "$HOME/res/neo_de.xmodmap"
# setxkbmap "de"

# Configure peripherals.
# "$HOME/bin/x-peripherals.sh"

# If available, load private configuration data.
[ -e "$HOME/.sh/private" ] && . "$HOME/.sh/private"

# Start Dropbox, if installed.
which dropbox >/dev/null 2>&1 && dropbox start -i &

# Start the right window manager etc. depending on the host.
case "$(hostname)" in
	*)
		WM='i3'
		;;
esac

# NVIDIA stuff
# VDPAU_NVIDIA_NO_OVERLAY=1

#gnome-session &

pulseaudio &
urxvtd &
nm-applet &

# redshift &
# dbus-launch tomboy &

xrdb -merge ~/.Xdefaults

# exec /usr/lib/gnome-settings-daemon/gnome-settings-daemon &
exec "$WM" >/dev/null
