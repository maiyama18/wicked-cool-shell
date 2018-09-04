#!/bin/bash

function validint() {
  number=$1; min=$2; max=$3

  if [ -z "$number" ]; then
    echo "INVALID: input is empty"
    return 1
  fi

  if [[ ! $number =~ ^-?[1-9][0-9]*$ ]]; then
    echo "INVALID: input includes non-digit"
    return 1
  fi

  if [ ! -z "$min" ] && [ $number -lt $min ]; then
    echo "INVALID: input is smaller than min value: $min"
    return 1
  fi

  if [ ! -z "$max" ] && [ $number -gt $max ]; then
    echo "INVALID: input is larger than min value: $max"
    return 1
  fi

  return 0
}

if validint "$1" "$2" "$3"; then
  echo "VALID"
fi
