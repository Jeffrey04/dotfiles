#!/usr/bin/env bash

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
brew install --force cmake
cargo install --git https://github.com/ogham/dog dog
cargo install bat xh lsd zoxide starship