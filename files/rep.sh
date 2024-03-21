#!/usr/bin/env sh

# erzeugt Montag, 07. September 2020 12:59 (C) 2020 von Leander Jedamus
# modifiziert Donnerstag, 21. März 2024 13:38 von Leander Jedamus
# modifiziert Donnerstag, 24. September 2020 11:10 von Leander Jedamus
# modifiziert Montag, 07. September 2020 12:59 von Leander Jedamus

clear=""
sleep="5"
befehl=""

usage()
{
  echo "--help          this page";
  echo "--clear         clear page before printing";
  echo "--sleep <sec>   seconds to sleep between commands";
  echo "                everything after that belongs to a command.";
  exit 0;
};# usage()

while [ ! -z $1 ]; do
  case "$1" in
    --help)     usage
		;;
    --clear)    clear="clear"
                shift
		;;
    --sleep)    sleep=$2
                shift
		shift
		;;
    *)          befehl="$*"
                shift
		while [ ! -z $1 ]; do
		  shift
		done
		;;
  esac
done

while [ -z ]; do
  $clear
  $befehl
  sleep $sleep
done

# vim:ai sw=2

