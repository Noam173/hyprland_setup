#!/usr/bin/env bash
neccesary() {
    sudo chown -R $USER:$USER ~/.config
    paru -S nano uv waybar firefox --noconfirm

    paru -S pipewire-pulse pavucontrol --noconfirm
    sudo systemctl enable pipewire-pulse --now
    scripts
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
    echo "$files"
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
}


paru_install
neccesary
git_cred
zed_install
clearSource


rm -rf "$HOME/tmp"
echo "reboot? [Y/n]"
read -r ans
if [[ "$ans" != "n" && "$ans" != "N" ]]; then

reboot

fi
