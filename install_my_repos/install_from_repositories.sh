#!/usr/bin/env sh

# erzeugt Donnerstag, 03. Dezember 2020 18:37 (C) 2020 von Leander Jedamus
# modifiziert Montag, 14. Dezember 2020 18:29 von Leander Jedamus
# modifiziert Freitag, 11. Dezember 2020 09:33 von Leander Jedamus
# modifiziert Donnerstag, 10. Dezember 2020 16:28 von Leander Jedamus
# modifiziert Freitag, 04. Dezember 2020 18:45 von Leander Jedamus
# modifiziert Donnerstag, 03. Dezember 2020 20:11 von Leander Jedamus

# debug-mode:
HOME="$HOME/repositories"

# modify this to reflect your printers!
printers="laserjet duplex"

my_path=`pwd`

modify_desktop_file()
{
  echo "installing $2"
  cat $1 | sed "s/USER/$USER/g" | sed "s/PRINTER/$3/g" > $2
};# modify_desktop_file

clone()
{
  git clone gitolite3@master:$1 $2
  echo ""
};# clone

## echo "After entering your password, write the following to change the shell:"
## echo "\"/bin/zsh\":"
## chsh

mkdir -p $HOME
cd $HOME
clone zsh-config .zsh
clone vim-python .vim

mkdir Projekte
cd Projekte
mkdir perl python deb c automake
clone mygit git
clone my_dotfiles dotfiles
clone qpython-scripts qpython
clone make make
clone cobol cobol
clone tmux-config tmux
clone eps_out_latex eps_out_latex
clone latex latex
clone my-ruby ruby
clone my_shell shell

cd perl
clone myperl-tools myperl
cd ..

cd python
clone download-sortierer download-sortierer
clone active-print active-print
clone python-parallel parallel
clone py_matrizen matrizen
clone py_ipc ipc
cd ..

cd c
clone randomize_file randomize_file
clone make_check_host_system check_host_system
cd ..

cd automake
clone am_randomize_file am_randomize_file
clone am_yacc_and_lex am_yacc_and_lex
cd ..

cd deb
clone deb_randomizefile randomizefile
cd ..

cd ..

# installation-part

python=$HOME/Projekte/python
perl=$HOME/Projekte/perl
bin=$HOME/bin

mkdir -p $bin

cd $HOME/Projekte/git
sh install.sh "Test User" "testuser@example.org"
sh install_linux.sh

cd $HOME/Projekte/shell
sh ./install.sh
echo ""

cd $HOME
# install zsh
cd .zsh
sh ./install.sh
cd ..
echo ""

# install vim
cd .vim
sh ./install3.sh
cd ..
echo ""

# install Projekte
my_print=$HOME/print
projekte=$HOME/Projekte
dotfiles=$projekte/dotfiles
myperl=$projekte/perl/myperl
python=$projekte/python
zlogin=$HOME/.zlogin

cd $dotfiles
sh ./install.sh
echo ""

cd $myperl
sh ./install.sh
echo ""

autostart=$HOME/.config/autostart
mkdir -p $autostart

cd $python/download-sortierer
sh ./install.sh
echo ""

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
sh ./install.sh
echo ""

for i in $printers; do
  modify_desktop_file active-print.desktop $autostart/active-print-$i.desktop $i
done
echo ""

echo "Now log off completely and re-log in!"

# vim:ai sw=2

