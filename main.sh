#!/usr/bin/env bash

cwd="$PWD"

neccesary() {
    sudo chown -R $USER:$USER ~/.config
    paru -S nano uv waybar wofi firefox --noconfirm
    paru -S hyprland xdg-desktop-portal-hyprland slurp grim wl-clipboard --noconfirm
    paru -S kitty ttf-meslo-nerd --noconfirm

    paru -S pipewire-pulse pavucontrol --noconfirm
    sudo systemctl enable pipewire-pulse --now
}

check() {
    if [[ ! -d "$HOME/tmp" ]]; then

    url="https://github.com/ChrisTitusTech/linutil"
    git clone "$url" "$HOME/tmp"

    fi
}

scripts() {
    files="$(find "$(dirname "$0")" -name 'setup*')"
    for script in $files;do
    uv run "$script"
    done
}

zed_install() {
    paru -S zed --noconfirm
    rm -rf "$HOME/.config/zed/"
    git clone https://github.com/noam173/zed "$HOME/.config/zed/"
}

git_cred() {
    if [[ ! -f "$HOME/.git-credentials" ]]; then
    echo "https://<username>:<token>@github.com" > "$HOME/.git-credentials"
    fi
    git config --global credential.helper store
}

clearSource() {
    check
    file_name='system-cleanup.sh'
    path='./core/tabs/system-setup'
    cd "$path"
    . "$file_name"
    cd "$cwd"
    if [[ -f "$HOME/.bashrc" ]]; then
    clear && source "$HOME/.bashrc"
    fi
}


paru_install() {
    check
    file_name="paru-setup.sh"
    path="$HOME/tmp/core/tabs/system-setup/arch/"
    cd "$path"
    . "$file_name"
    cd "$cwd"
}


paru_install
neccesary
scripts
git_cred
zed_install
clearSource


rm -rf "$HOME/tmp"
echo "reboot? [Y/n]"
read -r ans
if [[ "$ans" != "n" && "$ans" != "N" ]]; then

reboot

fi
