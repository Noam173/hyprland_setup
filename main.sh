#!/usr/bin/env bash

sudo chown -R $USER:$USER ~/.config
sudo pacman -S uv --noconfirm


files="$(find "$(dirname "$0")" -name 'setup*')"


for script in $files;do

python "$script"

done


if [[ -f "$HOME/.bashrc" ]]; then

clear && source "$HOME/.bashrc"

fi


echo the paru config was copied to .config, please install paru from linutil
echo "launch linutil? [y/N]"
read -r ans
if [[ "$ans" == "y" || "$ans" == "Y" ]]; then

curl -fsSL https://christitus.com/linux | sh

fi


if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty* ]]; then

exec hyprland

fi
