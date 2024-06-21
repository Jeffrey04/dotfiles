#!/usr/bin/env bash

sudo apt install -y libtool

# FIXME update to latest version
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
$HOME/.rbenv/bin/rbenv install -f 3.2.2