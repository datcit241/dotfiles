#!/bin/bash

links=(
  ".local/share/lunarvim/lvim"
  ".config/nvim"
  ".zshrc"
  ".ideavimrc"
)

for link in ${links[@]}; do
  # ln -sr "$PWD/$link ~/$link"
  echo "ln -sr $PWD/$link $HOME/$link"
done
