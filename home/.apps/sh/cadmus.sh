#!/bin/bash
pactl set-card-profile 0 output:analog-stereo+input:mono-fallback
sleep 1
~/.apps/appImage/cadmus.AppImage
pactl set-card-profile 0 off
sleep 1
polybar-msg cmd restart
