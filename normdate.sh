#!/bin/bash

monthNumToName() {
    monthNum=$1
    case $monthNum in
        1 ) echo "Jan" ;; 2 ) echo "Feb" ;; 3 ) echo "Mar" ;;
        4 ) echo "Apr" ;; 5 ) echo "May" ;; 6 ) echo "Jun" ;;
        7 ) echo "Jul" ;; 8 ) echo "Aug" ;; 9 ) echo "Sep" ;;
        10) echo "Oct" ;; 11) echo "Nov" ;; 12) echo "Dec" ;;
        * ) echo "Invalid month value: $monthNum"
            exit 1
    esac
}
normalizeMonth() {
    month=$1
    if [ -z $(echo $month | sed -e 's/[0-9]//g') ]; then
        echo $(monthNumToName $month)
    else
        echo $(echo ${month:0:1} | tr '[a-z]' '[A-Z]')$(echo ${month:1} | tr '[A-Z]' '[a-z]')
    fi
}

readonly SCRIPT_NAME=${0##*/}

if [ $# -ne 3 ]; then
    echo "Usage: ${SCRIPT_NAME} month day year" >&2
    exit 1
fi

month=$1
day=$2
year=$3

if [ $year -le 99 ]; then
    echo "${SCRIPT_NAME}: expect 4-digit year value" >&2
    exit 1
fi

month=$(normalizeMonth $month)
echo $month $day $year
