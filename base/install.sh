#!/usr/bin/env sh

cp /etc/skel/.bashrc $HOME/.bashrc

cat >> $HOME/.bashrc << EOL

# install rust utilities
# FIXME

#
# Programing environments
#
if [ -f "$HOME/.devrc" ]; then
    . "$HOME/.devrc"
fi
EOL

stow -R --target=$HOME --verbose=3 content
