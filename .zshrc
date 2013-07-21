# set locale
export LANG=ja_JP.utf8

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

# http://d.hatena.ne.jp/hayori/20071019/1192785576
# zshのデフォルトでは改行のない文字列を表示しない。
# 混乱のもとになるので無効にする。
unsetopt promptcr

# ディレクトリ名をうつだけでcdできる。
# ..で上へあがれて便利。
setopt auto_cd

# 右側プロンプトはコピペするときに邪魔なのでやめる。
#RPROMPT="[%~]"

# Path
PATH=/usr/local/local/bin:$HOME/bin/:$PATH

# MANPATH
# http://dqn.sakusakutto.jp/2013/06/git-install-man-doc.html
export MANPATH=/usr/local/git-manpages-1.8.3.1:$MANPATH 

[ -f ~/.awsrc ] && . ~/.awsrc
## alias

# ls
alias ls='ls -F --show-control-char --color=always'
alias ll='ls -laF --show-control-char --color=always'

# pager
alias -g M='| more'

# aliases for Git
# http://qiita.com/items/1f01aa09ccf148542f21
# http://qiita.com/items/6ebcce530d9530293fec
[ -x /usr/local/git/bin/git ] && alias git='/usr/local/git/bin/git'
alias  st='git status --short --branch'
alias gst='git status --short --branch'
alias ga='git add'
alias gb='git branch'
alias gci='git commit'
alias gdi='git diff'
alias gd='git diff'
alias gdc='git diff --cached'
alias gbr='git branch'
alias gl='git l'
alias gl1='git l -1'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gf='git fetch'
alias gr='git rebase'
alias gp='pr && git push'
alias gpl='git pull --ff-only'
alias gpul='git pull --ff-only'
alias amend='git commit --amend'
alias amendc='git commit --amend --reuse-message=HEAD'
alias prune='git remote prune origin'
alias gs='git stash'
alias gsl='git stash list'
# alias的に使う関数群
# oh-my-zshのgcmを一度無効にする
unalias gcm
gcm () { git commit -m "$*" }
gsp () { git stash pop stash@{"$*"} }

# colordiff
alias cdi='colordiff'
alias cdf='colordiff'
alias -g C='| colordiff'

# nkf
alias -g E='| nkf -Ew'

alias -g ECM='E C M'

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
PROMPT="%n%F{yellow}@%m%f:%/%1(v|%F{green}%1v%f|)%% "

cd $BASE



# Cygwin用の環境設定
alias open=cygstart
export PATH="$HOME/.plenv/bin:$PATH"
eval "$(plenv init -)"
