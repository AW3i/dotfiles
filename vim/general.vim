set backspace=indent,eol,start
set history=1000
set showcmd
set incsearch
set hlsearch
set wrap
set linebreak
set laststatus=2

set tabstop=4
set expandtab
set smarttab
set shiftwidth=4
set shiftround
set matchpairs+=<:>

set scrolloff=10
set sidescrolloff=7
set sidescroll=1

syntax on
set showmatch
set hidden
set noautowrite
set autoread
set more
set ruler
set noshowmode
set nostartofline
set wildmenu
set lazyredraw
set shell=zsh
set number
set relativenumber
set iskeyword+=_,$,@,%,#
set splitbelow
set splitright
set undolevels=500
if has("persistent_undo")
"    set undodir=~/.undodir/ move
    set undofile
endif
set timeout timeoutlen=1000 ttimeoutlen=100
set list listchars=tab:»·,trail:·,extends:»,precedes:«
set encoding=utf-8
scriptencoding utf-8
set complete+=i,kspell
set omnifunc=syntaxcomplete#Complete
set wildignore+=*.bmp,*.gif,*.jpg,*.png,*.ico
set wildignore+=*.swp,*.tmp
set grepprg=ag\ --nogroup\ --nocolor
let &showbreak='↪ '
let mapleader = " "
let maplocalleader = "\\"
let g:netrw_liststyle = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
set title
set noequalalways
if exists('&inccommand')
  set inccommand=split
endif

set termguicolors
let g:seoul256_srgb = 1
colorscheme seoul256

filetype plugin indent  on
filetype off

"Highlight in red when a line has more than 81 characters
highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%81v', 100)

autocmd FileType mail set spell

highlight! ErrorSign guifg=black guibg=#E01600 ctermfg=16 ctermbg=160
highlight! WarningSign guifg=black guibg=#FFED26 ctermfg=16 ctermbg=11

" Use a blinking upright bar cursor in Insert mode, a solid block in normal
" and a blinking underline in replace mode
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
"enable mouse support
set mouse=a
autocmd BufNewFile,BufRead *.phtml setf php
autocmd BufNewFile,BufRead *.dhtml setf php
