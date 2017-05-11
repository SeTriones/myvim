set nobackup
set ruler
set showcmd
syntax on
set fdm=syntax
set foldlevel=9999
set backspace=indent,eol,start
colo darkblue

set incsearch

filetype plugin indent on
set number
set smartindent
set nocompatible
set tabstop=4
set softtabstop=4
set cindent shiftwidth=4
au Filetype python setl et ts=4 sw=4

set nocompatible
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()
filetype plugin indent on

let g:ycm_global_ycm_extra_conf = '${path}/.ycm_extra_conf.py'
