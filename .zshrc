source $HOME/dotfiles/.require_oh-my-zsh

# set locale
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8

# http://journal.mycom.co.jp/column/zsh/001/index.html
autoload -U compinit
compinit

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
function history-all { history -E 1 }
function historyall  { history -E 1 }

# correct機能はウザイので無効に
# http://nojobu.blogspot.jp/2013/03/zsh-correct.html
unsetopt correctall

# ディレクトリ名をうつだけでcdできる。
# ..で上へあがれて便利。
setopt auto_cd

# 右側プロンプトはコピペするときに邪魔なのでやめる。
#RPROMPT="[%~]"

# Path
PATH=/usr/local/bin:$HOME/bin:$PATH

# MANPATH
# http://dqn.sakusakutto.jp/2013/06/git-install-man-doc.html

# for Mac OSX
# http://qiita.com/kawaz/items/952cb1a86b1da77cd7ab
# coreutils
if [ -x /usr/local/bin/brew ] ; then
    export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
    export MANPATH="$(brew --prefix coreutils)/libexec/gnuman:$MANPATH"
    # findutils
    alias find=gfind
    alias xargs=gxargs
fi


[ -f ~/.awsrc ] && . ~/.awsrc
## alias

alias ls='ls -F --show-control-char --color=always'
alias ll='ls -laF --show-control-char --color=always'

# less to show utf8
export LESSCHARSET=utf-8

# Global Aliases
alias -g M='| more'
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g C='| colordiff'
alias -g E='| nkf -Ew'
alias -g ECM='E C M'

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
alias gbr='git branch'
alias gl='git l'
alias gl1='git l -1'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcob='gcb'
alias gf='git fetch'
alias grb='git rebase'
alias grs='git reset'
alias gp='pr ;git push -u &'
alias gpl='git pull --ff-only && git delete-merged-branch'
alias amend='git commit -v --amend'
alias amendc='git commit -v --amend --reuse-message=HEAD'
alias prune='git remote prune origin'
alias gs='git stash'
alias gsl='git stash list'
# alias的に使う関数群
# oh-my-zshのgcmを一度無効にする
unalias gcm
gcm () { git commit -m "$*" }
gsp () { git stash pop stash@{"$*"} }

pr () {
    # "組織名/プロジェクト名"を取得。e.g. sen-corporation/8122
    url=$(git remote -v | head -1 | awk '{print $2}')
    org_repo_name=$( echo $url| sed -e s#git@github.com:## | sed -e s#.git## )

    # カレントブランチ名を取得
    current_branch=$( git branch | grep '^*' | awk '{print $2}' )

    # プルリク用URLを生成
    echo https://github.com/$org_repo_name/pull/new/$current_branch
}

# for Mac
alias opr='open $(pr)'

# colordiff
alias cdi='colordiff'
alias cdf='colordiff'

# setting shell variables
MYNICKNAME=dqneo


if [ -e ~/perl5/perlbrew/etc/bashrc ]; then
    source ~/perl5/perlbrew/etc/bashrc
fi

# for Git
# http://d.hatena.ne.jp/mollifier/20100906/p1
# http://d.hatena.ne.jp/mollifier/20090814/p1
autoload -Uz is-at-least

autoload -Uz vcs_info
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    psvar[1]=$vcs_info_msg_0_
}


# プロンプトの色付けは下記記事がわかりやすい
# http://www.sakito.com/2011/11/zsh.html
#PROMPT="%n%F{yellow}@%m%f:%/%1(v|%F{green}%1v%f|)%% "

if [ -n "$BASE" ] ; then
    cd $BASE
fi




# Cygwin用の環境設定
#alias open=cygstart

# plenv用の設定
if [ -e /opt/plenv  ] ; then
  export PATH="/opt/plenv/bin:/opt/plenv/shims:$PATH"
  eval "$(plenv init - zsh)"
elif [ -e $HOME/.plenv ] ; then
  export PATH="$HOME/.plenv/bin:$HOME/.plenv/shims:$PATH"
  eval "$(plenv init - zsh)"
fi

# rbenv
if [ -d $HOME/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
  eval "$(rbenv init - zsh)"
fi

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
zle -N do_enter
bindkey '^m' do_enter

## ROMPT
autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

[[ -f $HOME/.zshrc.local ]] && source $HOME/.zshrc.local

# clone
# Usage DQNEO/project
function clone () {
    name=$1
    git clone git@github.com:${name}.git
}

# C言語プログラムを即時実行するためのコマンド
# see http://dqn.sakusakutto.jp/2013/07/runc.html
function runc() {
    local progname=$1
    shift
    gcc -Wall $progname -o /tmp/a.out && /tmp/a.out "$@"
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

# z
# naoya氏のブログで知った。
# http://d.hatena.ne.jp/naoya/20130108/1357630895
. `brew --prefix`/etc/profile.d/z.sh
