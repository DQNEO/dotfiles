# benchmark zshrc
function for-zsh-time {
    for i in $(seq 1 10)
    do
        time zsh -i -c exit
    done
}

# zsh profiling
if (which zprof > /dev/null 2>&1) ;then
   zprof
fi
