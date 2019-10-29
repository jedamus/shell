#!/bin/bash

# set -x

#echo $RANDOM

wav_path=$HOME/Musik/wav
wav_what=*.wav

tmpfile=/tmp/play_music_wav.in.tmp
tmpfile2=/tmp/play_music_wav.out.tmp
shfile=/tmp/play_music_wav.sh

cd $wav_path
ls $wav_what | sed "s/'/\\'/g" | sed 's/\([\(\) -\&]\)/\\\1/g' | sed 's/$/ \\/g' | sed 's/\\\//\//g' | sed 's/\\\././g' > $tmpfile

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
