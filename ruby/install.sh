#!/usr/bin/env bash

if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    sudo apt install -y libtool libyaml-dev
fi

# FIXME update to latest version
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
$HOME/.rbenv/bin/rbenv install -f 3.2.2