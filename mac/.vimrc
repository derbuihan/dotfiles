set nocompatible
set backspace=indent,eol,start

set history=50
set ruler
set showcmd
set incsearch
set number
set nobackup
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=0

map python a#!/usr/bin/python<ESC>

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

if has("autocmd")
  filetype plugin indent on
  augroup vimrcEx
  au!
  autocmd FileType text setlocal textwidth=78
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  augroup END
else
  set autoindent

endif

command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                \ | wincmd p | diffthis

call plug#begin('~/.vim/plugged')
Plug 'dag/vim2hs'
call plug#end()
