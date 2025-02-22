#!/bin/sh

# Install zsh and necessary plugins
sudo pacman -S zsh-autosuggestions zsh-syntax-highlighting zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Clone zsh plugins
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git "$ZSH_CUSTOM/plugins/fast-syntax-highlighting"
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git "$ZSH_CUSTOM/plugins/zsh-autocomplete"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"

# Install TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
