" dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/watasuke/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------


" General------------------------------------
syntax enable
colorscheme onedark
set number
set title
set encoding=utf-8

" Tab
set smartindent
set smarttab
set shiftwidth=2  "挿入する空白の量
set expandtab

set hls
set clipboard+=unnamed,unnamedplus "クリップボードにコピー
"set cursorline

" Key
let mapleader = "\<Space>"

" bind
inoremap <silent> jj <ESC>
" vnoremap <silent> jj <ESC>
noremap  <Space>w :<C-u>w<CR>
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

noremap <C-j> ddp
noremap <C-k> ddkP
noremap <C-q> <C-\><C-n>

" Terminal
if has('nvim')
  command! -nargs=* Term split | terminal <args>
  command! -nargs=* Termv vsplit | terminal <args>
endif

" Plugin settings--------------------------


