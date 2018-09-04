#!/bin/bash

plus1() {
    echo $(($1 + 1))
    return $(($1 + 1))
}

gen() {
    echo 4
    echo 5
    exit 1
}

echo $(gen)

echo finish