#!/bin/bash
# ==========================
# Dotfiles Setup Script
# ==========================

# Path to dotfiles repo
DOTFILES="$HOME/.dotfiles"

echo "Setting up dotfiles from $DOTFILES..."

# --------------------------
# Kitty
# --------------------------
mkdir -p "$HOME/.config/kitty"
ln -sf "$DOTFILES/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"

# --------------------------
# Zsh
# --------------------------
ln -sf "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/zsh/.p10k.zsh" "$HOME/.p10k.zsh"

# --------------------------
# Git
# --------------------------
#ln -sf "$DOTFILES/git/.gitconfig" "$HOME/.gitconfig"

# --------------------------
# Tmux
# --------------------------
#ln -sf "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf"

# --------------------------
# Neovim
# --------------------------
mkdir -p "$HOME/.config/nvim"
ln -sf "$DOTFILES/nvim/" "$HOME/.config/nvim/"

echo "All dotfiles linked successfully!"
