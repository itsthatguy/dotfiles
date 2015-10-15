# MY aliases
alias rake='noglob rake'

alias eae="subl ~/.zshenv ~/.zshrc"
alias eax="source ~/.zshenv"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

alias v.="mvim ."
alias pss="powify server stop && powify server start"
alias be="bundle exec"
alias mm='bundle exec middleman'

alias dcom='docker-compose'
alias dc='dcom'
alias dcub='dc build && dc up'
alias rmdanglers='docker rm $(docker ps -q -a --filter "dangling=true")'
alias create_gopro_gems='docker create -v /ruby_gems --name gopro-gems busybox'
alias dm='docker-machine'
alias jest='nocorrect jest'

dosh() {
  if [ "$1" = "-h" ] || [ "$1" = "--help" ] || [ "$1" = "help" ]
  then
    read -r -d '' VAR << EOM
Usage: dosh [argument]

Arguments:
  ls (default)        lists running containers
  [name|id]           runs bash for specified container
  help, -h, --help    brings up this help
EOM
    echo "$VAR"
  elif [ "$1" = "ls" ] || [ "$1" = "" ]
  then
    docker ps|grep gopro*|grep -v postgres|cut -d ' ' -f 1-10 
  elif [ "$1" != "" ]
  then
    docker exec -i -t `docker ps|grep $1|cut -d ' ' -f 1` sh
  fi 
}

alias lnwtf="echo ln -s '[FROM (ie; \$PWD)] [TO (new location)]'"

# git
alias gap="git add --patch"
alias gst="git status"
alias gl="git pull"
alias gp="git push"
alias gphm="git push heroku master"

# node
alias ne='PATH=$(npm bin):$PATH'
alias jib='sails-migrations'

# Get octal permissions of 'path(s)'
alias octal="stat -f '%Mp%Lp %N' $*"

# Databases
# mysql
alias myup='$(which mysql.server) start'
alias mydown='$(which mysql.server) down'
# mongo
alias mongoup='mongod --dbpath=$HOME/.mongo'
alias mongodown='mongod --shutdown'
# postgres
alias pgup='/usr/local/Cellar/postgresql/9.3.5_1/bin/pg_ctl -D $PGDATA -l $PGDATA/server.log start' #'pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgdown='/usr/local/Cellar/postgresql/9.3.5_1/bin/pg_ctl -D $PGDATA stop -s -m fast'


alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

alias starwars='telnet towel.blinkenlights.nl'
alias nyan='telnet nyancat.dakko.us'

alias z="zeus"
npv() {
  npm info $1 | grep version;
}

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
