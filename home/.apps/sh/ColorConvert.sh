#!/bin/bash

#Idk what I am doing

mode=$1 #rgb or gbc

red=$2
yellow=$3
blue=$4

function main {

    if [[ "$#" -ne 4 ]]; then
        >&2 echo "Not enough parameters, exiting. Expecting rgb/gbc and 4 numbers."
        exit 2
    fi


    if [ $mode = "rgb" ]; then    
        newred=$(($red * 8))
        newblue=$((blue * 8))
        newyellow=$((yellow * 8))
        
        echo "Converting to RGB mode: rgb($newred, $newyellow, $newblue)"
        echo "rgb($newred, $newyellow, $newblue)" | xclip -selection clipboard

    else
        newred=$(($red / 8))
        newblue=$((blue / 8))
        newyellow=$((yellow / 8))

        newred=$(printf "%02d" $newred)
        newyellow=$(printf "%02d" $newyellow)
        newblue=$(printf "%02d" $newblue)

        echo "Converting to GBC mode: $newred,$newyellow,$newblue" 
        echo "$newred,$newyellow,$newblue" | xclip -selection clipboard

    fi
}

main "$@"
