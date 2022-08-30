#!/usr/bin/env sh

# erzeugt Sonntag, 22. November 2020 09:43 (C) 2020 von Leander Jedamus
# modifiziert Dienstag, 30. August 2022 15:04 von Leander Jedamus
# modifiziert Dienstag, 29. Dezember 2020 14:30 von Leander Jedamus
# modifiziert Sonntag, 22. November 2020 09:43 von Leander Jedamus

# set -x

d=`pwd`"/env/bin"
f="$d/activate"
if [ -f "$f" ]; then
  . "$f"
  #export PATH=$d:${PATH}
  #echo $PATH
fi

#jupyter-notebook --browser="firefox"
jupyter-notebook --browser="chromium-browser"

# vim:ai sw=2

