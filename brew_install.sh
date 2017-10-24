#!/bin/bash

# `brew list` lists up all installed packages

# zsh
brew install zsh zsh-completions

# emacs
brew install emacs cask

# unix tools
brew install coreutils findutils  gnu-sed colordiff nkf tree wget

# git
brew install git hub ghq tig

# terminal UI
brew install peco z screen tmux

# infra
brew install ansible awscli

# builder/compiler
brew install autoconf

# DB
brew instal mycli

# go
brew install go

# env
brew install direnv

# node
brew install node yarn

# blog
brew install hugo

# communication
brew install jq brotobuf

# image
brew install imagemagick

# php
# brew tap homebrew/php
# brew install php71 

# python
# brew install python python3

# db
brew install mycli

# PHP
# add Tap
brew tap homebrew/homebrew-php
brew unlink php56
brew install php71
