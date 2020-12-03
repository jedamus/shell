#!/usr/bin/env sh

# erzeugt Donnerstag, 26. März 2020 11:20 (C) 2020 von Leander Jedamus
# modifiziert Donnerstag, 03. Dezember 2020 17:15 von Leander Jedamus
# modifiziert Mittwoch, 02. Dezember 2020 13:58 von Leander Jedamus
# modifiziert Dienstag, 01. Dezember 2020 17:55 von Leander Jedamus
# modifiziert Donnerstag, 26. März 2020 11:20 von Leander Jedamus

. $HOME/bin/my_options.sh

d="/var/lib/dpkg/info"

if [ -d $d ]; then
  cd $d
  grep $grep_options $1 *.list
else
  echo "$d not found."
fi

# vim:ai sw=2

