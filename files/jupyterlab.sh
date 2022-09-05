#!/usr/bin/env sh

# erzeugt Sonntag, 22. November 2020 09:43 (C) 2020 von Leander Jedamus
# modifiziert Montag, 05. September 2022 10:22 von Leander Jedamus
# modifiziert Dienstag, 30. August 2022 11:59 von Leander Jedamus
# modifiziert Dienstag, 29. Dezember 2020 14:30 von Leander Jedamus
# modifiziert Sonntag, 22. November 2020 09:43 von Leander Jedamus

#set -x

d=`pwd`
denv="$d/env/bin"
dipython="$d/.ipython"
f="$denv/activate"

if [ -f "$f" ]; then
  . "$f"
  #export PATH=$d:${PATH}
  #echo $PATH
fi

if [ -d "$dipython" ]; then
  export IPYTHONDIR="$dipython"
fi

#jupyter-notebook --browser="firefox"
jupyter-notebook --browser="chromium-browser"

# vim:ai sw=2

