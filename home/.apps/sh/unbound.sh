#!/bin/bash
killall -q antimicrox
while pgrep -u $UID -x antimicrox >/dev/null; do sleep 1; done
antimicrox --hidden --profile /home/laula/.apps/controller/mGBA.gamecontroller.amgp &
mgba-qt /home/laula/Games/emulation/gba/PokemonUnbound.gba
killall -q antimicrox
