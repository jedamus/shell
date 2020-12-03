#!/usr/bin/env sh

# erzeugt Mittwoch, 23. September 2020 14:21 (C) 2020 von Leander Jedamus
# modifiziert Samstag, 26. September 2020 19:15 von Leander Jedamus
# modifiziert Donnerstag, 24. September 2020 17:07 von Leander Jedamus
# modifiziert Mittwoch, 23. September 2020 14:30 von Leander Jedamus

EVINCE=evince
DIR=$HOME/pdf/von_simon

usage() {
  echo "pdf <PATH_TO_PDF>";
  echo "txt <PATH_TO_TXT>";
  exit 0;
};# usage()

launch() {
  case "$1" in
    pdf)  launcher=$EVINCE
          ;;
    txt)  launcher=cat
          ;;
    *)    usage
          ;;
  esac
  if [ -f "$2" ]; then
    if [ -r "$2" ]; then
      $launcher "$2" &
    else
      echo "Datei \"$2\" nicht lesbar."
      exit 1
    fi
  else
      echo "Datei \"$2\" nicht gefunden."
      exit 1
  fi
};# launch()

launch txt $HOME/todo.txt

launch pdf $DIR/ML/ML.18.02.pdf                         # S.   51
launch pdf $DIR/numpy/numpy-ref-1.17.0.pdf              # S.  721
launch pdf $DIR/pyquil/docs-rigetti-com-en-v2.18.0.pdf  # S.  117
launch pdf $DIR/Bibel/Die_Bibel.pdf                     # S. 1027

# vim:ai sw=2

