#!/bin/bash
NAME=$(xdotool getwindowfocus getwindowname);notify-send -t 2000 "$NAME"
