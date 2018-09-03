#!/bin/bash

validAlNum() {
    validChars=$(echo $1 | sed -e 's/[^0-9a-zA-Z]//g')

    if [ "$validChars" != "$1" ]; then
        return 1
    else 
        return 0
    fi
}

echo -n "Enter input: "
read input

if validAlNum $input; then
    echo "Input is valid"
    exit 0
else
    echo "Input is NOT valid: it includes characters other than alphanumeric"
    exit 1
fi 
