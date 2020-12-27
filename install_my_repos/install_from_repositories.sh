#!/usr/bin/env sh

# erzeugt Donnerstag, 03. Dezember 2020 18:37 (C) 2020 von Leander Jedamus
# modifiziert Sonntag, 27. Dezember 2020 19:09 von Leander Jedamus
# modifiziert Mittwoch, 23. Dezember 2020 20:20 von Leander Jedamus
# modifiziert Dienstag, 15. Dezember 2020 14:22 von Leander Jedamus
# modifiziert Montag, 14. Dezember 2020 23:33 von Leander Jedamus
# modifiziert Freitag, 11. Dezember 2020 09:33 von Leander Jedamus
# modifiziert Donnerstag, 10. Dezember 2020 16:28 von Leander Jedamus
# modifiziert Freitag, 04. Dezember 2020 18:45 von Leander Jedamus
# modifiziert Donnerstag, 03. Dezember 2020 20:11 von Leander Jedamus

# debug-mode:
## HOME="$HOME/repositories"

name1="Test User"
email1="testuser@testuser.org"
www1="http://www.testuser.org/"
package1="org.testuser"

my_path=`pwd`

target=`uname -s`

case "$target" in
  Darwin) export machtype="MacOS" ;;
  Linux)  export machtype="Linux" ;;
  *)      export machtype="unknown" ;;
esac

target=`uname -v`

case "$target" in
  *Ubuntu*) export machsystem="Ubuntu" ;;
  *Darwin*) export machsystem="MacOS" ;;
  *)        export machsystem="unknown" ;;
esac

echo "Type is $machtype"
echo "System is $machsystem"

# debug-mode:
## export machtype="MacOS"
## export machsystem="MacOS"

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

  name="$name1"
  email="$email1"
  www="$www1"
  package="$package1"
else
  mode=$1

  read -p "What is your name: " name
  echo "setting your name to $name"
  echo ""

  read -p "What is your email-address (ljedamus@web.de): " email
  echo "setting your email-address to $email"
  echo ""

  read -p "What is your WWW-address (http://www.jedamus-solutions.de/): " www
  echo "setting your www-address to $www"
  echo ""

  read -p "What is your Package-string (de.jedamus-solutions): " package
  echo "setting your package-string to $package"
  echo ""

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

mkdir perl python c automake docker
if [ $machsystem = "Ubuntu" ]; then
  mkdir deb
fi

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

# only works on Linux systems. It uses kernel functions.
if [ $machtype = "Linux" ]; then
clone download-sortierer download-sortierer
clone active-print active-print
fi

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

# This only works with Ubuntu systems.
if [ $machsystem = "Ubuntu" ]; then
  cd deb
  clone deb_randomizefile randomizefile
  cd ..
fi

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
sh install.sh "$name" "$email"

if [ $machtype = "Linux" ]; then
  sh install_linux.sh
fi
if [ $machtype = "MacOS" ]; then
  sh install_macos.sh
fi

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

if [ $machtype = "Linux" ]; then
  sh ./install3.sh "$email" "$www" "$package"
fi
if [ $machtype = "MacOS" ]; then
  sh ./install2.sh "$email" "$www" "$package"
fi

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

if [ $machtype = "Linux" ]; then
  cd $python/download-sortierer
  sh ./install.sh
  echo ""

  cd $python/active-print
  sh ./install.sh
  echo ""
fi

echo "Now log off completely and re-log in!"

# vim:ai sw=2

