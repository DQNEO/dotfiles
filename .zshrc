skip_global_compinit=1

source $HOME/dotfiles/.require_oh-my-zsh

# set locale
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8

# zsh-completions
# brew,vagrantなど非標準コマンドを保管してくる便利なやつ
#
# brew installしておく必要がある。
# $ brew install zsh-completions
# autoload -Uz compinitより前にfpathを設定する必要がある。
fpath=(/usr/local/share/zsh-completions(N-/) $fpath)

# compinit is called somehwere else where I don't know :(
#autoload -U compinit
#compinit

# http://0xcc.net/unimag/3/
# keybind like Emacs
bindkey -e

# http://0xcc.net/unimag/3/
zstyle ':completion:*:default' menu select=1

# customize history
# http://journal.mycom.co.jp/column/zsh/003/index.html

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=1000000
#setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

# http://0xcc.net/unimag/3/#foottext-6
setopt extended_history
function history-all { \history -E 1 }
alias historyall='history-all'

# correct機能はウザイので無効に
# http://nojobu.blogspot.jp/2013/03/zsh-correct.html
unsetopt correctall

# ディレクトリ名をうつだけでcdできる。
# ..で上へあがれて便利。
setopt auto_cd

# 右側プロンプトはコピペするときに邪魔なのでやめる。
#RPROMPT="[%~]"

## alias
#alias ls='ls -F --show-control-char --color=always'
#alias ll='ls -laF --show-control-char --color=always'
# less to show utf8
export LESSCHARSET=utf-8

# Global Aliases
alias -g M='| more'
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g C='| colordiff'
alias v='vagrant'
alias kc='kubectl'

alias grep='grep  --color=auto --exclude-dir={.git,.svn}'
alias grepi='grep -i'

# aliases for Git
# http://qiita.com/items/1f01aa09ccf148542f21
# http://qiita.com/items/6ebcce530d9530293fec
[ -x /usr/local/git/bin/git ] && alias git='/usr/local/git/bin/git'
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
alias grh >/dev/null && unalias grh
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

# alias的に使う関数群
# oh-my-zshのgcmを一度無効にする
alias gcm 1>/dev/null && unalias gcm

gcm () { git commit -m "$*" }
alias gsp='git show -p'

alias gphc='git push && hub compare'
alias comp='hub compare'
# pr () {
#     hub --noop browse
# }
# for Mac
#alias opr='open $(pr)'

# colordiff
alias cdi='colordiff'
alias cdf='colordiff'

# setting shell variables
MYNICKNAME=dqneo

# for Git
# http://d.hatena.ne.jp/mollifier/20100906/p1
# http://d.hatena.ne.jp/mollifier/20090814/p1
autoload -Uz is-at-least

autoload -Uz vcs_info
#
#precmd () {
#    psvar=()
#    LANG=en_US.UTF-8 vcs_info
#    psvar[1]=$vcs_info_msg_0_
#}

# PATHを設定
# http://qiita.com/mollifier/items/42ae46ff4140251290a7
#
path=(
    /usr/local/bin(N-/)
    $HOME/dotfiles/bin(N-/)
    $HOME/.rbenv/bin(N-/)
    $HOME/.plenv/bin(N-/)
    $HOME/.phpenv/bin(N-/)
#    $HOME/.xcenv/bin(N-/)
    $HOME/.composer/vendor/bin(N-/)
    $HOME/local/bin(N-/)
    $HOME/bin(N-/)

    /usr/bin
    /bin
    /usr/sbin
    /sbin
)

# plenv用の設定
if type plenv >/dev/null 2>&1; then
  eval "$(plenv init - --no-rehash zsh)"
fi

# rbenv
if type rbenv >/dev/null 2>&1; then
  eval "$(rbenv init - --no-rehash zsh)"
fi

if type phpenv >/dev/null 2>&1; then
    eval "$(phpenv init - --no-rehash zsh)"
fi

if type xcenv >/dev/null 2>&1; then
    eval "$(xcenv init - zsh)"
fi

