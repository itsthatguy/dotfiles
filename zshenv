# PATH
export MYSCRIPTS="$HOME/.scripts"
export MYBIN="$HOME/bin"
export BIN="/usr/local/bin"
export SBIN="/usr/local/sbin"
export NPM="/usr/local/bin/npm"
export HEROKU="/usr/local/heroku/bin"
export COCOS_CONSOLE_ROOT="$HOME/git/open-games/cocos2d-js/tools/cocos2d-console/bin"
export COCOS_TEMPLATES_ROOT="$HOME/git/open-games/cocos2d-x/templates"
export PATH=$COCOS_CONSOLE_ROOT:$COCOS_TEMPLATES_ROOT:$HEROKU:$NPM:$MYSCRIPTS:$MYBIN:$BIN:$SBIN:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

# Various Environment Variables
export PGHOST=localhost
export EDITOR="vim"
export TERM=xterm-256color
export POW_DOMAINS=dev,test

# nvm
source $(brew --prefix nvm)/nvm.sh

# additional config
source ~/.zshrc

# chruby's autoload is bad, and it should feel bad
if [[ -e /usr/local/share/chruby ]]; then
  source /usr/local/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh
  chruby $(cat ~/.ruby-version)
fi
