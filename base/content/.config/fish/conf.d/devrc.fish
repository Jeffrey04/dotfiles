set -Ux EDITOR vim
set -Ux VISUAL vim

# starship prompt
starship init fish | source

#
# programming environment
#

# rust
set -Ua fish_user_paths $HOME/.cargo/bin

# ruby
status --is-interactive; and ~/.rbenv/bin/rbenv init - fish | source

# direnv
direnv hook fish | source

# Golang
set -U GOROOT /home/jeffrey04/.local/share/umake/go/go-lang
set -U GOPATH $HOME/.go
set -Ua fish_user_paths /home/jeffrey04/.local/share/umake/go/go-lang/bin
set -Ua fish_user_paths (go env GOPATH)/bin

# umake
set -Ua fish_user_paths /home/jeffrey04/.local/share/umake/bin

# pyenv
pyenv init - | source

# aliases
alias cat=$HOME/.cargo/bin/bat
alias dig=$HOME/.cargo/bin/dog
alias http=$HOME/.cargo/bin/xh
alias ls=$HOME/.cargo/bin/lsd
alias nvim=$HOME/Applications/nvim.appimage
alias vim=$HOME/Applications/nvim.appimage
