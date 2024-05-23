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

# install direnv
if [ "$(uname)" == "Darwin" ]; then
    brew install --force direnv

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    sudo apt install -y direnv

fi


# install umake
if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    if command -v snap &>/dev/null; then
        sudo snap install ubuntu-make --classic
    fi

    if command -v umake &>/dev/null; then
        cat >> $HOME/.profile << 'EOF'

# Ubuntu make installation of Ubuntu Make binary symlink
PATH=/home/jeffrey04/.local/share/umake/bin:$PATH
EOF

    fi
fi


# lastly source custom environment
cat >> $HOME/.bashrc << 'EOF'

#
# Programing environments
#
if [ -f "$HOME/.devrc" ]; then
    . "$HOME/.devrc"
fi
EOF

stow -R --target=$HOME --verbose=3 content
