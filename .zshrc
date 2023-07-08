source ~/zsh-snap/znap.zsh
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
# ZSH_THEME="bullet-train"
# ZSH_THEME="cobalt2"
# ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="powerlevel10k/powerlevel10k"

# POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir newline vcs)
# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="↱"
# POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="↳ "
# POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
# POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\uE0B1'
# POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\uE0B3'

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(
  git
  bundler
  dotenv
  rake
  rbenv
  npm
  zsh-autosuggestions
  docker
  zsh-syntax-highlighting
  iterm2
)

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
znap source marlonrichert/zsh-autocomplete


source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# source ~/powerlevel10k/powerlevel10k.zsh-theme

source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Set zsh to run oh-my-posh
# eval "$(oh-my-posh init zsh --config ~/.poshthemes/dracula.omp.json)"

# pnpm
export PNPM_HOME="/home/datvo/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# mongodb
export PATH=$PATH:/usr/local/mongodb/bin

alias cl=clear

export CAPACITOR_ANDROID_STUDIO_PATH=/snap/android-studio/current/android-studio/bin/studio.sh
alias android=/snap/android-studio/current/android-studio/bin/studio.sh
alias ij=/snap/intellij-idea-ultimate/current/bin/idea.sh
alias ws=/snap/webstorm/current/bin/webstorm.sh
alias rd=/snap/rider/current/bin/rider.sh
alias ju="cd /home/datvo/Downloads/Programs/Monitor/Debug/"
export PATH=$PATH:~/.dotnet/tools

# config neovide
export LUNARVIM_CONFIG_DIR="${LUNARVIM_CONFIG_DIR:-$HOME/.config/lvim}"
export LUNARVIM_RUNTIME_DIR="${LUNARVIM_RUNTIME_DIR:-$HOME/.local/share/lunarvim}"
export LUNARVIM_CACHE_DIR="${LUNARVIM_CACHE_DIR:-$HOME/.cache/lvim}"
# alias neo='~/neovide -- -u "$LUNARVIM_RUNTIME_DIR/lvim/init.lua" "$@"'
export OPENAI_API_KEY="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"
# alias neo="~/neovide -- -u ~/.local/share/lunarvim/lvim/init.lua --cmd 'set runtimepath+=~/.local/share/lunarvim/lvim'"

# ln -s ~/.local/share/lunarvim/lvim ~/.config/nvim
#!/usr/bin/env bash

# export NVIM_APPNAME="${NVIM_APPNAME:-"lvim"}"
# export LUNARVIM_BASE_DIR="/root/.local/share/$NVIM_APPNAME/core"

# alias nvim = 'nvim -u "$LUNARVIM_BASE_DIR/init.lua" "$@"'

alias lazy="NVIM_APPNAME=LazyVim nvim"
alias kickstart="NVIM_APPNAME=Kickstart nvim"
alias nvchad="NVIM_APPNAME=NvChad nvim"
alias astro="NVIM_APPNAME=AstroNvim nvim"

PATH=$PATH:$HOME/.local/share/bob/nvim-bin
#a alias nvim=$HOME/.local/share/bob/nvim-bin/nvim

function nvims() {
  items=("default" "Kickstart" "LazyVim" "NvChad" "AstroNvim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
  echo $@
}

functions anydeskRemove() {
  sudo apt purge anydesk
  sudo apt autoclean
  sudo apt autoremove
}

function anydeskInstall() {
  sudo apt install -f
  sudo dpkg -i $HOME/Downloads/Programs/anydesk_6.2.1-1_amd64.deb
}

bindkey -s ^a "nvims\n"

# alias for lock the screen
alias lock="xdg-screensaver lock"
alias out="gnome-session-quit" $@

alias lvim="nvim -u ~/.local/share/lunarvim/lvim/init.lua"
