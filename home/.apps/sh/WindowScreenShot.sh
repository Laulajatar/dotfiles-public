#!/bin/bash
# Default Prefix
PREFIX="Screenshot"
# Timestamp format
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
# Get active window title
NAME=$(xdotool getwindowfocus getwindowname)
CLASS=$(xprop -name "$NAME" | grep WM_CLASS)

# find the name with sleep 2;NAME=dollar(xdotool getwindowfocus getwindowname);echo "dollarNAME"
case "$NAME" in
    "Morrowind") PREFIX="Morrowind" ;;
    "Oblivion") PREFIX="Oblivion" ;;
    "Guild Wars 2") PREFIX="GuildWars2" ;;
    "Guild Wars") PREFIX="GuildWars" ;;
    "Stardew"*) PREFIX="Stardew" ;;
    "Grim Dawn") PREFIX="GrimDawn" ;;
    "mGBA"*) PREFIX="Emulator-mGBA" ;;
    "Dolphin"*) PREFIX="Emulator-Dolphin" ;;
    "Tell Me Why"*) PREFIX="TellMeWhy" ;;
    *"Valheim"*) PREFIX="Valheim" ;;
    *"DRAGON QUEST"*) PREFIX="DragonQuest" ;;
    "Starbound") PREFIX="Starbound" ;;

esac

if [[ $PREFIX == "Screenshot" ]]; then
    mkdir -p "/home/laula/Pictures/Screenshots/"
    xfce4-screenshooter -w -s /home/laula/Pictures/Screenshots/"$PREFIX"_"$TIMESTAMP".png
else
    mkdir -p "/home/laula/Pictures/Screenshots/${PREFIX}/"
    xfce4-screenshooter -w -s /home/laula/Pictures/Screenshots/"$PREFIX"/"$PREFIX"_"$TIMESTAMP".png
fi

mpg123 ~/.apps/sh/beep.mp3
