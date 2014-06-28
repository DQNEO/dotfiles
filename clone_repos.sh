#!/bin/bash

set -e

BASE_DIR="${HOME}/repos"
MY_REPOS="
DQNEO
c-ls
cookbook-disableservices
cookbook-dqneo
cookbook-emacs
cookbook-git
cookbook-httpd
cookbook-remi
cookbook-timezone
cookbook-tokyotyrant
cookbook-yumfastestmirror
cookbook-zsh
ethnam
mingoose
mykitchen
sketchtoy
web-scraper
"

cd $BASE_DIR
for name in $MY_REPOS
do
    if [[ -d $name ]] ; then
	echo "already exists - $name"
	continue
    fi
    #echo "cloning $name"
    git clone git@github.com:DQNEO/${name}.git
done


