export PATH="${PATH}:$HOME/.local/bin"

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/?* ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# start compositor
picom -b

exec xbindkeys

exec xmonad

sh ~/.local/bin/screensaver.sh

sh ~/.local/bin/touchpad

# stalonetray
stalonetray -c ~/.config/stalonetray/stalonetrayrc-single &
