"""" dein.vim
if !&compatible
    set nocompatible
endif

let s:cache_home = empty($XDG_CONFIG_HOME) ? expand('~/.vim') : $XDG_CONFIG_HOME

let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
    call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath

" Load plugins and make cache
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
let s:toml_lazy_file = fnamemodify(expand('<sfile>'), ':h').'/dein_lazy.toml'
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    call dein#load_toml(s:toml_file,{'lazy':0})
    call dein#load_toml(s:toml_lazy_file,{'lazy':1})
    " call dein#add('tomasr/molokai')
    call dein#add('cocopon/iceberg.vim')
    call dein#end()
    call dein#save_state()
endif

" Install plugins
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

"""" Windows setting
if has('win32') || has('win64')
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=R
    set guioptions-=l
    set guioptions-=L
    set guioptions-=b
    set backupdir=$HOME/vimbackup
    set directory=$HOME/vimbackup
endif

"""" Mac setting
if has('mac')
    set backupdir=~/vimbackup
    set directory=~/vimbackup
endif

"""" Common setting
filetype plugin indent on
syntax on
set t_Cp=256
colorscheme iceberg
autocmd Filetype json setl conceallevel=0

if has('persistent_undo')
    set undodir=~/undo
    set undofile
endif

" other mapping
set cursorline
set tabstop=4
set shiftwidth=4
set backup
set swapfile
set noundofile
set number
set autochdir
set clipboard=unnamed
set encoding=utf-8
set expandtab
set nocompatible
set hidden
set wildmenu
noremap <Up>    <Nop>
noremap <Down>  <Nop>
noremap <Left>  <Nop>
noremap <Right> <Nop>
inoremap <silent> jj <ESC>
noremap <S-h>   ^
noremap <S-j>   }
noremap <S-k>   {
noremap <S-l>   $
nnoremap s <Nop>
noremap j gj
noremap k gk
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
tnoremap <ESC> <C-w>N
