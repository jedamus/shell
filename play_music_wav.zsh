#!/bin/zsh

#echo $RANDOM

wav_path=$HOME/Musik/wav

tmpfile=/tmp/play_music_wav.in.tmp
tmpfile2=/tmp/play_music_wav.middle.tmp
tmpfile3=/tmp/play_music_wav.out.tmp

cd $wav_path
#ls */*/*.mp3 | sed 's/ /\\ /g' | sed "s/'/\\\\'/g" | sed 's/-/\\-/g' | sed 's/[(]/\\(/g' | sed 's/[)]/\\)/g' | sed 's/$/ \\/g' >> $tmpfile
ls *.wav | sed "s/'/\\'/g" | sed 's/\([\(\) -\&]\)/\\\1/g' | sed 's/$/ \\/g' | sed 's/\\\//\//g' | sed 's/\\\././g' > $tmpfile

randomize_file $tmpfile $tmpfile2 $RANDOM
echo "#!/bin/sh" > $tmpfile3
echo "cd $wav_path" >> $tmpfile3
echo -n "totem --play-pause " >> $tmpfile3
cat $tmpfile2 | sed 's/^!//' >> $tmpfile3
echo -n "" >> $tmpfile3
chmod a+x $tmpfile3
$tmpfile3

#FILES=`cat $tmpfile2`
#totem --play-pause $FILES
