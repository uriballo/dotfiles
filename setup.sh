#! /usr/bin/env zsh

# Mandatori packages
[ ! -x "$(command -v stow)" ] && echo "ERROR: stow is not installed in the system" && exit -1

NVIM_CONFIG="$HOME/.config/nvim"

# Clone nvchad
[ ! -d "$NVIM_CONFIG" ] && git clone https://github.com/NvChad/NvChad "$NVIM_CONFIG" --depth 1

# Stow the custom folder of nvchad
stow -vR nvim

