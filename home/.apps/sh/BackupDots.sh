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
    find $1 -type f -name "$2" -exec sh -c '\
        file=$(readlink -f "{}") \
        && if [[ $file != *"Session.vim" ]]; then dest='"$backupPath$pathAdd"'${file#*$HOME} \
        && if [[ -f "$dest" ]]; then if [[ $file -nt $dest ]]; \
        then echo -e "\033[0;33mChanged file:\033[0m $file \033[0;33m->\033[0m $dest" ; fi; \
        else echo -e "\033[0;33mNew file:\033[0m $file \033[0;33m->\033[0m $dest"; fi \
        && mkdir -p $(dirname $dest) \
        && cp -u "$file" "$dest"; fi' \
        \;
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

read -p "What kind of backup do you want to make? [(f)ull, (p)ublic, (a)bort] " -n 1 -r

echo
echo

if [[ $REPLY =~ ^[fF]$ ]]; then
    backupType="full"
    echo -e "Backup type: ${yellow}Full${none}"
    backupPath="$HOME/Dropbox/Linux/dotfiles"
elif [[ $REPLY =~ ^[pP]$ ]]; then
    backupType="public"
    echo -e "Backup type: ${yellow}Public${none}"
    backupPath="$HOME/Dropbox/Linux/dotfiles-public"
else
    echo "Exiting..."
    exit
fi       

echo
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


# xfce config keeps changing, don't include it always to keep commits cleaner
echo
read -p "Do you want to backup volatile config files like xfce, krita, mgba [(y)es, (n)o, (a)bort] " -n 1 -r
echo
echo

if [[ $REPLY =~ ^[yY]$ ]]; then
    echo -e "Backing up volatile config files: ${yellow}Yes${none}"
    backupXfce="true"
elif [[ $REPLY =~ ^[nN]$ ]]; then
    echo -e "Backing up volatile config files: ${yellow}No${none}"
    backupXfce="false"
else
    echo "Exiting..."
    exit
fi       

echo

# }}}

# Public stuff {{{

# Stuff in home
pathAdd=/home

echo -e "\n${blue}polybar configs${none}"

dir=~/.config/polybar
files="*"
findFiles "$dir" "$files"


echo -e "\n${blue}neovim configs${none}"

dir=~/.config/nvim
files="*"
findFiles "$dir" "$files"


echo -e "\n${blue}kitty configs${none}"

dir=~/.config/kitty
files="*"
findFiles "$dir" "$files"


echo -e "\n${blue}font config${none}"

dir=~/.config/fontconfig
files="*"
findFiles "$dir" "$files"


echo -e "\n${blue}music player stuff${none}"

dir=~/.config/mpd
files="*"
findFiles "$dir" "$files"
dir=~/.config/ncmpcpp
files="*"
findFiles "$dir" "$files"
dir=~/.config/vis
files="config"
findFiles "$dir" "$files"
dir=~/.config/vis/colors
files="*"
findFiles "$dir" "$files"



# These don't really contain anything useful but I believe they need to exist or mpd/ncmpcpp complain
# No point making them public
if [[ $backupType == "full" ]]; then
    dir=~/.mpd/playlists
    files="*"
    findFiles "$dir" "$files"
    dir=~/.ncmpcpp
    files="*"
    findFiles "$dir" "$files"
fi


# Only back up xfce (and some others) if explicitly asked or it will change every time
if [[ $backupXfce == "true" ]]; then
    echo -e "\n${blue}xfce config${none}"

    dir=~/.config/xfce4
    files="*"
    findFiles "$dir" "$files"

    echo -e "\n${blue}misc app configs${none}"

    dir=~/.config/mgba
    files="*"
    findFiles "$dir" "$files"
     
    dir=~/.config/galculator
    files="*"
    findFiles "$dir" "$files"

    if [[ $backupType == "full" ]]; then
      
        echo -e "\n${blue}krita configs and stuff${none}"

        dir=~/.config
        files="krita*"
        findFiles "$dir" "$files"
        dir=~/.local/share/krita
        files="*"
        findFiles "$dir" "$files"

        dir=~/.config/calibre
        files="*"
        findFiles "$dir" "$files"

    fi
