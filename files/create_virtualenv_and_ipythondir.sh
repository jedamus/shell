#!/usr/bin/env sh

# erzeugt Mittwoch, 07. September 2022 19:56 (C) 2022 von Leander Jedamus
# modifiziert Mittwoch, 07. September 2022 17:36 von Leander Jedamus

d=`pwd`
d_ipython="$d/.ipython"

python3 -m venv env

mkdir -p $d_ipython
export IPYTHONDIR="$d_ipython"
ipython profile create default

# vim:ai sw=2
