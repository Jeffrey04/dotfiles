set -Ux EDITOR vim
set -Ux VISUAL vim

# tools installer
switch (uname)
    case Linux
        # umake
        set -Ua fish_user_paths /home/jeffrey04/.local/share/umake/bin

    case Darwin
        /usr/local/bin/brew shellenv | source
end

# starship prompt
starship init fish | source

#
# programming environment
#

# pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
set -U PYTHON_CONFIGURE_OPTS "--enable-loadable-sqlite-extensions"
set -Ua fish_user_paths $PYENV_ROOT/bin
pyenv init - | source

# rust
set -Ua fish_user_paths $HOME/.cargo/bin

# ruby
status --is-interactive; and ~/.rbenv/bin/rbenv init - fish | source

# direnv
direnv hook fish | source

# zoxide
zoxide init fish | source

# Golang
switch (uname)
    case Linux
        set -U GOROOT /home/jeffrey04/.local/share/umake/go/go-lang
        set -Ua fish_user_paths /home/jeffrey04/.local/share/umake/go/go-lang/bin
    case Darwin
        echo Hi Hexley!
end
set -U GOPATH $HOME/.go
set -Ua fish_user_paths (go env GOPATH)/bin

# aliases
alias cat=$HOME/.cargo/bin/bat
alias cd=z
alias dig=$HOME/.cargo/bin/dog
alias http=$HOME/.cargo/bin/xh
alias ls=$HOME/.cargo/bin/lsd
alias nvim='env APPIMAGELAUNCHER_DISABLE=1 $HOME/Applications/nvim.appimage'
alias vim='env APPIMAGELAUNCHER_DISABLE=1 $HOME/Applications/nvim.appimage'
alias code='env APPIMAGELAUNCHER_DISABLE=1 $HOME/.local/bin/code'
