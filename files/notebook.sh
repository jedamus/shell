#!/usr/bin/env sh

# erzeugt Donnerstag, 19. März 2020 13:46 (C) 2020 von Leander Jedamus
# modifiziert Samstag, 03. Oktober 2020 05:49 von Leander Jedamus
# modifiziert Samstag, 25. April 2020 07:24 von Leander Jedamus
# modifiziert Donnerstag, 23. April 2020 16:34 von Leander Jedamus
# modifiziert Donnerstag, 26. März 2020 17:07 von Leander Jedamus
# modifiziert Donnerstag, 19. März 2020 14:21 von Leander Jedamus

JUPYTER=jupyter-lab

if [ -x $HOME/anaconda3/bin/$JUPYTER ]; then
  cd $HOME/Projekte/python/notebook
  $JUPYTER --browser="firefox"
else
  echo "anaconda3 not installed."
  exit 1
fi

# vim:ai sw=2

