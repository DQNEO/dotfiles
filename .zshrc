export LC_ALL=en_US.UTF-8
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

    # x-env
    $HOME/.phpenv/bin/(N-/)

    # mysql
    /usr/local/opt/mysql-client/bin
    
    /usr/local/bin(N-/)
    /usr/local/sbin(N-/)
    /usr/bin /bin /usr/sbin /sbin
)

source $DOTFILES/.zshrc.history

# Completion
autoload -U compinit
compinit -C
## http://0xcc.net/unimag/3/
zstyle ':completion:*:default' menu select=1

source $DOTFILES/.zshrc.cd
source $DOTFILES/.zshrc.alias
source $DOTFILES/.zshrc.git
source $DOTFILES/.zshrc.xenv
source $DOTFILES/.zshrc.mac
source $DOTFILES/.zshrc.peco
source $DOTFILES/.zshrc.prompt
source $DOTFILES/.zshrc.gcp
source $DOTFILES/.zshrc.screen
source $DOTFILES/.zshrc.perl

[[ -f $HOME/.zshrc.local ]] && source $HOME/.zshrc.local
source $DOTFILES/.zshrc.profile
