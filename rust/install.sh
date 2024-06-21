#!/usr/bin/env bash

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

if [ "$(uname)" == "Darwin" ]; then
    brew install --force cmake
fi

$HOME/.cargo/bin/cargo install --git https://github.com/ogham/dog dog
$HOME/.cargo/bin/cargo install bat xh lsd zoxide starship