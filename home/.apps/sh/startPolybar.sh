#!/bin/bash
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1;done
polybar -c /home/laula/.config/polybar/config main & polybar -c /home/laula/.config/polybar/config second

