#!/usr/bin/env sh

# erzeugt Montag, 05. September 2022 17:12 (C) 2022 von Leander Jedamus
# modifiziert Montag, 05. September 2022 17:36 von Leander Jedamus

d=`pwd`
d_ipython="$d/.ipython"
d_env="$d/env/bin"

f_activate="$d_env/activate"
f_autorun="autorun.ipy"

options=""
#options="$options --no-simple-prompt"
options="$options --no-confirm-exit"

if [ -f "$f_activate" ]; then
  . "$f_activate"
  #export PATH=$d:${PATH}
  #echo $PATH
fi

if [ -d "$d_ipython" ]; then
  export IPYTHONDIR="$d_ipython"
fi

if [ -f "$f_autorun" ]; then
  options="$options -i $f_autorun"
fi

ipython $options $*

# vim:ai sw=2

