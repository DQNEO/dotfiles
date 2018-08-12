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

    # what is this ??
    $HOME/local/bin(N-/)

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

# HISTORY
## http://0xcc.net/unimag/3/
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=1000000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data
setopt extended_history
function historyall { \history -E 1 }

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

# Aliases for Unix commands
alias ls='ls -F --show-control-char --color=always'
alias ll='ls -laF --show-control-char --color=always'
alias grep='grep  --color=auto --exclude-dir={.git,.svn}'
alias grepi='grep -i'
alias cdi='colordiff'
alias cdf=cdi

# Global Aliases
alias -g M='| more'
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'


[[ -f $HOME/.zshrc.local ]] && source $HOME/.zshrc.local

# Git
# aliases for Git
# http://qiita.com/items/1f01aa09ccf148542f21
# http://qiita.com/items/6ebcce530d9530293fec
alias  st='git status --short --branch'
alias gst='git status --short --branch'
alias ga='git add'
alias gap='git add -p'
alias gb='git branch'
alias gdi='git diff'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdw='git dw'
alias gbr='git branch -r'
alias gl='git l'
alias gl1='git l -1'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcob='gcb'
alias gf='git fetch --prune'
alias grb='git rebase'
alias gr='git reset'
alias grh='git reset --hard'
alias gp='git push -u &'
alias gpl='git pull --ff-only && git delete-merged-branch'
alias amend='git commit -v --amend'
alias amendc='git commit -v --amend --reuse-message=HEAD'
alias prune='git remote prune origin'
alias gs='git stash'
alias gsl='git stash list'
alias ggrep='git grep'
alias ggrepi='git grep -i'

gcm () { git commit -m "$*" }
alias gsp='git show -p'

alias gphc='git push && hub compare'
alias comp='hub compare'

# pr () {
#     hub --noop browse
# }

# Xenv init
type plenv  >/dev/null 2>&1  && eval "$(plenv  init - --no-rehash zsh)"
type rbenv  >/dev/null 2>&1  && eval "$(rbenv  init - --no-rehash zsh)"
type phpenv >/dev/null 2>&1  && eval "$(phpenv init - --no-rehash zsh)"
type ndenv  >/dev/null 2>&1  && eval "$(ndenv  init - --no-rehash zsh)"
type xcenv  >/dev/null 2>&1  && eval "$(xcenv  init - zsh)"

# Golang
export GOPATH=$HOME

# for MacOS
if [[ /Users/$USER = $HOME ]]; then
    [[ -x /usr/local/git/bin/git ]] && alias git='/usr/local/git/bin/git'

    # require `brew install binutils coreutils findutils`
    export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
    export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
    # findutils
    alias find=gfind
    alias xargs=gxargs

    # warn if linux commands are hit
    alias ldd="echo ldd is not on OSX. use otool -L."
    alias strace="echo strace is not on OSX. use dtruss"

fi

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

# peco
## peco + ghq
# Ctl + xx to search repo
# http://qiita.com/strsk/items/9151cef7e68f0746820d
function peco-src () {
    local ghq_root=$HOME/src
    local selected_dir=$(find $ghq_root -follow  -maxdepth 3 -mindepth 3 -type d | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-src && bindkey '^x^x' peco-src

# Ctl + xp to open phpstorm
function peco-pstorm () {
    local ghq_root=$HOME/src
    local selected_dir=$(find $ghq_root -follow  -maxdepth 3 -mindepth 3 -type d | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="pstorm ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-pstorm && bindkey '^x^p' peco-pstorm

# Ctl + xb to git branch
function peco-git-branch () {
    local selected=$(git branch | peco --query "$LBUFFER")
    if [ -n "$selected" ]; then
        BUFFER="git checkout ${selected}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-git-branch && bindkey '^x^b' peco-git-branch


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


# customize prompt for Git
# autoload -Uz vcs_info
#
#precmd () {
#    psvar=()
#    LANG=en_US.UTF-8 vcs_info
#    psvar[1]=$vcs_info_msg_0_
#}
## ROMPT
#autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null
#setopt prompt_subst

# Google Cloud SDK(GCP)
GOOGLE_CLOUD_SDK=$HOME/Downloads/google-cloud-sdk
if [[ -d $GOOGLE_CLOUD_SDK ]]; then
   ## updates PATH for the Google Cloud SDK.
   source  $GOOGLE_CLOUD_SDK/path.zsh.inc
   ## The next line enables shell command completion for gcloud.
   source  $GOOGLE_CLOUD_SDK/completion.zsh.inc
fi


# benchmark zshrc
function bench-zsh {
    for i in $(seq 1 10)
    do
        time zsh -i -c exit
    done
}

# zsh profiling
if (which zprof > /dev/null 2>&1) ;then
   zprof
fi
