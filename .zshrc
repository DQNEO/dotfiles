# zshrc reborn

export EDITOR=nano
export GOPATH=$HOME

# PATH http://qiita.com/mollifier/items/42ae46ff4140251290a7
path=(
    # my bin
    $HOME/dotfiles/bin(N-/)

    # Go tools
    $HOME/bin(N-/)

    # to build php
    /usr/local/opt/bison/bin(N-/)
    /usr/local/opt/bzip2/bin(N-/)

    # language specific
    $HOME/.yarn/bin(N-/)
    $HOME/.composer/vendor/bin(N-/)

    /usr/local/bin(N-/)
    /usr/bin
    /bin
    /usr/sbin
    /sbin
)

source $HOME/dotfiles/.zshrc.history

# Completion
autoload -U compinit
compinit -C
## http://0xcc.net/unimag/3/
zstyle ':completion:*:default' menu select=1

# Auto CD
## make typing a directory name invoke `cd`.
## `..`  is useful
setopt auto_cd
# z http://d.hatena.ne.jp/naoya/20130108/1357630895
[[ /usr/local/etc/profile.d/z.sh ]] && source /usr/local/etc/profile.d/z.sh

source $HOME/dotfiles/.zshrc.alias
source $HOME/dotfiles/.zshrc.git
source $HOME/dotfiles/.zshrc.xenv
source $HOME/dotfiles/.zshrc.mac
source $HOME/dotfiles/.zshrc.peco
source $HOME/dotfiles/.zshrc.prompt
source $HOME/dotfiles/.zshrc.gcp
source $HOME/dotfiles/.zshrc.enterkey
source $HOME/dotfiles/.zshrc.screen

[[ -f $HOME/.zshrc.local ]] && source $HOME/.zshrc.local
source $HOME/dotfiles/.zshrc.profile
