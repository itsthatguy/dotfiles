# Random giglgglglge
alias random_giggle="node $HOME/.scripts/random_giggle.js"

# ZSH Config
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
source "$HOME/.zsh/themes/itg-text.zsh-theme"
unsetopt AUTO_CD

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



export EDITOR="vim"

# zsh modules
export MODULES_PATH=$HOME/.zmodules
wd() { source $MODULES_PATH/wd/wd.sh }
fpath=($MODULES_PATH/wd $fpath)
rm -f ~/.zcompdump; compinit

# My Scripts
source "$HOME/.scripts/aliases.sh"

# PERLS
# source ~/perl/perlbrew/etc/bashrc

# ZSH Configurations
COMPLETION_WAITING_DOTS="true"

# added by travis gem
# [ -f /Users/itg/.travis/travis.sh ] && source /Users/itg/.travis/travis.sh

# unbind ctrl-s
[ -z "$PS1" ] || stty -ixon

# bash is stupid sometimes and enter key dont work
stty icrnl

# Android stuff
export ANDROID_SDK=$HOME/android-sdk-macosx
export ANDROID_NDK=$HOME/android-ndk/android-ndk-r10e

# added by travis gem
[ -f /Users/kevin/.travis/travis.sh ] && source /Users/kevin/.travis/travis.sh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# asdf
export ASDF_DIR=$(brew --prefix asdf)
source $ASDF_DIR/asdf.sh
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit
compinit

export NPM_TOKEN=

# Needed to indicate to cars_platform where to seek a DB connection
export PSQL_SOURCE=docker
