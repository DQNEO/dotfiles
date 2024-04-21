#!/bin/bash
set -uex

THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR

#echo $THIS_DIR

cd $HOME

for file in .emacs.d .screenrc  .zshrc .gitconfig .gitignore
do
  [[ ! -e $file ]] && ln -s dotfiles/$file .
done

exit 0
