#!/bin/bash
for img in *.bmp; do
    filename=${img%.*}
    convert "$filename.bmp" "$filename.png"
    rm "$filename.bmp"
done