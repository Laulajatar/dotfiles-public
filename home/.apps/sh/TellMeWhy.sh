#/bin/bash
killall -q antimicrox
while pgrep -u $UID -x antimicrox >/dev/null; do sleep 1; done
antimicrox --hidden --profile /home/laula/.apps/controller/TellMeWhy.gamecontroller.amgp &
steam steam://rungameid/1180660
