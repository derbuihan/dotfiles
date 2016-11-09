call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'tomasr/molokai'
call plug#end()

set nocompatible
set backspace=indent,eol,start

set history=50
set ruler
set showcmd
set incsearch
set number
set cursorline
set nobackup
set tabstop=4
set shiftwidth=4
set softtabstop=0
set foldmethod=marker

set expandtab

colorscheme molokai
syntax on
let g:molokai_original = 1
let g:rehash256 = 1
set background=dark
set t_Co=256

if &t_Co > 2 || has("gui_running")
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


