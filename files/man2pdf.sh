#!/usr/bin/env sh

# erzeugt Freitag, 03. November 2017 13:21 (C) 2017 von Leander Jedamus
# modifiziert Mittwoch, 21. Oktober 2020 05:59 von Leander Jedamus
# modifiziert Samstag, 26. September 2020 16:02 von Leander Jedamus
# modifiziert Montag, 06. November 2017 18:17 von Leander Jedamus
# modifiziert Freitag, 03. November 2017 13:24 von Leander Jedamus

usage() {
 echo "usage: $0 <filename.1.gz>"
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

file=`basename $1 .1.gz`

zcat $file.1.gz | groff -man - | ps2pdf -sPAPERZIZE=a4 - - > $file.pdf

# vim:ai sw=2

