#!/usr/bin/env sh

# erzeugt Montag, 28. August 2017 13:21 (C) 2017 von Leander Jedamus
# modifiziert Dienstag, 20. Oktober 2020 21:01 von Leander Jedamus
# modifiziert Samstag, 26. September 2020 15:59 von Leander Jedamus
# modifiziert Mittwoch, 13. September 2017 08:59 von Leander Jedamus
# modifiziert Montag, 28. August 2017 13:26 von Leander Jedamus

usage() {
  echo "usage: $0 <remote-repository on master>"
  exit 0
};# usage()

if [ -z $1 ]; then
  usage
else
  case "$1" in
    --help)     usage
                ;;
  esac
fi

git init
git config branch.master.merge refs/heads/master
git remote add origin gitolite3@master:$1
git config branch.master.remote origin
echo ".*.swp" > .gitignore

# vim:ai sw=2

