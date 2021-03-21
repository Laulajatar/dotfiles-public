#!/bin/bash
for (( i=0; i<120; ++i)); do
    xmacroplay -d 100 :0.0 < ~/deltest.txt
    sleep 1
done
