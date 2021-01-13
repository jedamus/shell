#!/usr/bin/env sh

# erzeugt Samstag, 28. März 2020 10:39 (C) 2020 von Leander Jedamus
# modifiziert Mittwoch, 13. Januar 2021 04:59 von Leander Jedamus
# modifiziert Dienstag, 29. Dezember 2020 14:35 von Leander Jedamus
# modifiziert Donnerstag, 24. Dezember 2020 14:21 von Leander Jedamus
# modifiziert Sonntag, 27. September 2020 05:47 von Leander Jedamus
# modifiziert Samstag, 28. März 2020 10:42 von Leander Jedamus

dir="/media/$USER/INTENSO2"
counter=$HOME/bin/my_short_backup_nr

mkdir -p $dir
touch $counter

nr=`cat $counter`
nr2=$(($nr + 1))
echo $nr2 > $counter
nr=$nr2

backup() {
  echo "processing $1"
  tar cvfz "$dir/$1" $2 > $3
};# backup()

cd $HOME

backup anaconda3_$nr.tar.gz ./anaconda3 anaconda3_$nr.txt
backup pdf_$nr.tar.gz       ./pdf       pdf_$nr.txt
backup html_$nr.tar.gz      ./html      html_$nr.txt

# vim:ai sw=2

