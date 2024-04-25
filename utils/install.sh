#!/usr/bin/env bash

# skipping stow due to partial migration
ln -s $PWD/content/.local/bin/ssh $HOME/.local/bin/ssh
ln -s $PWD/content/.ssh/ssh-ident $HOME/.ssh/ssh-ident