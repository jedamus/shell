#/bin/sh

# erzeugt Montag, 19. Dezember 2022 12:35 (C) 2022 von Leander Jedamus
# modifiziert Montag, 19. Dezember 2022 12:45 von Leander Jedamus

tmpdir="/tmp"
docker_output="$tmpdir/update_docker.$$.output"
docker_image_list="$tmpdir/update_docker.$$.list"

call_docker()
{
  #echo $*
  for image in $*; do
    echo
    echo "------------------------------"
    echo "docker pull $image"
    docker pull $image
    echo "------------------------------"
  done
}

docker image ls > $docker_output

awk -F\  -e "{print \$1}" < $docker_output > $docker_image_list

call_docker $(cat $docker_image_list)

rm $docker_output $docker_image_list
