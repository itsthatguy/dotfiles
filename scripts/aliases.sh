# MY aliases
alias rake='noglob rake'
alias postgres.start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias postgres.stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias eae="subl ~/.zshenv ~/.zshrc"
alias eax="source ~/.zshenv"
alias pss="powify server stop && powify server start"
alias be="bundle exec"
alias v.="mvim ."
alias mm='bundle exec middleman'
