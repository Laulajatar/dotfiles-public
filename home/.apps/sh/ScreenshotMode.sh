#!/bin/bash
# Get active window title
NAME=$(xdotool getwindowfocus getwindowname)
CLASS=$(xprop -name "$NAME" | grep WM_CLASS)

# find the name with sleep 2;NAME=dollar(xdotool getwindowfocus getwindowname);echo "dollarNAME"
case "$NAME" in
    *"Valheim"*) 
       xmacroplay < /home/laula/.apps/macros/Valheim
        ;;
esac
