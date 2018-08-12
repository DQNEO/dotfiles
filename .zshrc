export EDITOR=nano
export GOPATH=$HOME
export DOTFILES=$HOME/dotfiles
# PATH http://qiita.com/mollifier/items/42ae46ff4140251290a7
path=(
    # my bin
    $DOTFILES/bin(N-/)

    # Go tools
    $HOME/bin(N-/)

    # to build php
    /usr/local/opt/bison/bin(N-/)
    /usr/local/opt/bzip2/bin(N-/)

    # language specific
    $HOME/.yarn/bin(N-/)
    $HOME/.composer/vendor/bin(N-/)

    /usr/local/bin(N-/)
    /usr/bin /bin /usr/sbin /sbin
)

source $DOTFILES/.zshrc.history

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

source $DOTFILES/.zshrc.alias
source $DOTFILES/.zshrc.git
source $DOTFILES/.zshrc.xenv
source $DOTFILES/.zshrc.mac
source $DOTFILES/.zshrc.peco
source $DOTFILES/.zshrc.prompt
source $DOTFILES/.zshrc.gcp
source $DOTFILES/.zshrc.enterkey
source $DOTFILES/.zshrc.screen
[[ -f $HOME/.zshrc.local ]] && source $HOME/.zshrc.local
source $DOTFILES/.zshrc.profile
