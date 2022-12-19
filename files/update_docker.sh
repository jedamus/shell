#/bin/sh

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

docker image ls > test

awk -F\  -e "{print \$1}" < test > test2

call_docker $(cat test2)
