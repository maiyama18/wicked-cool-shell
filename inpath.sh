#!/bin/bash

inPath() {
    cmd=$1

    for directory in ${PATH//:/ }; do
        if [ -x "$directory/$cmd" ]; then
            return 0
        fi
    done

    return 1
}

checkForCmdInPath() {
    var=$1
    if [ "$var" != "" ]; then
        if [ ${var:0:1} == "/" ]; then
            if [ ! -x $var ]; then
                return 1
            fi
        elif ! inPath $var; then
            return 2
        fi
    fi
}

readonly SCRIPT_NAME=${0##*/}

if [ $# -ne 1 ]; then
    echo "Usage: ${SCRIPT_NAME} command" >&2
    exit 1
fi

checkForCmdInPath $1
case $? in
    0 ) echo "$1 found in PATH" ;;
    1 ) echo "$1 not found or not executable" ;;
    2 ) echo "$1 not found in PATH" ;;
esac

exit 0
