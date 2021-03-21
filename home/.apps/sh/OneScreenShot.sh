#!/bin/bash
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
xfce4-screenshooter -c -r -s /home/laula/Pictures/Screenshots/Left-"$timestamp".png &
sleep 0.5
xmacroplay < /home/laula/.apps/macros/OneScreenShot