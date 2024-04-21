#!/bin/bash
set -ue

cd $HOME

##
# put each dot file's link to home dir
#
for file in .emacs.d .screenrc  .zshrc .gitconfig .gitignore
do
  [[ ! -e $file ]] && ln -s dotfiles/$file .
done

exit 0
