export PATH="${PATH}:$HOME/.local/bin"

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/?* ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

exec bspwm

sh ~/.local/bin/screensaver.sh

sh ~/.local/bin/touchpad

