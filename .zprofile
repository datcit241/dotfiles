# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

export EDITOR="nvim"

export PATH=$PATH:$HOME/.local/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH=$PATH:/home/dunix/.nvm/versions/node/v20.18.1/bin

export DOTNET_ROOT="$HOME/.dotnet"
export PATH="$PATH:$DOTNET_ROOT"

export PATH=$PATH:/usr/local/go/bin

export GRADLE_HOME=/opt/gradle/gradle-8.9
export PATH=${GRADLE_HOME}/bin:${PATH}

export PATH=$PATH:/usr/local/texlive/2024/bin/x86_64-linux

# pnpm
export PNPM_HOME="/home/dunix/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

printenv > /tmp/environment_variables.txt
