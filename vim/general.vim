set backspace=indent,eol,start
set history=1000
set showcmd
set showmode
set incsearch
set hlsearch
set wrap
set linebreak
set laststatus=2

set smartindent
set tabstop=4
set expandtab
set smarttab
set shiftwidth=4
set shiftround
set matchpairs+=<:>

set foldmethod=indent
set foldnestmax=0

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
    set undodir=~/.undodir/
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
let g:netrw_liststyle=0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
set background=dark
set cursorline
set title
if exists('&inccommand')
  set inccommand=split
endif

colorscheme jellybeans

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
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let &t_SI = "\<Esc>[5 q"
let &t_SR = "\<Esc>[3 q"
let &t_EI = "\<Esc>[2 q"

function! CleanEmptyBuffers()
  let buffers = filter(range(0, bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val)<0')
  if !empty(buffers)
    exe 'bw '.join(buffers, ' ')
  endif
endfunction
