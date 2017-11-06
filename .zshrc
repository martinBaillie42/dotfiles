# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/martin.baillie/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# nvm install script
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# nvmrc autoswitch script
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# for adb
export ANDROID_HOME=/Users/${USER}/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools

# aliases to enable easy showing and hiding of hidden files
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# change the prompt to show user@computername, directory and git info
source /Users/${USER}/zsh-git-prompt/zshrc.sh
NEWLINE=$'\n'
PROMPT='%n@%m %~ $(git_super_status)${NEWLINE}%# '

# show directories first, then files, then links. A=all files except .. and . F=slash after directory name
# TODO ls -AFl in a variable
alias lsd='ls -AFl | grep "^d"; ls -AFl | grep "^-"; ls -AFl | grep "^l"'

# set current directory to IM2X-SHELL
alias cdi='cd ~/WebstormProjects/im2x-client/IM2X-Shell/'

alias emacs="/usr/local/Cellar/emacs/25.3/bin/emacs -nw"
