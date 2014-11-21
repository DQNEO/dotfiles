#!/bin/bash
set -u
#set -x

THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR
git submodule init
git submodule update

#echo $THIS_DIR

cd $HOME

for file in .emacs.d .screenrc  .zshrc .gitconfig .gitignore .minttyrc
do
  [ ! -e $file ] && ln -s dotfiles/$file .
done

echo "setup .emacs.d"
cd ${THIS_DIR}/.emacs.d

if which cask >/dev/null 2>&1 ; then
    cask install
fi

cd ${THIS_DIR}/oh-my-zsh/custom
if [[ ! -e dqneo.zsh-theme ]] ; then
    ln -s ../../dqneo.zsh-theme .
fi

cd $THIS_DIR
if [ ! -e .gitconfig.local ] ; then
    cat .gitconfig.local.template \
    sed -e s/MYACCOUNT/dqneoo/ \
    sed -e s/DOMAIN/gmail.com/ \
    > $HOME/.gitconfig.local
fi


