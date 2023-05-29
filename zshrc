unsetopt AUTO_CD

#################################################################
## SHELL SETUP START ############################################
[ -z "$PS1" ] || stty -ixon               # unbind ctrl-s

stty icrnl                                # bash is stupid sometimes and enter key dont work
fpath=(${ASDF_DIR}/completions $fpath)    # append completions to fpath
autoload -Uz compinit                     # initialise completions with ZSH's compinit
compinit

# Homebrew & asdf
if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# My Scripts
# set -xv
fullpath=$(realpath $HOME/.zshrc)
export DOTDIR=$(dirname $fullpath)
source $DOTDIR/lib/shload.sh

SCRIPTS="$HOME/.scripts";
source_files=(
  "$SCRIPTS/aliases.sh"
  "$SCRIPTS/bins.sh"
  "$HOME/.cars_especial"
  "$HOME/.zshsecrets"
  "$ASDF_DIR/asdf.sh"
  "$HOME/.travis/travis.sh"
  "$NVM_DIR/bash_completion"
  # "$HOME/.zgen/zgen.zsh"
  "$(brew --prefix asdf)/libexec/asdf.sh"
  "$HOME/libexec/asdf.sh"
  # "$DOTDIR/config/zshsetup"
  # "$DOTDIR/config/zprezto"
  # "$DOTDIR/config/zgen"
  "$DOTDIR/config/keybinds"
  "$DOTDIR/config/completion"
  "$DOTDIR/config/starship"
)

shload $source_files

## SHELL SETUP END ##############################################
#################################################################

export EDITOR="vim"

# Android stuff
export ANDROID_SDK=$HOME/android-sdk-macosx
export ANDROID_NDK=$HOME/android-ndk/android-ndk-r10e

 # Need to indicate to cars_platform where to seek a DB connection
export PSQL_SOURCE=docker

export NODE_TLS_REJECT_UNAUTHORIZED=0

# ZSH Configurations
# COMPLETION_WAITING_DOTS="true"
