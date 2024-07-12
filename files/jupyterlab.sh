#!/usr/bin/env sh

# erzeugt Sonntag, 22. November 2020 09:43 (C) 2020 von Leander Jedamus
# modifiziert Donnerstag, 25. April 2024 11:42 von Leander Jedamus
# modifiziert Mittwoch, 24. April 2024 09:26 von Leander Jedamus
# modifiziert Montag, 19. September 2022 18:28 von Leander Jedamus
# modifiziert Montag, 05. September 2022 14:11 von Leander Jedamus
# modifiziert Dienstag, 30. August 2022 11:59 von Leander Jedamus
# modifiziert Dienstag, 29. Dezember 2020 14:30 von Leander Jedamus
# modifiziert Sonntag, 22. November 2020 09:43 von Leander Jedamus

# set -x

#export BROWSER="firefox"
##export BROWSER="myfirefox.sh"

export BROWSER="chromium-browser"
export PY_ENV_DIR=${PY_ENV_DIR:-env}


d=$(pwd)
d_env="$d/$PY_ENV_DIR/bin"
d_ipython=".ipython"
d_p_ipython="$d/$d_ipython"

f_activate="$d_env/activate"

if [ -f "$f_activate" ]; then
  . "$f_activate"
  echo " $PY_ENV_DIR activated."

  #export PATH=$d:${PATH}
  #echo $PATH
fi

if [ -d "$d_p_ipython" ]; then
  echo " $d_ipython activated."
  export IPYTHONDIR="$d_p_ipython"
fi

#jupyter-notebook
jupyter-lab

# vim:ai sw=2

