#!/usr/bin/env sh

# erzeugt Donnerstag, 06. Oktober 2016 15:22 (C) 2016 von Leander Jedamus
# modifiziert Samstag, 26. September 2020 16:01 von Leander Jedamus
# modifiziert Donnerstag, 06. Oktober 2016 15:25 von Leander Jedamus

LOGGER="/usr/bin/logger -t `basename $0`[$$]"

{
  test -e /etc/irgendeinedatei || echo "Error, Datei nicht gefunden!";
  date;
  echo "eine andere Fehlermeldung";
} | $LOGGER

# vim:ai sw=2

