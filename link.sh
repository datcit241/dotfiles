#!/bin/bash

links=(
  ".local/share/lunarvim/lvim"
  ".config/nvim"
  ".zshrc"
  ".ideavimrc"
)

for link in ${links[@]}; do
  ln -s "$PWD/$link" "$HOME/$link"
  # echo"ln -s $PWD/$link $HOME/$link"
done
