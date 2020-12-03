#!/usr/bin/env sh

# erzeugt Donnerstag, 08. Juni 2017 16:20 (C) 2017 von Leander Jedamus
# modifiziert Donnerstag, 22. Oktober 2020 11:29 von Leander Jedamus
# modifiziert Dienstag, 20. Oktober 2020 21:02 von Leander Jedamus
# modifiziert Samstag, 26. September 2020 16:02 von Leander Jedamus
# modifiziert Donnerstag, 08. Juni 2017 16:32 von Leander Jedamus

usage()
{
  echo "--help        this page";
  echo '$1            /path/to/iso-image';
  echo '$2            /path/to/mountpoint';
  exit 0;
};# usage()

if [ -z $1 ]; then
  usage
else
  case "$1" in
    --help)     usage
                ;;
  esac
fi

if [ -z $2 ]; then
  usage
fi

sudo mount -o loop $1 $2

# vim:ai sw=2

