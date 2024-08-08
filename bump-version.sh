#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <version>"
  exit 1
fi

echo "$1" > version.txt

echo "Bumped version number to $1"