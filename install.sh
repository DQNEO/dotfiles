#!/bin/bash
set -ue

cd $HOME

##
#  link directory
#  ~/dotfiles -> ~/src/github.com/DQNEO/dotfiles
#
if [ -e "$HOME/dotfiles" ]; then
  :
else
  ln -s src/github.com/DQNEO/dotfiles .
fi

##
# put each dot file's link to home dir
#
for file in .emacs.d .screenrc  .zshrc .gitconfig .gitignore
do
  [[ ! -e $file ]] && ln -s dotfiles/$file .
done

exit 0
