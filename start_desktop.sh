#!/usr/bin/env bash

# Start SketchyBar först
sketchybar --reload &

# Vänta 2 sekunder så baren hinner starta
sleep 2

# Starta Yabai
yabai --start-service
