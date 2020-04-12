
if has('vim_starting')
  if !filereadable(expand('~/.local/share/nvim/site/autoload/plug.vim'))
    echo "install vim-plug"
    call system('curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  endif
endif

call plug#begin('~/.local/share/nvim/plugged')
  Plug 'tomasr/molokai'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'cohama/lexima.vim'
  Plug 'luochen1990/rainbow'
  Plug 'sheerun/vim-polyglot'
call plug#end()

set encoding=utf-8
scriptencoding utf-8

set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,mac,dos
set ambiwidth=double

set noswapfile
set autoread

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent
filetype plugin indent on

set showmatch
set number
set cursorline
set laststatus=2
set foldmethod=marker

set incsearch
set ignorecase
set smartcase
set hlsearch

colorscheme molokai
let g:molokai_original = 1
let g:rehash256=1
let g:psc_ide_syntastic_mode=2
set t_Co=256

let g:rainbow_active = 1

syntax on

