" init.vim for neovim 0.9 - %LocalAppData%\nvim\init.vim
" Get vim-plug from: https://github.com/junegunn/vim-plug
call plug#begin(stdpath('data') . '/plugged')
    Plug 'preservim/nerdtree'
    Plug 'whatyouhide/vim-gotham'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
call plug#end()

set nocompatible
source $VIMRUNTIME/mswin.vim
behave mswin

set bs=2                " backspacing allowed over everything in insert mode
set ch=1                " Make command line two lines high
set expandtab           " convert tabs to spaces
set laststatus=2        " always show a status line
set viminfo='20,\"100   " read/write a .viminfo file, don't store > 100 entries
set cursorline          " highlight line the text cursor is on
set visualbell
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

set backup
if !isdirectory(stdpath('data') . '\backups')
    silent! execute "!mkdir " . stdpath('data') . '\backups'
endif

let s:backupdir=stdpath('data') . '\backups'
execute 'set backupdir=' . s:backupdir
set noswapfile

" show whitespace using these chars
set listchars=eol:¬,tab:»•,trail:~,extends:>,precedes:<,space:∙

" Don't use Ex mode, use Q for formatting
map Q gq

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

set ignorecase          " ignore case while searching
set nohlsearch          " no/highlight search results (hlsearch/nohlsearch)
syntax on

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

nnoremap <C-t> :NERDTreeToggle<CR>
nmap <F4> :set hlsearch!<cr>                " toggle search highlighting
nnoremap <F5> :ls<cr>                       " pick buffers from list
nmap <F7> :set incsearch!<cr>               " toggle incremental search
nmap <F8> :set list!<cr>                    " toggle whitespace

if has("gui_running")
    colorscheme gotham
    let g:airline_powerline_fonts = 1
else
    set termguicolors
    colorscheme dracula
endif

set nocompatible
behave mswin

