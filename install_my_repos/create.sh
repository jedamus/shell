#!/usr/bin/env sh

# erzeugt Samstag, 21. März 2020 13:53 (C) 2020 von Leander Jedamus
# modifiziert Dienstag, 12. Januar 2021 21:49 von Leander Jedamus
# modifiziert Dienstag, 29. Dezember 2020 15:02 von Leander Jedamus
# modifiziert Samstag, 05. Dezember 2020 08:38 von Leander Jedamus
# modifiziert Freitag, 04. Dezember 2020 18:47 von Leander Jedamus
# modifiziert Donnerstag, 03. Dezember 2020 17:20 von Leander Jedamus
# modifiziert Mittwoch, 02. Dezember 2020 13:55 von Leander Jedamus
# modifiziert Sonntag, 22. November 2020 09:57 von Leander Jedamus
# modifiziert Donnerstag, 19. November 2020 10:04 von Leander Jedamus
# modifiziert Montag, 26. Oktober 2020 10:13 von Leander Jedamus
# modifiziert Sonntag, 04. Oktober 2020 07:58 von Leander Jedamus
# modifiziert Samstag, 03. Oktober 2020 13:30 von Leander Jedamus
# modifiziert Freitag, 02. Oktober 2020 22:33 von Leander Jedamus
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
tar cvfz $dir/dotfiles.tar.gz .shenv .exrc .cshrc .tcshrc .login .logout .history .cshdirs .bash_profile .bashrc .bash_logout .bash_history .mkshrc .profile .zshenv .zprofile .zshrc .zlogin .zlogout .zsh_history .gitconfig .tmux.conf .condarc .condarc.example .forest_config .byobu .tmuxinator .tmux .ipython

tar cvfz $dir/vim.tar.gz ./.vim
tar cvfz $dir/zsh.tar.gz ./.zsh ./todo.txt

bin=./bin

tar cvfz $dir/bin.tar.gz $bin/nocaps.sh $bin/gitinit.sh $bin/rep.sh $bin/evince.sh $bin/ogg.sh $bin/my_options.sh $bin/grep_in_dpkg.sh $bin/chmodchown.modify_me $bin/mount_iso.sh $bin/man2pdf.sh $bin/man2ps.sh $bin/update.sh $bin/notebook.sh $bin/conda_init.sh $bin/create_git_remote.sh $bin/create_git_remotes.sh $bin/logger.sh $bin/my_short_backup.sh

projekte=./Projekte
perl=$projekte/perl
python=$projekte/python

tar cvfz $dir/Projekte.tar.gz $perl/myperl $projekte/latex $python/download-sortierer $python/active-print $python/matrizen $python/beispiele $python/notebook $python/qiskit $python/pyquil $python/parallel $python/ipc $python/pylab_matplotlib_pandas $python/numpy_scipy_matplotlib $projekte/deb/randomizefile $projekte/automake $projekte/make $projekte/shell $projekte/tmux $projekte/git $projekte/dotfiles $projekte/qpython $projekte/cobol $projekte/eps_out_latex $projekte/ruby $projekte/c $projekte/docker

# vim:ai sw=2

