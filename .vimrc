" If vim -plug is not installed, install it."{{{
if has('vim_starting')
  set rtp+=~/.vim/plugged/vim-plug
  if !isdirectory(expand('~/.vim/plugged/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -p ~/.vim/plugged/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
  end
endif
""}}}

" Plugins to install"{{{
call plug#begin('~/.vim/plugged')
  Plug 'tpope/vim-surround'
  Plug 'tomasr/molokai'
  Plug 'itchyny/lightline.vim'
call plug#end()
""}}}

" Whether plugins exit."{{{
let s:plug = { "plugs": get(g:, 'plugs', {}) }

function! s:plug.is_installed(name)
  return has_key(self.plugs, a:name) ? isdirectory(self.plugs[a:name].dir) : 0
endfunction
""}}}

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

nnoremap jq :%!jq '.'

augroup Binary
  au!
  au BufReadPre  *.bin let &bin=1
  au BufReadPost *.bin if &bin | %!xxd
  au BufReadPost *.bin set ft=xxd | endif
  au BufWritePre *.bin if &bin | %!xxd -r
  au BufWritePre *.bin endif
  au BufWritePost *.bin if &bin | %!xxd
  au BufWritePost *.bin set nomod | endif
augroup END

if s:plug.is_installed("molokai")
  colorscheme molokai
  let g:molokai_original = 1
  let g:rehash256=1
  set t_Co=256
endif

if s:plug.is_installed("vimtex")
  let g:vimtex_latexmk_continuous = 1
  let g:vimtex_latexmk_background = 1
  "let g:vimtex_latexmk_options = '-pdf'
  let g:vimtex_latexmk_options = '-pdfdvi'
  "let g:vimtex_latexmk_options = '-pdfps'
  "let g:vimtex_view_general_viewer = 'open'
  let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
  let g:vimtex_view_general_options = '@line @pdf @tex'
endif

syntax on
