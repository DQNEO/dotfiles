# http://journal.mycom.co.jp/column/zsh/001/index.html
autoload -U compinit
compinit 

PATH=/usr/local/pgsql/bin:$HOME/bin/:$PATH


# customize history
# http://journal.mycom.co.jp/column/zsh/003/index.html

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=100000
#setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data 

# http://0xcc.net/unimag/3/#foottext-6
setopt extended_history 
function history-all { history -E 1 }


# customize prompt 
# http://journal.mycom.co.jp/column/zsh/002/index.html
PROMPT="%n:%/%% "
RPROMPT="[%~]"



# alias
alias ls='ls -F --show-control-char --color=always'
alias ll='ls -laF --show-control-char --color=always'
alias st='svn st'
alias ci='svn ci'
alias di='svn di -x -b -x -w -x --ignore-eol-style | colordiff '
alias cdiff='colordiff'
alias cdi='colordiff | more'
alias svnx='svn pset svn:executable 1 '


alias -g M='| more'
alias emacs=' printf "\033]2;Emacs\007"; emacs'
alias sc='screen -rU'

# setting shell variables
MYNICKNAME=dqneo


if [ -e ~/perl5/perlbrew/etc/bashrc ]; then
    source ~/perl5/perlbrew/etc/bashrc
fi
