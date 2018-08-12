# zshrc reborn

# EDITOR
export EDITOR=nano

# PATH
# http://qiita.com/mollifier/items/42ae46ff4140251290a7
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

# Golang
export GOPATH=$HOME

source $HOME/dotfiles/.zshrc.mac

# Enter key for  ls and git status
# http://qiita.com/yuyuchu3333/items/e9af05670c95e2cc5b4d
function do_enter() {
    if [ -n "$BUFFER" ]; then
        zle accept-line
        return 0
    fi
    echo
    ls
    # ls_abbrev (Recommended)
    if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
        echo
        echo -e "\e[0;33m--- git status ---\e[0m"
        git status -sb
    fi
    zle reset-prompt
    return 0
}
#zle -N do_enter
#bindkey '^m' do_enter

source $HOME/dotfiles/.zshrc.peco

# set Screen window name automatically
# http://ogawa.s18.xrea.com/tdiary/20080331.html
case "${TERM}" in screen)
                      preexec() {
                          echo -ne "\ek#${1%% *}\e\\"
                      }
                      precmd() {
                          _basename=$(basename "$(pwd)")
                          echo -ne "\ek$_basename\e\\"
                      }
esac

source $HOME/dotfiles/.zshrc.prompt

source $HOME/dotfiles/.zshrc.gcp

[[ -f $HOME/.zshrc.local ]] && source $HOME/.zshrc.local

source $HOME/dotfiles/.zshrc.profile
