function shload() {
  for s in "${@}"; do
    [ -f $s ] && source $s
  done
}

function shexport() {
  for b in "${@}"; do
    export PATH=$b:$PATH
  done
}
