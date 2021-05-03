#!/usr/bin/env sh

# erzeugt Samstag, 21. März 2020 11:36 (C) 2020 von Leander Jedamus
# modifiziert Freitag, 15. Januar 2021 11:34 von Leander Jedamus
# modifiziert Mittwoch, 13. Januar 2021 06:59 von Leander Jedamus
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
printers_="laserjet duplex"

name_="Test User"
email_="testuser@testuser.org"
www_="http://www.testuser.org/"
package_="org.testuser"

my_path=`pwd`
bin=$HOME/bin

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

if [ $machsystem = "unknown" ]; then
  processor=`uname -m`
  case "$processor" in
    *arm*) export machsystem="Arm" ;;
    *)     export machsystem="unknown" ;;
  esac
fi

echo "Type is $machtype"
echo "System is $machsystem"

# debug-mode:
## export machtype="MacOS"
## export machsystem="MacOS"

if [ -z "$1" ];then
  name="$name_"
  email="$email_"
  www="$www_"
  package="$package_"
  printers="$printers_"
else
  read -p "Enter your printer name(s) delimited by space: " printers
  echo "setting printers to \"$printers\""
  echo ""

  read -p "What is your name ($name_): " name
  echo "setting your name to \"$name\""
  echo ""

  read -p "What is your email-address ($email_): " email
  echo "setting your email-address to \"$email\""
  echo ""

  read -p "What is your WWW-address ($www_): " www
  echo "setting your www-address to \"$www\""
  echo ""

  read -p "What is your Package-string ($package_): " package
  echo "setting your package-string to \"$package\""
  echo ""

  echo "After entering your password, write the following to change the shell:"
  echo "\"/bin/zsh\":"

  chsh
fi

cd $HOME
tar xvfz $my_path/dotfiles.tar.gz
tar xvfz $my_path/bin.tar.gz

cd $bin
ln -sf a2ps.pl a2ps

CH=chmodchown
cat ${CH}.modify_me | sed "s/__USER__/${USER}/" > ${CH}.sh
rm -f ${CH}.modify_me
chmod +x ${CH}.sh

cd $HOME
tar xvfz $my_path/zsh.tar.gz
tar xvfz $my_path/vim.tar.gz
tar xvfz $my_path/Projekte.tar.gz

# install zsh
cd $HOME/.zsh
sh ./install.sh

# install vim
cd $HOME/.vim

if [ $machtype = "Linux" ]; then
  sh ./install3.sh "$email" "$www" "$package"
fi
if [ $machtype = "MacOS" ]; then
  sh ./install2.sh "$email" "$www" "$package"
fi

# install Projekte
my_print=$HOME/print
projekte=$HOME/Projekte
myperl=$projekte/perl/myperl
python=$projekte/python
dotfiles=$projekte/dotfiles

cd $dotfiles
sh ./install.sh
echo ""

cd $projekte/git
sh ./install.sh "$name" "$email"

if [ $machtype = "Linux" ]; then
  sh ./install_linux.sh
fi
if [ $machtype = "MacOS" ]; then
  sh ./install_macos.sh
fi

cd $myperl
sh ./install.sh
echo ""

cd $projekte/shell
sh ./install.sh
echo ""

cd $projekte/tmux
sh ./install.sh
echo ""

if [ $machtype = "Linux" ]; then
  cd $python/download-sortierer
  sh ./install.sh
  echo ""
  cd $python/active-print
  sh ./install.sh $printers
  echo ""
fi

echo "Now log off completely and re-log in!"

# vim:ai sw=2

