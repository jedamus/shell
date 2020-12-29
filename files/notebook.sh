#!/usr/bin/env sh

# erzeugt Donnerstag, 19. März 2020 13:46 (C) 2020 von Leander Jedamus
# modifiziert Dienstag, 29. Dezember 2020 14:57 von Leander Jedamus
# modifiziert Samstag, 03. Oktober 2020 05:49 von Leander Jedamus
# modifiziert Samstag, 25. April 2020 07:24 von Leander Jedamus
# modifiziert Donnerstag, 23. April 2020 16:34 von Leander Jedamus
# modifiziert Donnerstag, 26. März 2020 17:07 von Leander Jedamus
# modifiziert Donnerstag, 19. März 2020 14:21 von Leander Jedamus

JUPYTER=jupyter-lab
DIR="$HOME/Projekte/python/notebook"
## DIR="$HOME/tmp"

# call this once before calling this script:
## python3 -m venv env
## source env/bin/activate
## pip install ...

if [ -x $HOME/anaconda3/bin/$JUPYTER ]; then
  cd $DIR
  if [ -d env ]; then
    echo "reading activate from $DIR/env/bin"
    . env/bin/activate
  fi
  $JUPYTER --browser="firefox"
else
  echo "anaconda3 not installed."
  exit 1
fi

# vim:ai sw=2

