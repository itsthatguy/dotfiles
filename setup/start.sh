#!/usr/bin/env bash

source ./setup/lib.sh

alert "Updating Submodules"

# Make sure we have a place to store backups
# git submodule update --init --recursive
# git submodule foreach git pull
# mkdir -p ~/.dotfiles_backup/
