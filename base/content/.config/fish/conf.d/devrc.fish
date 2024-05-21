#
# package manager setup
#
switch (uname)
    case Linux
        # umake
        set -Ua fish_user_paths /home/jeffrey04/.local/share/umake/bin

    case Darwin
        /usr/local/bin/brew shellenv | source
end

#
# programming environment
#

# pyenv
if test -e $HOME/.pyenv/bin/pyenv
    set -Ux PYENV_ROOT $HOME/.pyenv
    set -Ux PYTHON_CONFIGURE_OPTS "--enable-loadable-sqlite-extensions"
    set -Ua fish_user_paths $PYENV_ROOT/bin
    pyenv init - | source
end

# python
set -Ux PYTHONBREAKPOINT ipdb.set_trace

# rust
if test -e $HOME/.cargo/bin/cargo
    set -Ua fish_user_paths $HOME/.cargo/bin
end

# ruby
switch (uname)
    case Linux
        if test -e $HOME/.rbenv/bin/rbenv
            status --is-interactive; and $HOME/.rbenv/bin/rbenv init - fish | source
        end

    case Darwin
        if test -e /usr/local/bin/rbenv
            status --is-interactive; and /usr/local/bin/rbenv init - fish | source
        end
end

# Golang
switch (uname)
    case Linux
        set -U GOROOT /home/jeffrey04/.local/share/umake/go/go-lang
        set -Ua fish_user_paths /home/jeffrey04/.local/share/umake/go/go-lang/bin
        set -U GOPATH $HOME/.go
        set -Ua fish_user_paths (go env GOPATH)/bin
end

#
# environment setup
#

# direnv
if command -q direnv
    direnv hook fish | source
end

# zoxide
if command -q zoxide
    zoxide init fish | source
    alias cd=z
end

# aliases for rust applications
if test -e $HOME/.cargo/bin/cargo
    alias cat=$HOME/.cargo/bin/bat
    alias dig=$HOME/.cargo/bin/dog
    alias http=$HOME/.cargo/bin/xh
    alias ls=$HOME/.cargo/bin/lsd
end

# editor setup
switch (uname)
    case Linux
        if test -e $HOME/Applications/nvim.appimage
            alias nvim='env APPIMAGELAUNCHER_DISABLE=1 $HOME/Applications/nvim.appimage'
            alias vim='env APPIMAGELAUNCHER_DISABLE=1 $HOME/Applications/nvim.appimage'
        end

        if test -e $HOME/.local/bin/code
            alias code='env APPIMAGELAUNCHER_DISABLE=1 $HOME/.local/bin/code'
        end

    case Darwin
        alias vim=nvim
end

if functions -q nvim
    set -Ux EDITOR nvim
    set -Ux VISUAL nvim
end

# starship prompt
if command -q starship
    starship init fish | source
end