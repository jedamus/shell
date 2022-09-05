#!/usr/bin/env sh

# erzeugt Sonntag, 22. November 2020 09:43 (C) 2020 von Leander Jedamus
# modifiziert Montag, 05. September 2022 14:11 von Leander Jedamus
# modifiziert Dienstag, 30. August 2022 11:59 von Leander Jedamus
# modifiziert Dienstag, 29. Dezember 2020 14:30 von Leander Jedamus
# modifiziert Sonntag, 22. November 2020 09:43 von Leander Jedamus

#set -x

#export BROWSER="firefox"
##export BROWSER="myfirefox.sh"

export BROWSER="chromium-browser"

d=`pwd`
d_env="$d/env/bin"
d_ipython="$d/.ipython"

f="$d_env/activate"

if [ -f "$f" ]; then
  . "$f"
  #export PATH=$d:${PATH}
  #echo $PATH
fi

if [ -d "$d_ipython" ]; then
  export IPYTHONDIR="$d_ipython"
fi

#jupyter-notebook
jupyter-lab

# vim:ai sw=2

