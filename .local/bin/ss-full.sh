#!/bin/sh

SS_DIR=~/Pictures/Screenshots
mkdir -p $SS_DIR
sleep 0.2; scrot -m "$SS_DIR/Screenshot_%Y-%m-%d_at_%H:%M.png"; notify-send "Screenshot taken!" "`date +"%H:%M %a %d %b"`"
