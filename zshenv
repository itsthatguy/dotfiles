# PATH
export MYSCRIPTS="$HOME/.scripts"
export MYBIN="$HOME/bin"
export BIN="/usr/local/bin"
export SBIN="/usr/local/sbin"
export NPM="/usr/local/bin/npm"
export HEROKU="/usr/local/heroku/bin"
export GOPATH="$HOME/.go"
export GOBIN="$GOPATH/bin"
export GOPROTOOLS="$HOME/git/clients/gopro/gopro-tools"
export PATH=$GOPROTOOLS:$HEROKU:$GOBIN:$NPM:$MYSCRIPTS:$MYBIN:$BIN:$SBIN:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

# Various Environment Variables
export PGDATA='/usr/local/var/postgres'
export PGHOST=localhost
export TERM=xterm-256color
export POW_DOMAINS=dev,test
export ANDROID_HOME=/usr/local/opt/android-sdk

# # docker-machine config
# if [[ "$(docker-machine status vikinghug)" = "Running" ]]; then
#   eval "$(docker-machine env vikinghug)"
# fi

# additional config
[ -f ~/.zshsecrets ] && source ~/.zshsecrets

# chruby's autoload is bad, and it should feel bad
if [[ -e /usr/local/share/chruby ]]; then
  source /usr/local/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh
  chruby $(cat ~/.ruby-version)
fi
