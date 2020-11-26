#!/bin/sh

SS_DIR=~/Pictures/Screenshots
mkdir -p $SS_DIR
sleep 0.2; scrot -s "$SS_DIR/%Y-%m-%d-%H%M%S.png"; notify-send "Screenshot taken!" "`date +"%H:%M %a %d %b"`"
