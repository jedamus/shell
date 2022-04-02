#!/usr/bin/env sh

# erzeugt Freitag, 18. März 2022 05:41 (C) 2022 von Leander Jedamus
# modifiziert Samstag, 02. April 2022 23:00 von Leander Jedamus
# modifiziert Freitag, 18. März 2022 05:56 von Leander Jedamus

#set -x

pfad=$HOME/.ssh
private_key_list=$pfad/private_key_list

if [ ! -d $pfad ]; then
  mkdir -p $pfad
  echo "created .ssh in your home directory."
  chmod 700 $pfad
fi

cd $pfad

public_keys=$(ls *.pub 2> /dev/null)
if [ ! -z "$public_keys" ]; then
  nr=1
  echo -n "" > $private_key_list
  for public_key in $public_keys; do
    private_key=`basename $public_key .pub`
    if [ -f $private_key ]; then
      if [ $nr -gt 1 ]; then
        echo -n " " >> $private_key_list
	echo -n ","
      else
        echo -n "added "
      fi
      echo -n "$private_key"
      echo -n "$private_key" >> $private_key_list
      nr=$(($nr+1))
    fi
  done
  echo "" >> $private_key_list
  echo ""
  echo "added $(($nr-1)) private keys."
else
  echo "no public keys found."
fi

# vim:ai sw=2

