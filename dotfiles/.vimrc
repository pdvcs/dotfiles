" .vimrc for vim 9+

" get vim-plug from: https://github.com/junegunn/vim-plug
call plug#begin('~/vimfiles/plugged')

Plug 'preservim/nerdtree'
Plug 'whatyouhide/vim-gotham'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

set nocompatible
source $VIMRUNTIME/mswin.vim
behave mswin

if has("win32")
    let $startpath=expand("$HOMEDRIVE").expand("$HOMEPATH")."\\Documents"
    cd! $startpath
endif
set suffixes+=.o,.obj,.exe,.com,.class,.dll

" make BkSp work sanely in PuTTY when set
" to Control-H, to work well with screen(1)
" set t_kD=^V<Delete>

set bs=2                " backspacing allowed over everything in insert mode
set ch=2                " Make command line two lines high
set expandtab           " convert tabs to spaces
set laststatus=2        " always show a status line
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
                        " than 50 lines of registers

set backup
if !isdirectory("~/vimfiles/backups")
    silent! execute "!mkdir " . expand("$USERPROFILE") . "\\vimfiles\\backups"
endif
set backupdir=~/vimfiles/backups
set noswapfile          " no swap files

set vb
set autoindent
set smartindent
set history=100
set shiftwidth=4 smarttab
set showmatch
set nowrap
set showcmd
set showfulltag
set number
set numberwidth=3

" Don't use Ex mode, use Q for formatting
map Q gq

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>


set ignorecase  " ignore case while searching
set nohlsearch
if has("syntax")
    syntax on
endif

nmap <F4> :set hlsearch!<cr>   " toggle search highlighting
" pick buffers from list
nnoremap <F5> :buffers<CR>:buffer<Space>
nmap <F6> :sbn<cr>             " cycle through tabs/windows/buffers
nmap <F7> :set incsearch!<cr>  " toggle incremental search

" if BOM is given, use it rather than guessing
if &fileencodings !~? "ucs-bom"
    set fileencodings^=ucs-bom
endif
" check for utf-8 when trying to determine encodings
if &fileencodings !~? "utf-8"
    set fileencodings+=utf-8
endif

nnoremap <C-t> :NERDTreeToggle<CR>

if has("gui_running")
    let g:airline_powerline_fonts = 1
    colorscheme dracula
    set mousehide    " hide mouse pointer while typing
    set lines=35 columns=100
    set cursorline " highlight line the text cursor is on
    set guioptions-=T  " don't show a toolbar
    set guioptions-=t  " no tearoff menu entries

    if has("Win32")
        let &guifont="Jetbrains Mono:h13"
    elseif has("Unix")
        set guifont=Monospace\ 12
    endif
else
        " hello
    set termguicolors
    colorscheme dracula
endif
