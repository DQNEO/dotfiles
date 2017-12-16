#!/bin/bash
set -u
#set -x

THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR
git submodule init
git submodule update

#echo $THIS_DIR

cd $HOME

for file in .emacs.d .screenrc  .zshrc .gitconfig .gitignore
do
  [ ! -e $file ] && ln -s dotfiles/$file .
done

# need 'brew install cask'
if which cask >/dev/null 2>&1 ; then
    cd ${THIS_DIR}/.emacs.d
    cask install
fi

cd ${THIS_DIR}/oh-my-zsh/custom
if [[ ! -e dqneo.zsh-theme ]] ; then
    ln -s ../../dqneo.zsh-theme .
fi
