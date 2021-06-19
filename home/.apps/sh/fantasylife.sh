#!/bin/bash
killall -q antimicrox
while pgrep -u $UID -x antimicrox >/dev/null; do sleep 1; done
antimicrox --hidden --profile /home/laula/.apps/controller/citra.gamecontroller.amgp &
lutris lutris:rungameid/19
sleep 2
while pgrep -u $UID -x citra-qt >/dev/null; do sleep 1; done
killall -q antimicrox
