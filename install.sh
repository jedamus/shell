#!/usr/bin/env sh

# erzeugt Montag, 14. Dezember 2020 18:19 (C) 2020 von Leander Jedamus
# modifiziert Montag, 14. Dezember 2020 18:28 von Leander Jedamus

cd files
cp -vp *.sh *.zsh *.modify_me $HOME/bin

cd $HOME/bin
CH=chmodchown
echo "modifying ${CH}.modify_me to ${CH}.sh"
cat ${CH}.modify_me | sed "s/__USER__/${USER}/" > ${CH}.sh
echo "removing ${CH}.modify_me"
rm -f ${CH}.modify_me
chmod +x ${CH}.sh
echo ""



# vim:ai sw=2

