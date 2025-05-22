# Keybindings
# zsh home & end buttons fix
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line

zstyle ':completion:*' menu no
zstyle 'fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle 'fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

source <(fzf --zsh)
eval "$(zoxide init --cmd cd zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Load Angular CLI autocompletion.
# source <(ng completion script)

[ -f "$HOME/.cache/env/PAT.sh" ] && source "$HOME/.cache/env/PAT.sh"
