#!/bin/bash

yay -S pulseaudio-alsa pavucontrol alsa-utils alsa-plugins alsa-firmware

# volume control on bspwm using sxhkd
# ALSA
#
#XF86AudioMute
#    amixer set Master toggle
#
#XF86AudioLowerVolume
#    amixer set Master 5%-
#
#XF86AudioRaiseVolume
#    amixer set Master 5%+
