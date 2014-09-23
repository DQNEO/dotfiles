#!/bin/bash

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
cask install

cd $HOME
[ ! -e .gitconfig.local ] && cp dotfiles/.gitconfig.local.template .gitconfig.local

echo "please edit .gitconfig.local manually"

