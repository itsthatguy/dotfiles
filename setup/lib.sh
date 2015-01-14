#!/usr/bin/env bash

# Set up the environment
set -e
yellow='\033[1;33m'
NC='\033[0m' # No Color

BASE_DIR=$PWD

# Setup the alert function
alert() {
  echo -e "🍗 ${yellow} $1${NC}"
}

function check_file {
  basename=$(basename $1)
  if [[ -e $1 ]]; then
    alert "$1 exists: moving to ~/.dotfiles_backup/$basename"
    rm $1
  fi
  return true
}

# Setup symlink function
function sym {
  # check_file $1 $2
  ln -sfnv $BASE_DIR/$2 $1 || true
}

function dup {
  # check_file $1 $2
  echo "symlinking"
  cp -rf $2 $1 || true
}
