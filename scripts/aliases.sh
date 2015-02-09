# MY aliases
alias rake='noglob rake'
alias postgres.start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias postgres.stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

alias eae="subl ~/.zshenv ~/.zshrc"
alias eax="source ~/.zshenv"

alias v.="gvim ."
alias pss="powify server stop && powify server start"
alias be="bundle exec"
alias mm='bundle exec middleman'

alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

alias starwars='telnet towel.blinkenlights.nl'
alias nyan='telnet miku.acm.uiuc.edu'


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
