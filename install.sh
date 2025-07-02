#!/usr/bin/env bash

DOTFILES_DIR="$HOME/dotfiles"

echo "🔗 Symlinking dotfiles..."

ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/.weztern.lua" "$HOME/.weztern.lua"
ln -sf "$DOTFILES_DIR/.starship.toml" "$HOME/.config/.starship.toml"
ln -sf "$DOTFILES_DIR/.yabairc" "$HOME/.config/.yabairc"
ln -sf "$DOTFILES_DIR/.skhdrc" "$HOME/.config/.skhdrc"
ln -sf "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
ln -sfn "$DOTFILES_DIR/sketchybar" "$HOME/.config/sketchybar"
ln -sfn "$DOTFILES_DIR/borders" "$HOME/.config/borders"
ln -sfn "$DOTFILES_DIR/lazyvim" "$HOME/.config/nvim"

echo "✅ Done!"