fi


echo -e "\n${blue}neofetch config${none}"

dir=~/.config/neofetch
files="*"
findFiles "$dir" "$files"


# Not sure if keeping public, leave it for now
echo -e "\n${blue}redshift config${none}"

dir=~/.config
files="redshift.conf"
findFiles "$dir" "$files"


echo -e "\n${blue}plank theme${none}"

dir=~/.local/share/plank
files="*"
findFiles "$dir" "$files"


echo -e "\n${blue}fonts, themes & wallpaper${none}"
# Themes are in ~/.themes instead of ~/.local/share/themes because 
# GTK2 themes aren't loaded from local

# We definitely shouldn't be sharing those
# Icons are way too many files and will be stored as zips in .local/share/
if [[ $backupType == "full" ]]; then
    dir=~/.local/share/fonts
    files="*"
    findFiles "$dir" "$files"
    dir=~/.themes/Arc-Steel
    files="*"
    findFiles "$dir" "$files"
    dir=~/.themes/2bxfwm-Moon
    files="*"
    findFiles "$dir" "$files"
    dir=~/.themes/2bxfwm-Sun
    files="*"
    findFiles "$dir" "$files"
fi

dir=~/.local/share/wallpaper
files="*"
findFiles "$dir" "$files"


# Startpage currently is not stored outside repo because why would it
dir=~/.local/share/startpage
files="*"


# Stuff in the .apps directories
# Full gets all of them
# Public only gets sh and g810-led, and perhaps macros
echo -e "\n${blue}scripts and macros${none}"

if [[ $backupType == "full" ]]; then
    dir=~/.apps
    files="*"
    findFiles "$dir" "$files" 
else
    dir=~/.apps/sh
    files="*"
    findFiles "$dir" "$files"   
    dir=~/.apps/g810-led
    files="*"
    findFiles "$dir" "$files"
    dir=~/.apps/macros
    files="*"
    findFiles "$dir" "$files"
fi


echo -e "\n${blue}devilspie rules${none}"

dir=~/.devilspie
files="*"
findFiles "$dir" "$files"


echo -e "\n${blue}shell configs in home${none}"

dir=~/
files=".zshaliasrc"
findFiles "$dir" "$files"
files=".zshrc"
findFiles "$dir" "$files"
files=".bashrc"
findFiles "$dir" "$files"
files=".p10k.zsh"
findFiles "$dir" "$files"



# Some personal things that won't get pulled into public like 
# KDEconnect and stuff

if [[ $backupType == "full" ]]; then

    echo -e "\n${blue}personal app configs (calibre etc)${none}"

    dir=~/.config/kdeconnect
    files="*"
    findFiles "$dir" "$files"

    dir=~/.config/melonDS
    files="*"
    findFiles "$dir" "$files"
    
    dir=~/.local/share/onboard
    files="*"
    findFiles "$dir" "$files"

fi


#Stuff not in home, no need to add path because nothing gets removed
pathAdd=

echo -e "\n${blue}g810-led configs${none}"

dir=/etc/g810-led
files="profile"
findFiles "$dir" "$files"

dir=/etc/udev/rules.d
files="g810-led.rules"
findFiles "$dir" "$files"



# }}}
echo -e "\n${yellow}Backup complete!${none}"

echo

# Ask about git if .git exists

if [[ -d "$backupPath/.git" ]]; then

    read -p "Do you want to commit the changes to git? [(y)es, (n)o] " -n 1 -r
    echo
    echo

    if [[ $REPLY =~ ^[yY]$ ]]; then
        cd "$backupPath"
        git add -A
        git commit
    else
        echo -e "Not committing the changes."
    fi
    echo
fi

echo -e "${yellow}Thanks for stopping by! Bye.${none}" 
echo
