#!/bin/bash
killall -q mpd
while pgrep -u $UID -x mpd >/dev/null; do sleep 1; done
echo "bye" 
shutdown now


