#!/bin/zsh

#echo $RANDOM

tmpfile=/tmp/play_music.in.tmp
tmpfile2=/tmp/play_music.out.tmp

cd $HOME/Musik/mp3/stick/mp3
#echo -n "totem --play-pause " > $tmpfile
echo -n "" > $tmpfile
#ls */*/*.mp3 | sed 's/ /\\ /g' | sed "s/'/\\\\'/g" | sed 's/-/\\-/g' | sed 's/[(]/\\(/g' | sed 's/[)]/\\)/g' | sed 's/$/ \\/g' >> $tmpfile
ls */*/*.mp3 | sed "s/'/\\'/g" | sed 's/\([\(\) -\&\!]\)/\\\1/g' | sed 's/$/ \\/g' | sed 's/\\\//\//g' | sed 's/\\\././g' >> $tmpfile

randomize_file $tmpfile $tmpfile2 $RANDOM

#FILES=`cat $tmpfile2`
#totem --play-pause $FILES
