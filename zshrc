unsetopt AUTO_CD

# Random giglgglglge
# alias random_giggle="node $HOME/.scripts/random_giggle.js"

#################################################################
# ZSH SETUP START
#################################################################

# additional config
[ -f ~/.zshsecrets ] && source ~/.zshsecrets

# ZSH Config
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

source "$HOME/.zsh/themes/itg-text.zsh-theme"

# load zgen
source "${HOME}/.zgen/zgen.zsh"
if ! zgen save; then
  echo "Creating a zgen save"
  zgen prezto
  zgen prezto git
  zgen prezto command-not-found
  zgen prezto syntax-highlighting
  zgen prezto zsh-users/zsh-completions src
fi

# zsh modules
export MODULES_PATH=$HOME/.zmodules
wd() { source $MODULES_PATH/wd/wd.sh }
fpath=($MODULES_PATH/wd $fpath)
rm -f ~/.zcompdump; compinit

#################################################################
# ZSH SETUP END
#################################################################

export EDITOR="vim"

# ZSH Configurations
COMPLETION_WAITING_DOTS="true"

# unbind ctrl-s
[ -z "$PS1" ] || stty -ixon

# bash is stupid sometimes and enter key dont work
stty icrnl

# Android stuff
export ANDROID_SDK=$HOME/android-sdk-macosx
export ANDROID_NDK=$HOME/android-ndk/android-ndk-r10e

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Homebrew & asdf
if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"

  export ASDF_DIR=$(brew --prefix asdf)/libexec
else
  export ASDF_DIR=$HOME/.asdf/libexec
fi

source $ASDF_DIR/asdf.sh


# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit
compinit

# Needed to indicate to cars_platform where to seek a DB connection
export PSQL_SOURCE=docker

# My Scripts
source "$HOME/.scripts/aliases.sh"
# My custom bins
source "$HOME/.scripts/bins.sh"

[ -f $HOME/.cars_especial ] && source $HOME/.cars_especial

export NODE_TLS_REJECT_UNAUTHORIZED=0

eval "$(starship init zsh)"