# MANPATH
# http://dqn.sakusakutto.jp/2013/06/git-install-man-doc.html

# EDITOR
export EDITOR=nano

# エンターキーでlsとgit status
# http://qiita.com/yuyuchu3333/items/e9af05670c95e2cc5b4d
function do_enter() {
    if [ -n "$BUFFER" ]; then
        zle accept-line
        return 0
    fi
    echo
    ls
    # ↓おすすめ
    # ls_abbrev
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

## ROMPT
#autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

[[ -f $HOME/.zshrc.local ]] && source $HOME/.zshrc.local

# clone
# Usage DQNEO/project
function clone () {
    name=$1
    git clone git@github.com:${name}.git
}

## ブランチ名をパーズしてissuenoを取得
function get_issueno() {
    git branch | grep '^*'  | awk '{print $2}' | awk -F _ '{print $2}'
}

function cm() {
    issueno=$(get_issueno)
    if [ "$issueno" ] ; then
	git commit -m "refs #$issueno $*"
    else
	echo "cannot get issueno" >&2
	return 1
    fi
}

function review() {
    local ref=$1
    if [[ ! $ref ]]; then
        ref=origin/master
    fi

    git diff $ref...
}

# z
# naoya氏のブログで知った。
# http://d.hatena.ne.jp/naoya/20130108/1357630895
if which brew 1>/dev/null 2>/dev/null ; then
    . `brew --prefix`/etc/profile.d/z.sh
fi

# OSXの場合はそれ用のファイルを読み込む
if [[ $(uname) = "Darwin" ]]; then
    source ~/dotfiles/.zshrc_osx
fi

# peco & ghq
# Ctl + xx でローカルのレポジトリ検索できる
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
zle -N peco-src
bindkey '^x^x' peco-src

# peco & ghq
# Ctl + xp でpstormを開く
function peco-pstorm () {
    local ghq_root=$HOME/src
    local selected_dir=$(find $ghq_root -follow  -maxdepth 3 -mindepth 3 -type d | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="pstorm ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-pstorm
bindkey '^x^p' peco-pstorm

function peco-git-branch () {
    local selected=$(git branch | peco --query "$LBUFFER")
    if [ -n "$selected" ]; then
        BUFFER="git checkout ${selected}"
        zle accept-line
    fi
    zle clear-screen
}

zle -N peco-git-branch
bindkey '^x^b' peco-git-branch

# Screenのwindow名を自動でセットする
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

if [[ -d $HOME/.ndenv ]]; then
    export PATH="$HOME/.ndenv/bin:$PATH"
    eval "$(ndenv init -)"
fi

if type direnv >/dev/null; then
    eval "$(direnv hook zsh)"
fi

export GOPATH=$HOME

## Docker
alias d='docker'
alias de='docker exec'

# .yarn/bin
export PATH="$HOME/.yarn/bin:$PATH"

# GCP
## The next line updates PATH for the Google Cloud SDK.
GOOGLE_CLOUD_SDK=$HOME/Downloads/google-cloud-sdk
if [ -f $GOOGLE_CLOUD_SDK/path.zsh.inc ]; then
  source  $GOOGLE_CLOUD_SDK/path.zsh.inc
fi

## The next line enables shell command completion for gcloud.
if [ -f $GOOGLE_CLOUD_SDK/completion.zsh.inc ]; then
  source  $GOOGLE_CLOUD_SDK/completion.zsh.inc
fi

# for phpbuild
export PATH="/usr/local/opt/bison/bin:$PATH"
export PATH="/usr/local/opt/bzip2/bin:$PATH"

PATH="/Users/DQNEO/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/DQNEO/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/DQNEO/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/DQNEO/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/DQNEO/perl5"; export PERL_MM_OPT;

# zcompile
# https://qiita.com/vintersnow/items/7343b9bf60ea468a4180
if [ ~/.zshrc -nt ~/.zshrc.zwc ]; then
    zcompile ~/.zshrc
fi

if (which zprof > /dev/null 2>&1) ;then
    zprof
fi
