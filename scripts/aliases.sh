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
alias ls='ls -G'

# - reload / edit zsh configs
alias eae="atom ~/.zshenv ~/.zshrc"
alias eax="source ~/.zshrc"

# - editors
alias v.="mvim ."

# - yaml2json
alias yj='yaml2json $1 --pretty --save'

# - move files to trash instead of rm
del() {
  RED="\e[31m"
  YELLOW="\e[33m"
  WHITE="\e[97m"

  if [[ $# -eq 0 ]] ; then
    echo -e "Sorry dude, I can't do anything with that. Nothing specified."
  else
    echo  -ne "${YELLOW}You're about to move the following items to the trash:${RED}\n > $*\n${YELLOW}Are you sure? [y/n] "
    read answer
    finish="-1"
    while [ "$finish" = '-1' ]
    do
      finish="1"
      if [ "$answer" = '' ];
      then
        answer=""
      else
        case $answer in
          y | Y | yes | YES )
            echo "$reset_color"
            local loc
            for loc in "$@"; do
              # ignore any arguments
              if [[ "$path" = -* ]]; then :
              else
                local dst=${loc##*/}
                dst="$dst "$(date +%H-%M-%S)
                mv -v "$loc" $HOME/.Trash/"$dst"
              fi
            done
            answer="y";
            ;;
          n | N | no | NO ) answer="n";;
          *) finish="-1";
             echo -n '\nInvalid response -- please reenter:';
             read answer;;
         esac
      fi
    done
  fi
}

###########################################
# pow
alias pss="powify server stop && powify server start"

###########################################
# ruby
alias be="bundle exec"
alias mm='bundle exec middleman'

###########################################
# node
npv () { npm info $1 | grep version }
alias jest='nocorrect jest'

###########################################
# docker
alias dm='docker-machine'
alias dcom='docker-compose'
alias dc='dcom'
alias dcub='dc build && dc up'
alias rmdanglers='docker rmi $(docker images -q --filter "dangling=true")'
# alias rmdanglers='docker images -q --filter dangling=true | xargs docker rmi'

get_docker_container_id () {
  echo `docker ps | grep $1 |cut -d ' ' -f 1`
}

get_docker_container_names () {
  echo `docker ps | grep gopro*|grep -v postgres|cut -d ' ' -f 9-10`
}

dosh() {
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
alias gphm="git push heroku $(git rev-parse --abbrev-ref HEAD):master"

###########################################
# node
alias gulp='nocorrect gulp'
alias ne='PATH=$(npm bin):$PATH'
alias jib='sails-migrations'

###########################################
# Databases

# - mysql
alias myup='$(which mysql.server) start'
alias mydown='$(which mysql.server) down'

# - mongo
alias mongoup='mongod --dbpath=$HOME/.mongo'
alias mongodown='mongod --shutdown'

# - postgres
alias pgup='/usr/local/Cellar/postgresql/9.6.2/bin/pg_ctl -D $PGDATA -l $PGDATA/server.log start' #'pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgdown='/usr/local/Cellar/postgresql/9.6.2/bin/pg_ctl -D $PGDATA stop -s -m fast'

###########################################
# awesome
alias starwars='telnet towel.blinkenlights.nl'
alias nyan='telnet nyancat.dakko.us'
