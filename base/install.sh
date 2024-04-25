#!/usr/bin/env bash

if [ -f /etc/skel/.bashrc ]; then
    cp /etc/skel/.bashrc $HOME/.bashrc
else
    cat > $HOME/.profile <<EOL
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
EOL
    touch $HOME/.bashrc
fi

# install rust utilities
# FIXME

cat >> $HOME/.bashrc << EOL

#
# Programing environments
#
if [ -f "$HOME/.devrc" ]; then
    . "$HOME/.devrc"
fi
EOL

stow -R --target=$HOME --verbose=3 content
