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

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# tabtab source for yo package
# uninstall by removing these lines or running `tabtab uninstall yo`
[[ -f /usr/local/opt/nvm/versions/node/v4.1.1/lib/node_modules/yo/node_modules/tabtab/.completions/yo.zsh ]] && . /usr/local/opt/nvm/versions/node/v4.1.1/lib/node_modules/yo/node_modules/tabtab/.completions/yo.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Android stuff
export ANDROID_SDK=$HOME/android-sdk-macosx
export ANDROID_NDK=$HOME/android-ndk/android-ndk-r10e

# added by travis gem
[ -f /Users/kevin/.travis/travis.sh ] && source /Users/kevin/.travis/travis.sh
