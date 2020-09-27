#!/usr/bin/env sh

# erzeugt Samstag, 21. März 2020 13:53 (C) 2020 von Leander Jedamus
# modifiziert Sonntag, 27. September 2020 01:17 von Leander Jedamus
# modifiziert Donnerstag, 24. September 2020 11:28 von Leander Jedamus
# modifiziert Montag, 07. September 2020 13:03 von Leander Jedamus
# modifiziert Montag, 27. April 2020 09:29 von Leander Jedamus
# modifiziert Samstag, 25. April 2020 10:47 von Leander Jedamus
# modifiziert Mittwoch, 22. April 2020 18:52 von Leander Jedamus
# modifiziert Montag, 06. April 2020 18:22 von Leander Jedamus
# modifiziert Dienstag, 31. März 2020 19:24 von Leander Jedamus
# modifiziert Donnerstag, 26. März 2020 17:06 von Leander Jedamus
# modifiziert Samstag, 21. März 2020 17:17 von Leander Jedamus

stick=/media/leander/INTENSO

dir=$stick/von_leander
dir=$HOME/Install_My_Repos

cd
tar cvfz $dir/dotfiles.tar.gz .myenv .exrc .vimrc .zshrc .cshrc .bashrc .login .zlogin .zlogout .zprofile .zsh_history .bash_logout .gitconfig .tmux.conf .condarc .condarc.example .forest_config .byobu .tmuxinator

tar cvfz $dir/vim.tar.gz ./.vim
tar cvfz $dir/zsh.tar.gz ./zsh ./todo.txt

bin=./bin

tar cvfz $dir/bin.tar.gz $bin/nocaps.sh $bin/gitinit.sh $bin/rep.sh $bin/evince.sh $bin/ogg.sh $bin/grep_in_dpkg.sh $bin/chmodchown.modify_me $bin/mount_iso.sh $bin/man2pdf.sh $bin/man2ps.sh $bin/update.sh $bin/notebook.sh

projekte=./Projekte
perl=$projekte/perl
python=$projekte/python

tar cvfz $dir/Projekte.tar.gz $perl/myperl $projekte/latex $python/download-sortierer $python/active-print $python/matrizen $python/notebook $python/qiskit $python/pyquil $python/parallel $python/ipc $python/pylab_matplotlib_pandas $python/numpy_scipy_matplotlib $projekte/deb/randomizefile $projekte/automake/am_randomize_file $projekte/make $projekte/shell $projekte/tmux

# vim:ai sw=2

