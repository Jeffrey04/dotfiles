#!/usr/bin/env bash

# resetting profile and bashrc
if [ -f /etc/skel/.bashrc ]; then
    cp /etc/skel/.bashrc $HOME/.bashrc
    cp /etc/skel/.profile $HOME/.profile
else
    cat > $HOME/.profile << 'EOF'
# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
EOF
    echo > $HOME/.bashrc
fi

if [ "$(uname)" == "Darwin" ]; then
    # Homebrew
    brew install --force direnv

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Ubuntu make installation of Go Lang
    sudo apt install -y direnv

fi

cat >> $HOME/.bashrc << 'EOF'

#
# Programing environments
#
if [ -f "$HOME/.devrc" ]; then
    . "$HOME/.devrc"
fi
EOF

stow -R --target=$HOME --verbose=3 content
