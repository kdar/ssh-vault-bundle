#!/bin/bash

SSH_VAULT_URL="https://dl.bintray.com/nbari/ssh-vault/ssh-vault_0.10.0_linux_amd64.tar.gz"
TMP_DIR="/tmp/.ssh-vault-bundle"
BIN="/tmp/.ssh-vault-bundle/bin"

PATH=$BIN:$PATH

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

download_ssh_vault() {
  mkdir -p "$BIN";
  if command_exists curl; then
    curl -o "$TMP_DIR/ssh-vault.tar.gz" -J -L "$SSH_VAULT_URL"
  else
    if command_exists wget; then
      wget -O "$TMP_DIR/ssh-vault.tar.gz" "$SSH_VAULT_URL"
    else
      echo "you need wget or curl installed to download ssh-vault";
      exit -1;
    fi
  fi

  tar -zxvf "$TMP_DIR/ssh-vault.tar.gz" -C "$BIN" --strip-components 1
}

if command_exists ssh-vault; then
  DATA=$(echo hey | ssh-vault -k "$1" create)
  echo $DATA
else
  echo "Missing ssh-vault. Downloading and extracting..."
  download_ssh_vault
fi
