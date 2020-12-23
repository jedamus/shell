#!/usr/bin/env sh

# erzeugt Donnerstag, 03. Dezember 2020 18:37 (C) 2020 von Leander Jedamus
# modifiziert Mittwoch, 23. Dezember 2020 10:16 von Leander Jedamus
# modifiziert Dienstag, 15. Dezember 2020 14:22 von Leander Jedamus
# modifiziert Montag, 14. Dezember 2020 23:33 von Leander Jedamus
# modifiziert Freitag, 11. Dezember 2020 09:33 von Leander Jedamus
# modifiziert Donnerstag, 10. Dezember 2020 16:28 von Leander Jedamus
# modifiziert Freitag, 04. Dezember 2020 18:45 von Leander Jedamus
# modifiziert Donnerstag, 03. Dezember 2020 20:11 von Leander Jedamus

# debug-mode:
## HOME="$HOME/repositories"

my_path=`pwd`

clone()
{
  git clone gitolite3@master:$1 $2
  ## git clone https://github.com/jedamus/$1.git $2
  ## git clone https://gitlab.com/jedamus/$1.git $2
  ## git clone https://bitbucket.org/jedamus/$1.git $2
  echo ""
};# clone

if [ -z $1 ];then
  mode=auto
else
  mode=$1
fi

if [ ! $mode = "auto" ]; then
  echo "After entering your password, write the following to change the shell:"
  echo "\"/bin/zsh\":"
  chsh
fi

mkdir -p $HOME
cd $HOME
clone zsh-config .zsh
clone vim-python .vim

mkdir Projekte
cd Projekte
mkdir perl python c automake deb docker
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

cd docker
clone install_my_repos install_my_repos
cd ..

cd ..

# Installation

python=$HOME/Projekte/python
perl=$HOME/Projekte/perl
bin=$HOME/bin

mkdir -p $bin

cd $HOME/Projekte/git
if [ ! $mode = "auto" ]; then
  sh install.sh
else
  sh install.sh "Test User" "testuser@example.org"
fi
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
sh ./install3.sh "testuser@testuser.org" "www.testuser.org" "org.testuser"
## sh ./install2.sh "testuser@testuser.org" "www.testuser.org" "org.testuser"

cd ..
echo ""

# install Projekte
projekte=$HOME/Projekte
dotfiles=$projekte/dotfiles
myperl=$projekte/perl/myperl
python=$projekte/python

cd $dotfiles
sh ./install.sh
echo ""

cd $myperl
sh ./install.sh
echo ""

cd $python/download-sortierer
sh ./install.sh
echo ""

cd $python/active-print
sh ./install.sh
echo ""

echo "Now log off completely and re-log in!"

# vim:ai sw=2

