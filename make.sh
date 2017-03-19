#!/bin/bash

rm -rf dist
mkdir -p dist
rm dish.sh

set -e

if [ $# -eq 0 ]; then
  ./vendor/ssh-vault/ssh-vault create ./dist/payload
else
  ./vendor/ssh-vault/ssh-vault -k "$1" create ./dist/payload
fi

cp ./vendor/ssh-vault/ssh-vault ./dist
cp ./run.sh ./dist

./vendor/makeself/makeself.sh --gzip ./dist dist.sh "" ./run.sh
