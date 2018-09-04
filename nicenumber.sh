#!/bin/bash

function nicenumber() {
  number=$1; dd=${2:-.}; td=${3:-,}

  integer=$(echo $number | cut -d. -f1)
  decimal=$(echo $number | cut -d. -f2)

  result=""
  if [ "$decimal" != "$number" ]; then
    result=${dd}${decimal}
  fi

  while [ $integer -ge 999 ]; do
    remainder=$(($integer % 1000))
    if [ ${#remainder} -lt 3 ]; then
      reminder=0${reminder}
    fi
    result=${td}${remainder}${result}
    integer=$(($integer / 1000))
  done

  result=${integer}${result}
  echo $result
}

while getopts d:t: opt; do
  case $opt in
    d ) dd="$OPTARG" ;;
    t ) td="$OPTARG" ;;
  esac
done
shift $(($OPTIND - 1))

if [ $# -eq 0 ]; then
  echo "Usage ${basename $0} [-d c] [-t c] number"
  exit 1
fi

nicenumber $1 $dd $td