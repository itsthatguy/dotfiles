
# PATH
export MYSCRIPTS="$HOME/.scripts"
export MYBIN="$HOME/bin"
export BIN="/usr/local/bin"
export SBIN="/usr/local/sbin"
export NPM="/usr/local/bin/npm"
export HEROKU="/usr/local/heroku/bin"
export PATH=$HEROKU:$NPM:$MYSCRIPTS:$MYBIN:$BIN:$SBIN:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

# Various Environment Variables
export PGHOST=localhost
export EDITOR="vim"
export TERM=xterm-256color
export POW_DOMAINS=dev,test

# nvm
export NVM_DIR="/Users/itg/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


[ -d "$HOME/git/enova/8b/bin" ] && export PATH="$HOME/git/enova/8b/bin:$PATH"

source ~/.zshrc

# chruby's autoload is bad, and it should feel bad
if [[ -e /usr/local/share/chruby ]]; then
  source /usr/local/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh
  chruby $(cat ~/.ruby-version)
fi
