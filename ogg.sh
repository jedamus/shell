#!/usr/bin/env sh

# erzeugt Montag, 07. September 2020 12:57 (C) 2020 von Leander Jedamus
# modifiziert Montag, 07. September 2020 13:06 von Leander Jedamus

clear=""
sleep="10"

usage()
{
  echo "--help          this page";
  echo "--clear         clear page before printing";
  echo "--sleep <sec>   seconds to sleep between commands";
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
  esac
done

while /bin/true; do
  $clear
  ls -latr --time-style="+%Y-%m-%d %H:%M.%S"
  sleep $sleep
done

# vim:ai sw=2

