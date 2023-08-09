" .vimrc for vim 9+
" Get vim-plug from: https://github.com/junegunn/vim-plug

" git bash's vim doesn't currently seem to support plugins
if !has("win32unix")
    call plug#begin('~/vimfiles/plugged')
        Plug 'preservim/nerdtree'
        Plug 'whatyouhide/vim-gotham'
        Plug 'dracula/vim', { 'as': 'dracula' }
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
    call plug#end()
    nnoremap <C-t> :NERDTreeToggle<CR>
endif

set nocompatible
source $VIMRUNTIME/mswin.vim
behave mswin

if has("win32")
    let $startpath=expand("$HOMEDRIVE").expand("$HOMEPATH")."\\Documents"
    cd! $startpath
endif
set suffixes+=.o,.obj,.exe,.com,.class,.dll

" show whitespace using these chars
set listchars=eol:¬,tab:»•,trail:~,extends:>,precedes:<,space:∙

" #legacy - make BkSp work sanely in PuTTY when set
" to Control-H, to work well with screen(1)
" set t_kD=^V<Delete>

set bs=2                " backspacing allowed over everything in insert mode
set ch=2                " Make command line two lines high
set expandtab           " convert tabs to spaces
set laststatus=2        " always show a status line
set viminfo='20,\"100   " read/write a .viminfo file, don't store > 100 entries
set cursorline          " highlight line the text cursor is on
set visualbell
set autoindent
set smartindent
set history=100
set shiftwidth=4 smarttab
set tabstop=4
set showmatch
set nowrap
set showcmd
set showfulltag
set number
set numberwidth=3

set backup
if has("win32") || has("win32unix")
    if !isdirectory("~/vimfiles/backups")
        if has("win32")
            silent! execute "!mkdir " . expand("$USERPROFILE") . "\\vimfiles\\backups"
        elseif has("win32unix")
            silent! execute "!mkdir -p " . expand("$HOME") . "/vimfiles/backups"
        endif
    endif
endif
set backupdir=~/vimfiles/backups
set noswapfile


" Don't use Ex mode, use Q for formatting
map Q gq

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

set ignorecase          " ignore case while searching
set nohlsearch          " no/highlight search results (hlsearch/nohlsearch)
if has("syntax")
    syntax on
endif

nmap <F4> :set hlsearch!<cr>                " toggle search highlighting
nnoremap <F5> :ls<cr>                       " pick buffers from list
nmap <F7> :set incsearch!<cr>               " toggle incremental search
nmap <F8> :set list!<cr>                    " toggle whitespace

" if BOM is given, use it rather than guessing
if &fileencodings !~? "ucs-bom"
    set fileencodings^=ucs-bom
endif
" check for utf-8 when trying to determine encodings
if &fileencodings !~? "utf-8"
    set fileencodings+=utf-8
endif

if has("gui_running")
    let g:airline_powerline_fonts = 1
    colorscheme dracula
    set mousehide                       " hide mouse pointer while typing
    set guioptions-=T                   " don't show a toolbar
    set guioptions-=t                   " no tearoff menu entries
    set guitablabel=\[%N\]\ %t\ %M      " more readable labels on tabs
    set lines=35 columns=100            " size of GUI window

    if has("Win32")
        let &guifont="Jetbrains Mono:h13"
    elseif has("Unix")
        set guifont=Monospace\ 12
    endif
else                                    " we're running in a console
    if has("win32")
        set termguicolors               " in 2023, most consoles support 24-bit color
        colorscheme dracula
    elseif has("win32unix")
        set termguicolors
        colorscheme slate
    endif
endif

