#!/usr/bin/env sh

# erzeugt Samstag, 03. Oktober 2020 02:43 (C) 2020 von Leander Jedamus
# modifiziert Samstag, 03. Oktober 2020 13:28 von Leander Jedamus

BASHRC=$HOME/.bashrc
TMPBASHRC=/tmp/bashrc.$$

TCSHRC=$HOME/.tcshrc
TMPTCSHRC=/tmp/tcshrc.$$

if [ -x $HOME/anaconda3/bin/conda ]; then
  conda init bash zsh tcsh
  cat $BASHRC | sed -e "s#PATH=\"${HOME}#PATH=\"\${HOME}#" | \
                sed -e "s#${HOME}#.#" > $TMPBASHRC
  mv $TMPBASHRC $BASHRC
  cat $TCSHRC | sed -e "s#PATH=\"${HOME}#PATH=\"\${HOME}#" | \
                sed -e "s#${HOME}#.#" > $TMPTCSHRC
  mv $TMPTCSHRC $TCSHRC
else
  echo "anaconda3 not installed."
  exit 1
fi
