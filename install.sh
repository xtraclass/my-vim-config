#!/bin/bash

cd
cd .vim
mkdir bundle &>/dev/null
mkdir autoload &>/dev/null
rm .vimrc &>/dev/null

curl -Sso autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

#cat > .vimrc <<END---
#set nocompatible
#
#execute pathogen#infect()
#
#syntax on
#
#filetype plugin indent on
#
#END---

cd
rm .vimrc
ln -s .vim/.vimrc .vimrc
cd .vim
