#!/bin/bash

THIS_DIR=$(cd $(dirname $0); pwd)

#echo $THIS_DIR

cd ${HOME}

for file in .emacs.d .screenrc  .zshrc .gitconfig .minttyrc
do
  [ ! -e $file ] && ln -s dotfiles/$file .
done

[ ! -e .gitconfig.local ] && cp dotfiles/.gitconfig.local.template .gitconfig.local

echo "please edit .gitconfig.local manually"

