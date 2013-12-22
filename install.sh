#!/bin/bash

THIS_DIR=$(cd $(dirname $0); pwd)

#echo $THIS_DIR

cd ~

for file in .screenrc  .zshrc .gitconfig .minttyrc
do
  echo ln -s dotfiles/$file .
  ln -s dotfiles/$file .
done

echo dotfiles/.gitconfig.local.template ~/.gitconfig.local
cp   dotfiles/.gitconfig.local.template ~/.gitconfig.local

echo "edit .gitconfig.local manually"

