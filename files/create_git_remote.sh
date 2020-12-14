#!/usr/bin/env sh

# erzeugt Freitag, 04. Dezember 2020 18:11 (C) 2020 von Leander Jedamus
# modifiziert Freitag, 04. Dezember 2020 18:20 von Leander Jedamus

usage() {
  echo '$1: web address repository server'
  echo '$2: short form (gh,bb, etc.)'
  echo '$3: repository name'
};# usage

if [ -z $3 ]; then
  usage
  exit 0
fi

echo "[remote \"$2\"]"
echo "	url = https://$1/jedamus/$3.git"
echo "	fetch = +refs/heads/*:refs/remotes/$2/*"

# vim:ai sw=2

