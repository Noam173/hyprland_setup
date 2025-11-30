#!/usr/bin/env bash

# main.py has a shbeng line (#!/usr/bin/env python) and the neccesary permissions so it can be run ./main.py

# run:

cd $(find $HOME -name "hyprland_setup")

uvx pyinstaller hyprland_setup.py \
 --add-data "stuff:stuff" \
 --onefile \
 --distpath "$HOME"

rm -rf build/ hyprland_setup.spec

cd $HOME
