#!/usr/bin/env bash
sudo pacman -S git --noconfirm
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty* ]]; then
    file_name="server-setup.sh"
    git clone https://github.com/ChrisTitusTech/linutil
    cd linutil/core/tabs/system-setup/arch/
    . "$file_name"
fi
