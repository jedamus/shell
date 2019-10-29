#!/bin/zsh

# set -x

#echo $RANDOM

wav_path=$HOME/Musik/wav

tmpfile=/tmp/play_music_wav.in.tmp
tmpfile2=/tmp/play_music_wav.out.tmp
shfile=/tmp/play_music_wav.out.sh

cd $wav_path
#ls */*/*.mp3 | sed 's/ /\\ /g' | sed "s/'/\\\\'/g" | sed 's/-/\\-/g' | sed 's/[(]/\\(/g' | sed 's/[)]/\\)/g' | sed 's/$/ \\/g' >> $tmpfile
ls *.wav | sed "s/'/\\'/g" | sed 's/\([\(\) -\&]\)/\\\1/g' | sed 's/$/ \\/g' | sed 's/\\\//\//g' | sed 's/\\\././g' > $tmpfile

randomize_file $tmpfile $tmpfile2 $RANDOM

echo "#!/bin/sh" > $shfile
echo "cd $wav_path" >> $shfile
echo -n "totem --play-pause " >> $shfile
cat $tmpfile2 | sed 's/^!//' >> $shfile
echo -n "" >> $shfile
chmod a+x $shfile
$shfile

#FILES=`cat $tmpfile2`
#totem --play-pause $FILES
