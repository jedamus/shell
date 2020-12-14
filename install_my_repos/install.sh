#!/usr/bin/env sh

# erzeugt Samstag, 21. März 2020 11:36 (C) 2020 von Leander Jedamus
# modifiziert Freitag, 04. Dezember 2020 13:32 von Leander Jedamus
# modifiziert Donnerstag, 03. Dezember 2020 19:39 von Leander Jedamus
# modifiziert Dienstag, 01. Dezember 2020 08:59 von Leander Jedamus
# modifiziert Donnerstag, 19. November 2020 09:30 von Leander Jedamus
# modifiziert Montag, 26. Oktober 2020 10:32 von Leander Jedamus
# modifiziert Sonntag, 04. Oktober 2020 08:03 von Leander Jedamus
# modifiziert Samstag, 03. Oktober 2020 04:00 von Leander Jedamus
# modifiziert Sonntag, 27. September 2020 08:05 von Leander Jedamus
# modifiziert Montag, 27. April 2020 07:52 von Leander Jedamus
# modifiziert Donnerstag, 26. März 2020 13:33 von Leander Jedamus
# modifiziert Sonntag, 22. März 2020 15:06 von Leander Jedamus
# modifiziert Samstag, 21. März 2020 15:19 von Leander Jedamus

# modify this to reflect your printers!
printers="laserjet duplex"

my_path=`pwd`
bin=$HOME/bin

modify_desktop_file()
{
  echo "installing $2"
  cat $1 | sed "s/USER/$USER/g" | sed "s/PRINTER/$3/g" > $2
};# modify_desktop_file

echo "After entering your password, write the following to change the shell:"
echo "\"/bin/zsh\":"
chsh

cd
tar xvfz $my_path/dotfiles.tar.gz
tar xvfz $my_path/bin.tar.gz

cd $bin
ln -sf a2ps.pl a2ps

CH=chmodchown
cat ${CH}.modify_me | sed "s/__USER__/${USER}/" > ${CH}.sh
rm -f ${CH}.modify_me
chmod +x ${CH}.sh

cd
tar xvfz $my_path/zsh.tar.gz
tar xvfz $my_path/vim.tar.gz
tar xvfz $my_path/Projekte.tar.gz
ln -sf .vim/vimrc3 .vimrc

# install zsh
cp -p .zsh/zshprompt.py $bin
cp -p .zsh/.zshrc .zsh/.myenv $HOME

# install vim
cp -p .vim/.exrc $HOME
#cp -p .vim/.vimrc3 $HOME/.vimrc

# install Projekte
my_print=$HOME/print
projekte=$HOME/Projekte
myperl=$projekte/perl/myperl
python=$projekte/python
zlogin=$HOME/.zlogin

cd $myperl/a2ps
cp -Rvp a2ps.pl locale $bin

cd $myperl/myconf
cp -Rvp myconf.pl $bin

cd $myperl/mycopy
cp -Rvp mycopy.pl locale $bin

cd $myperl/translate
cp -Rvp translate.pl $bin

autostart=$HOME/.config/autostart
mkdir -p $autostart

cd $python/download-sortierer
cp -Rvp download-sortierer.py locale $bin
modify_desktop_file download-sortierer.desktop $autostart/download-sortierer.desktop

echo "All PDF files, which are COPIED into these subdrectories of ~/print,\nare printed on the corresponding printer and then DELETED!\n\nAlle PDF-Dateien, die in Unterverzeichnisse von ~/print/ KOPIERT werden,\nwerden auf dem ensprechenden Drucker ausgedruckt und anschließend GELÖSCHT!" > $my_print/README.IMPORTANT\!

echo "#echo \"ich bin $zlogin\"\n" > $zlogin

# für jeden Druckereintrag ein Verzeichnis anlegen und in .zlogin eintragen:
for i in $printers; do
  echo "creating dir for printer $i"
  mkdir -p $my_print/$i
  echo "echo -n \"active-print.py -P $i: \"" >> $zlogin
  echo "~/bin/active-print.py -P $i 2> /dev/null &" >> $zlogin
done

cd $python/active-print
cp -Rvp active-print.py locale $bin
for i in $printers; do
  modify_desktop_file active-print.desktop $autostart/active-print-$i.desktop $i
done

echo ""
echo "Now log off completely and re-log in!"

# vim:ai sw=2

