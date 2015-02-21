# Random giglgglglge
alias random_giggle="ruby $HOME/.scripts/random_giggle.rb"

# ZSH Config
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="itg-text"
plugins=(git osx wd)
source $ZSH/oh-my-zsh.sh

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

# unbind ctrl-s
[ -z "$PS1" ] || stty -ixon

# bash is stupid sometimes and enter key dont work
stty icrnl
