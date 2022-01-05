#!/usr/bin/env sh

# erzeugt Mittwoch, 05. Januar 2022 11:50 (C) 2022 von Leander Jedamus
# modifiziert Mittwoch, 05. Januar 2022 11:55 von Leander Jedamus

while true ; do
  clear
  /bin/ps a -u $USER -o pid,cmd
  /bin/df -h
  sleep 10
done

# vim:ai sw=2

