if [[ -z $ZSH_THEME_CLOUD_PREFIX ]]; then
    ZSH_THEME_CLOUD_PREFIX='☁'
fi

PROMPT='%{$fg_bold[cyan]%}$ZSH_THEME_CLOUD_PREFIX %{$fg_bold[green]%}%p %{$fg[green]%}%c %{$fg_bold[cyan]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
# プロンプトの色付けは下記記事がわかりやすい
# http://www.sakito.com/2011/11/zsh.html
#PROMPT="%n%F{yellow}@%m%f:%/%1(v|%F{green}%1v%f|)%% "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}] %{$fg[yellow]%}⚡%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}]"
