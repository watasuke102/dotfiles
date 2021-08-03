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
noremap  <Space>w :<C-u>w<CR>
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

inoremap <C-Space> <C-n>
noremap <C-Tab> :bnext
noremap <C-S-Tab> :bprevious

noremap <C-j> ddp
noremap <C-k> ddkP

inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"

" Terminal
tnoremap <C-q> <C-\><C-n>
if has('nvim')
  command! -nargs=* Term split | terminal <args>
  command! -nargs=* Termv vsplit | terminal <args>
endif

" Plugin settings--------------------------
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=237
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=236

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:winresizser_vert_resize = 2
let g:winresizser_horiz_resize = 2

let g:rustfmt_autosave = 1
autocmd FileType c ClangFormatAutoEnable

" https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources#use-tab-or-custom-key-for-trigger-completion
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<Tab>" :
  \ coc#refresh()
inoremap <silent><expr> <c-space> coc#refresh()

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

