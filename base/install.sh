#!/usr/bin/env sh

if [ -f /etc/skel/.bashrc ]; then
    cp /etc/skel/.bashrc $HOME/.bashrc
else
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
