#! /usr/bin/env bash

check() {
    if [[ ! -d "$HOME/tmp" ]]; then

    url="https://github.com/ChrisTitusTech/linutil"
    git clone "$url" "$HOME/tmp"

    fi
}
ParuInstall() {
    
    paru="$(find . -name paru-setup.sh)"
    echo "$paru"
    cd "$(dirname "$paru")"
    "./paru-setup.sh"
}

clean() {
    rm -rf "$HOME/tmp"
    cd $HOME
}
check
