#!/bin/bash

normalizeMonth() {
    month=$1
    if [ -z $(echo $month | sed -e 's/[0-9]//g') ]; then
        return monthNumToName $month        
    fi

    return $(echo ${month:0:1} | tr '[a-z]' '[A-Z]')$(echo ${month:1} | tr '[A-Z]' '[a-z]')
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

month=normalizeMonth $month