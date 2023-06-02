###########################################
# General helpers

# - Get octal permissions of 'path(s)'
alias octal="stat -f '%Mp%Lp %N' $*"

# - ln command help
alias lnwtf="echo ln -s '[FROM (ie; \$PWD)] [TO (new location)]'"

# - osx helpers
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias rake='noglob rake'
if command -v lsd &> /dev/null; then
  alias ll="/bin/ls -G"
  alias ls='lsd'
else
  alias ls="/bin/ls -G"
fi

# - reload / edit zsh configs
alias eae="vim ~/.zshenv ~/.zshrc"
alias eax="source ~/.zshenv && source ~/.zshrc"

# - editors
alias v.="mvim ."

# - yaml2json
alias yj='yaml2json $1 --pretty --save'

###########################################
# ruby
alias be="bundle exec"
alias mm='bundle exec middleman'

###########################################
# node
npv () { npm info $1 | grep version }
alias jest='nocorrect jest'

###########################################
# KUBE
alias k="kubectl"
alias kns="kubens"
alias kctx="kubectx"

###########################################
# docker
alias dm='docker-machine'
alias dcom='docker-compose'
alias dc='dcom'
alias dcub='dc build && dc up'

function get_docker_container_id () {
  echo `docker ps | grep $1 |cut -d ' ' -f 1`
}

function get_docker_container_names () {
  echo `docker ps | grep gopro*|grep -v postgres|cut -d ' ' -f 9-10`
}

function dosh() {
  names=(`get_docker_container_names`)
  PS3="Please enter your choice: "
  select name in "${names[@]}"; do
    docker exec -i -t `get_docker_container_id $name` bash
    [[ $name == exit ]] && break
  done
}

###########################################
# git
alias gbd='git branch --merged | ag -v "\*" | ag -v staging | ag -v master | ag -v develop | xargs -n 1 git branch -d'
alias gap="git add --patch"
alias gco="git checkout"
alias gd="git diff"
alias gst="git status"
alias gl="git pull"
alias gp="git push"
function gphm() {
  git push heroku $(git rev-parse --abbrev-ref HEAD):master
}

###########################################
# node
# here's a little bash function to replace the functionality of npm bin (so you can run ne <local binary> )
function ne() { "./node_modules/.bin/${@}" | tr -s / }
alias gulp='nocorrect gulp'
alias jib='sails-migrations'

###########################################
# Databases

# - mysql
myup() { $(which mysql.server) start }
mydown() { $(which mysql.server) down }

# - mongo
alias mongoup='mongod --dbpath=$HOME/.mongo'
alias mongodown='mongod --shutdown'

# - postgres
# alias pgup='/usr/local/Cellar/postgresql/9.6.2/bin/pg_ctl -D $PGDATA -l $PGDATA/server.log start' #'pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
# alias pgdown='/usr/local/Cellar/postgresql/9.6.2/bin/pg_ctl -D $PGDATA stop -s -m fast'
alias pgup='pg_ctl start'
alias pgdown='pg_ctl stop'

###########################################
# awesome
alias starwars='telnet towel.blinkenlights.nl'
alias nyan='telnet nyancat.dakko.us'

alias recam='sudo killall VDCAssistant'

function server() {
  local port="${1:-8000}"
  sleep 1 && open "http://localhost:${port}/" &
  # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
  # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
  python -m http.server $port
}

