#!/usr/bin/env bash
set -e

tags="$1"

if [ -z $tags ]; then
  tags="all"
fi

if ! [ -x "$(command -v ansible)" ]; then
  sudo apt install ansible -v 2.7.4
fi

ansible-playbook -i ~/.dotfiles/hosts ~/.dotfiles/dotfiles.yml --ask-become-pass --tags $tags
