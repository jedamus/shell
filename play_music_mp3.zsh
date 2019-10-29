#!/bin/zsh

#echo $RANDOM

mp3_path=$HOME/Musik/mp3/stick/mp3

tmpfile=/tmp/play_music.in.tmp
tmpfile2=/tmp/play_music.middle.tmp
tmpfile3=/tmp/play_music.out.tmp

cd $mp3_path
#ls */*/*.mp3 | sed 's/ /\\ /g' | sed "s/'/\\\\'/g" | sed 's/-/\\-/g' | sed 's/[(]/\\(/g' | sed 's/[)]/\\)/g' | sed 's/$/ \\/g' >> $tmpfile
ls */*/*.mp3 | sed "s/'/\\'/g" | sed 's/\([\(\) -\&]\)/\\\1/g' | sed 's/$/ \\/g' | sed 's/\\\//\//g' | sed 's/\\\././g' > $tmpfile

randomize_file $tmpfile $tmpfile2 $RANDOM
echo "cd $mp3_path" > $tmpfile3
echo -n "totem --play-pause " >> $tmpfile3
cat $tmpfile2 | sed 's/^!//' >> $tmpfile3
echo -n "" >> $tmpfile3

#FILES=`cat $tmpfile2`
#totem --play-pause $FILES
