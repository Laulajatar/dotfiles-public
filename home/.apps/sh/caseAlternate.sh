#!/bin/bash 
read -p "Enter string: " stringToChange
echo "$stringToChange" | sed -r "s/([a-z])([^a-z]*.?)/\u\1\l\2/gi" | xclip -selection clipboard
echo "$stringToChange" | sed -r "s/([a-z])([^a-z]*.?)/\u\1\l\2/gi"
