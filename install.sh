#!/usr/bin/env bash

DOTFILES_DIR="$HOME/dotfiles"

echo "🔗 Symlinking dotfiles..."

ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
ln -sfn "$DOTFILES_DIR/sketchybar" "$HOME/.config/sketchybar"
ln -sfn "$DOTFILES_DIR/lazyvim" "$HOME/.config/nvim"
ln -sfn "$DOTFILES_DIR/wezterm" "$HOME/.config/wezterm"
ln -sfn "$DOTFILES_DIR/aerospace/aerospace.toml" "$HOME/.config/aerospace/aerospace.toml"

echo "✅ Done!"
