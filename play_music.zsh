#!/bin/zsh

#echo $RANDOM

tmpfile=/tmp/play_music.tmp

cd $HOME/Musik/mp3/stick/mp3
echo -n "totem --play-pause " > $tmpfile
#ls */*/*.mp3 | sed 's/ /\\ /g' | sed "s/'/\\\\'/g" | sed 's/-/\\-/g' | sed 's/[(]/\\(/g' | sed 's/[)]/\\)/g' | sed 's/$/ \\/g' >> $tmpfile
ls */*/*.mp3 | sed "s/'/\\'/g" | sed 's/\([\(\) -&!]\)/\\\1/g' | sed 's/$/ \\/g' >> $tmpfile
echo "" >> $tmpfile
#FILES=`cat $tmpfile`
#totem --play-pause $FILES
