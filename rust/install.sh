#!/usr/bin/env bash

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

if [ "$(uname)" == "Darwin" ]; then
    brew install --force cmake
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    sudo apt install -y cmake
fi

$HOME/.cargo/bin/cargo install bat xh lsd zoxide starship just dns-doge
