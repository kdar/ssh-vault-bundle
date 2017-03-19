#!/bin/bash

set -e

if [ $# -eq 0 ]; then
  if [ -f ~/.ssh/id_rsa ]; then
    ./ssh-vault -k ~/.ssh/id_rsa view ./payload
  else
    echo "Please pass in your rsa private key location. e.g.: $0 /location/to/id_rsa"
  fi
else
  keypath=$1
  if [[ "$keypath" != /* ]]; then
    keypath="$USER_PWD/$1"
  fi
  ./ssh-vault -k "$keypath" view ./payload
fi