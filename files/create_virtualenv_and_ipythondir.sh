#!/usr/bin/env sh

# erzeugt Mittwoch, 07. September 2022 19:56 (C) 2022 von Leander Jedamus
# modifiziert Mittwoch, 24. April 2024 10:26 von Leander Jedamus
# modifiziert Mittwoch, 07. September 2022 17:36 von Leander Jedamus

export PY_ENV_DIR=${PY_ENV_DIR:-env}

d=$(pwd)
d_ipython=".ipython"
d_p_ipython="$d/.ipython"

if [ ! -d $PY_ENV_DIR ]; then
  echo -n "creating $PY_ENV_DIR ... "
  python3 -m venv $PY_ENV_DIR
  echo "$PY_ENV_DIR created."
else
  echo "$PY_ENV_DIR already exists."
fi

if [ ! -d $d_p_ipython ]; then
  export IPYTHONDIR="$d_p_ipython"
  echo "creating $d_ipython ... "
  mkdir -p $d_ipython
  ipython profile create default
  echo "$d_ipython created."
else
  echo "$d_ipython already exists."
fi

# vim:ai sw=2
