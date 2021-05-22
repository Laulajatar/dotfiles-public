#!/bin/bash

red='\033[1;31m'
yellow='\033[1;33m'
blue='\033[1;35m'
none='\033[0m'

# Vars go here

# backupPath -> no trailing /
# backupType -> full, public
# backupXfce -> true, false
# dir -> source dir 
# files -> source file types or *

# Functions go here

findFiles() {
    find "$1" -type f -name "$2" -exec sh -c '\
        file=$(readlink -f "{}") \
        && if [[ $file != *"Session.vim" ]]; then dest='"$backupPath"'/'"$pathAdd"'${file#*$HOME} \
        && if [[ -f "$dest" ]]; then if [[ $file -nt $dest ]]; \
        then echo -e "\033[0;33mFound file:\033[0m $file" ; fi; \
        else echo -e "\033[0;33mFound file:\033[0m $file"; fi \
         ; fi' \
        \;
    dest="$backupPath/$pathAdd"
    mkdir -p "$dest"
    cp -r -u "$dir" "$dest"
    }


fbacks() {
    find "$1" -type f -name "$2" -exec sh -c '\
        file=$(readlink -f "{}") \
        && if [[ $file != *"Session.vim" ]]; then dest='"$backupPath"'/'"$pathAdd"'${file#*$HOME} \
        && if [[ -f "$dest" ]]; then if [[ $file -nt $dest ]]; \
        then echo -e "\033[0;33mChanged file:\033[0m $file \033[0;33m->\033[0m $dest" ; fi; \
        else echo -e "\033[0;33mNew file:\033[0m $file \033[0;33m->\033[0m $dest"; fi \
        && temp=$(dirname "$dest") \
        && mkdir -p "$temp" \
        && cp -u "$file" "$dest"; fi' \
        \;
    dest='"$backupPath"'/'"$pathAdd"'
    mkdir -p "$dest"
    cp -r -u "$dir" "$pathAdd"
    }


# Rest goes here

# Setting up stuff {{{

clear
echo -e "${blue}"
cat << "EOF"
__          __  _                          _
\ \        / / | |                        | |
 \ \  /\  / /__| | ___ ___  _ __ ___   ___| | 
  \ \/  \/ / _ \ |/ __/ _ \| '_ ` _ \ / _ \ |
   \  /\  /  __/ | (_| (_) | | | | | |  __/_|
    \/  \/ \___|_|\___\___/|_| |_| |_|\___(_)
EOF
echo -e "${none}\n" 

backupPath="$HOME/Dropbox/Games/AutomaticBackups"

read -p "Do you want to use the default backup path $backupPath [(y)es, (n)o, (a)bort] " -n 1 -r

if [[ $REPLY =~ ^[^yYnN]$ ]]; then
    echo -e "\n\n${red}Exiting...${none}"
    exit
fi 

if [[ $REPLY =~ ^[nN]$ ]]; then
    echo
    read -p "Please enter new backup path (no / at the end):" backupPath
fi

echo 
echo
echo -e "Backup path is: ${yellow}$backupPath${none}"

echo

# }}}

# Savegames {{{

echo -e "\n${blue}emulation${none}"

pathAdd="EmulationGBA"
dir=~/Games/emulation/gba
files="*.sav"
findFiles "$dir" "$files" 

pathAdd="EmulationGC"
dir=~/.local/share/dolphin-emu/GC/
files=""
findFiles "$dir" "$files"


echo -e "\n${blue}Stardew Valley${none}"

pathAdd="StardewValley"
dir=~/.config/StardewValley/Saves
files="*"
findFiles "$dir" "$files"

echo -e "\n${blue}Valheim${none}"

pathAdd="Valheim"
dir=~/.config/unity3d/IronGate/Valheim
files="*"
findFiles "$dir" "$files"

echo -e "\n${blue}Dragon Quest${none}"

pathAdd="DragonQuest"
dir="/mnt/Games/SteamLibrary/steamapps/compatdata/1295510/pfx/drive_c/users/steamuser/My Documents/My Games/DRAGON QUEST XI S/Steam/91049462/Saved/SaveGames/"
files="*"
findFiles "$dir" "$files"

echo -e "\n${blue}Guild Wars - Templates${none}"

pathAdd="GuildWarsTemplates"
dir="/home/laula/Games/guild-wars/drive_c/users/laula/My Documents/Guild Wars/Templates/"
files="*"
findFiles "$dir" "$files"

pathAdd="GuildWars2Templates"
dir="/home/laula/Games/guild-wars-2/drive_c/Program Files/Guild Wars 2/addons/arcdps/arcdps.buildpad/"
files="*"
findFiles "$dir" "$files"

# }}}


echo -e "${yellow}Thanks for stopping by! Bye.${none}" 
echo
