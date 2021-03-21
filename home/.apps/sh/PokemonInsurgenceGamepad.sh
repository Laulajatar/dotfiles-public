#!/usr/bin/env sh
killall -q antimicrox
while pgrep -u $UID -x antimicrox >/dev/null; do sleep 1; done
antimicrox --hidden --profile /home/laula/.apps/controller/InsurgenceXbox.gamecontroller.amgp &
lutris lutris:rungameid/3