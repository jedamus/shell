#!/usr/bin/env sh

# erzeugt Freitag, 04. Dezember 2020 18:21 (C) 2020 von Leander Jedamus
# modifiziert Freitag, 04. Dezember 2020 18:24 von Leander Jedamus

usage() {
  echo '$1: short name for server'
};# usage

if [ -z $1 ]; then
  usage
  exit 0
fi

create_git_remote.sh github.com    gh $1
create_git_remote.sh gitlab.com    gl $1
create_git_remote.sh bitbucket.org bb $1

# vim:ai sw=2

