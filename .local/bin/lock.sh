#!/usr/bin/env bash

#exec xautolock -detectsleep
#   -time 3 \
#   -notify 30 \
#   -notifier "notify-send -u critical -t 10000 -- 'LOCKING screen in 30 seconds'"

# set the icon and a temporary location for the screenshot to be stored
icon="$HOME/Themes/Icons/lock/lock-50.png"
tmpbg='/tmp/screen.png'

(( $# )) && { icon=$1; }

# take a screenshot
scrot "$tmpbg"

convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
i3lock -i "$tmpbg"
