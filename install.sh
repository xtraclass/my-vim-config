#!/bin/bash

cd
cd .vim
mkdir bundle

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

echo <<END
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'

" non github repos
Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on     " required!
END > .vimrc
