main.py has a shbeng line (#!/usr/bin/env python) and the neccesary permissions so it can be run ./main.py
I'm gonna try to implement paru install in the future
run:
uvx pyinstaller main.py \
  --add-data "stuff:stuff" \
  --distpath "$HOME"
