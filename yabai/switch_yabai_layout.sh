#!/usr/bin/env bash

output=$(displayplacer list)

if echo "$output" | grep -q "Contextual screen id: 2"; then
    echo "Extern skärm är inkopplad – aktiverar dual display layout"

    yabai -m config layout bsp

    # Lägg regler här för extern skärm layout
    yabai -m rule --add app="Google Chrome" space=^1
    yabai -m rule --add app="Code" space=^1

    yabai -m rule --add app="Slack" space=^2
    yabai -m rule --add app="WezTerm" space=^2

    yabai -m rule --add app="Obsidian" space=^3
    yabai -m rule --add app="Notion" space=^3

    yabai -m rule --add app="Spotify" space=^4
    yabai -m rule --add app="ChatGPT" space=^4

    # Flytta redan öppna fönster till rätt space (säkrare hantering av app-namn med mellanslag)
    yabai -m query --windows | jq -c '.[]' | while read -r window; do
      app=$(echo "$window" | jq -r '.app')
      id=$(echo "$window" | jq -r '.id')
      case "$app" in
        "Google Chrome") yabai -m window --focus $id; yabai -m window --space 1 ;;
        "Code") yabai -m window --focus $id; yabai -m window --space 1 ;;
        "Slack") yabai -m window --focus $id; yabai -m window --space 2 ;;
        "WezTerm") yabai -m window --focus $id; yabai -m window --space 2 ;;
        "Obsidian") yabai -m window --focus $id; yabai -m window --space 3 ;;
        "Notion") yabai -m window --focus $id; yabai -m window --space 3 ;;
        "Spotify") yabai -m window --focus $id; yabai -m window --space 4 ;;
        "ChatGPT") yabai -m window --focus $id; yabai -m window --space 4 ;;
      esac
    done

    sketchybar --trigger display_external_connected
else
    echo "Endast intern skärm – återgår till single display layout"

    yabai -m config layout stack

    # ➕ Lägg regler här för laptop-only layout
    yabai -m rule --add app="Google Chrome" space=1
    yabai -m rule --add app="WezTerm" space=2
    yabai -m rule --add app="Code" space=3
    yabai -m rule --add app="Obsidian" space=4
    yabai -m rule --add app="Slack" space=5
    yabai -m rule --add app="ChatGPT" space=6
    yabai -m rule --add app="Spotify" space=7
    yabai -m rule --add app="Notion" space=8

    # Flytta redan öppna fönster till rätt space (säkrare hantering av app-namn med mellanslag)
    yabai -m query --windows | jq -c '.[]' | while read -r window; do
      app=$(echo "$window" | jq -r '.app')
      id=$(echo "$window" | jq -r '.id')
      case "$app" in
        "Google Chrome")
          yabai -m window --focus $id
          yabai -m window --space 1
          ;;
        "WezTerm")
          yabai -m window --focus $id
          yabai -m window --space 2
          ;;
        "Code")
          yabai -m window --focus $id
          yabai -m window --space 3
          ;;
        "Obsidian")
          yabai -m window --focus $id
          yabai -m window --space 4
          ;;
        "Slack")
          yabai -m window --focus $id
          yabai -m window --space 5
          ;;
        "ChatGPT")
          yabai -m window --focus $id
          yabai -m window --space 6
          ;;
        "Spotify")
          yabai -m window --focus $id
          yabai -m window --space 7
          ;;
        "Notion")
          yabai -m window --focus $id
          yabai -m window --space 8
          ;;
      esac
    done

    sketchybar --trigger display_laptop_only
fi