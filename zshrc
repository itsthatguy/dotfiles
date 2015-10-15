# Random giglgglglge
alias random_giggle="ruby $HOME/.scripts/random_giggle.rb"

# ZSH Config
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
source "$HOME/.oh-my-zsh/themes/itg-text.zsh-theme"
unsetopt AUTO_CD

export EDITOR="vim"

# zsh modules
export MODULES_PATH=$HOME/.zmodules
wd() { source $MODULES_PATH/wd/wd.sh }
fpath=($MODULES_PATH/wd $fpath)
rm -f ~/.zcompdump; compinit

# My Scripts
source "$HOME/.scripts/aliases.sh"

# PERLS
source ~/perl5/perlbrew/etc/bashrc

# MY aliases
alias rake='noglob rake'

alias eae="vim ~/.zshenv ~/.zshrc"
alias eax="source ~/.zshenv"

# ZSH Configurations
COMPLETION_WAITING_DOTS="true"

# added by travis gem
[ -f /Users/itg/.travis/travis.sh ] && source /Users/itg/.travis/travis.sh

# nvm
source $(brew --prefix nvm)/nvm.sh

# unbind ctrl-s
[ -z "$PS1" ] || stty -ixon

# bash is stupid sometimes and enter key dont work
stty icrnl
