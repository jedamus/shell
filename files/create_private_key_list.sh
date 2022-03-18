#!/usr/bin/env sh

# erzeugt Freitag, 18. März 2022 05:41 (C) 2022 von Leander Jedamus
# modifiziert Freitag, 18. März 2022 05:56 von Leander Jedamus

#set -x

pfad=$HOME/.ssh
private_key_list=$pfad/private_key_list

mkdir -p $pfad
cd $pfad

public_keys=`ls *.pub`
if [ ! -z "$public_keys" ]; then
  echo -n "" > $private_key_list
  for public_key in $public_keys; do
    private_key=`basename $public_key .pub`
    if [ -f $private_key ]; then
      echo "added $private_key"
      echo -n "$private_key " >> $private_key_list
    fi
  done
  echo "" >> $private_key_list
else
  echo "no public keys found."
fi

# vim:ai sw=2

