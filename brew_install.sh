#!/bin/bash

# 現在入ってるパッケージ一覧は`brew ls`で列挙できる
brew install zsh emacs git cask
brew install zsh-completions
brew install hub ghq peco z tig
brew install node
brew install coreutils findutils  gnu-sed
brew install ansible

# command util
brew install tree wget colordiff

# php
brew install composer

# env util
brew install direnv

# to build php
# install bison3. see http://qiita.com/DQNEO/items/c9bada0c4a6f83d3584e
brew install bison libmcrypt
