#!/bin/bash

rm -rf dist
mkdir -p dist

./vendor/ssh-vault/ssh-vault -k "out.key.pub" create ./dist/payload
cp ./vendor/ssh-vault/ssh-vault ./dist
cp run.sh /dist

./vendor/makeself/makeself.sh ./dist dist.sh "" ./run.sh