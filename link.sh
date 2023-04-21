#!/bin/bash

links=(
  ".local/share/lunarvim/lvim"
  ".config/nvim"
  ".config/NvChad"
  ".config/Kickstart"
  ".config/AstroNvim"
  ".config/LazyVim"
  ".config/Code/User/settings.json"
  ".zshrc"
  ".ideavimrc"
  ".vscode.css"
)

for link in ${links[@]}; do
  ln -s "$PWD/$link" "$HOME/${link%/*}"
  # echo "ln -s $PWD/$link $HOME/${link%/*}"
done
