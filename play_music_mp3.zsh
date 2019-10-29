#!/bin/zsh

# set -x

#echo $RANDOM

mp3_path=$HOME/Musik/mp3/stick/mp3
mp3_what="*/*/*.mp3"

tmpfile=/tmp/play_music_mp3.in.tmp
tmpfile2=/tmp/play_music_mp3.out.tmp
shfile=/tmp/play_music_mp3.sh

cd $mp3_path
ls ${~mp3_what} | sed "s/'/\\'/g" | sed 's/\([\(\) -\&]\)/\\\1/g' | sed 's/$/ \\/g' | sed 's/\\\//\//g' | sed 's/\\\././g' > $tmpfile

randomize_file $tmpfile $tmpfile2 $RANDOM

echo "#!/bin/sh" > $shfile
echo "cd $mp3_path" >> $shfile
echo -n "totem --play-pause " >> $shfile
cat $tmpfile2 | sed 's/^!//' >> $shfile
echo -n "" >> $shfile
chmod a+x $shfile
$shfile

#FILES=`cat $tmpfile2`
#totem --play-pause $FILES
