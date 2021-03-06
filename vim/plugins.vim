call plug#begin(vimpath. 'plugged')

" Text Manipulation
Plug 'Raimondi/delimitMate'
    let delimitMate_jump_expansion = 1
    let delimitMate_expand_cr = 2
    let delimitMate_expand_space = 0
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-abolish'

" Completion
Plug 'roxma/nvim-completion-manager'
Plug 'Shougo/echodoc.vim'
    let g:echodoc_enable_at_startup = 1
Plug 'ervandew/supertab'
    let g:SuperTabDefaultCompletionType = '<tab>'
    let g:SuperTabClosePreviewOnPopupClose = 1
if has('python')
    Plug 'SirVer/UltiSnips'
        let g:UltiSnipsExpandTrigger = "<tab>"
        let g:UltiSnipsJumpForwardTrigger = "<tab>"
        let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
        let g:UltiSnipsUsePythonVersion = 3
        let g:UltiSnipsEditSplit="vertical"
        let g:UltiSnipsSnippetDirectories=["UltiSnips"]
        let g:snips_author = 'Alexandros Weigl'
        let g:snips_github = 'https://github.com/AW3i'
        if !exists("g:snips_company")
            let g:snips_company = 'TechDivison'
        endif
        if !exists("g:snips_username")
            let g:snips_username = 'AW3i'
        endif

    Plug 'Valloric/MatchTagAlways'
        let g:mta_filetypes = {
        \ 'html' : 1,
        \ 'dhtml' : 1,
        \ 'xhtml' : 1,
        \ 'xml' : 1,
        \ 'phtml' : 1,
        \}
    Plug 'honza/vim-snippets'
endif

" Utility
" Opens the filemanager or a terminal at the directory of the current file
Plug 'justinmk/vim-gtfo'
    let g:gtfo#terminals = { 'unix': 'kitty --detach --directory' }
Plug 'mhinz/vim-janah'
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
let g:nord_italic = 1
let g:nord_italic_comments = 1
augroup NordMods
    autocmd!
    autocmd ColorScheme nord highlight CursorLineNr ctermfg=6 guifg=#81A1C1
    autocmd ColorScheme nord highlight CursorLine ctermbg=NONE guibg=#2E3440
augroup end
Plug 'tpope/vim-rsi'
" Zooms into a buffer and also unzooms back without breaking the layout
Plug 'troydm/zoomwintab.vim'
Plug 'wellle/targets.vim'
Plug 'pgdouyon/vim-evanesco'
Plug 'janko-m/vim-test'
    let test#strategy = "neoterm"
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
Plug 'tpope/vim-unimpaired'
Plug 'majutsushi/tagbar'
    "remap sort for tagbar so it doesn't collide with sneak
    let g:tagbar_map_togglesort = "r"
Plug 'tpope/vim-eunuch'
Plug 'dansomething/vim-hackernews'
Plug 'joshhartigan/vim-reddit'
Plug 'Valloric/ListToggle'
Plug 'w0rp/ale'
    let g:ale_lint_on_text_changed = 'never'
    let g:ale_lint_on_enter = 1
    let g:ale_lint_on_insert_leave = 1
    let g:ale_sign_error = '✘'
    let g:ale_sign_warning = ':('
    let g:ale_php_phpcs_standard = 'PSR2'
    let g:ale_echo_msg_format = '<%linter%> %code: %%s'
Plug 'justinmk/vim-sneak'
    let g:sneak#label = 1
Plug 'justinmk/vim-dirvish'
    augroup my_dirvish_events
      autocmd!
      " Map t to "open in new tab".
      autocmd FileType dirvish
        \  nnoremap <buffer> t :call dirvish#open('tabedit', 0)<CR>
        \ |xnoremap <buffer> t :call dirvish#open('tabedit', 0)<CR>

      " Enable :Gstatus and friends.
      autocmd FileType dirvish call fugitive#detect(@%)

      " Map CTRL-R to reload the Dirvish buffer.
      autocmd FileType dirvish nnoremap <buffer> <C-R> :<C-U>Dirvish %<CR>

      " Map `gh` to hide dot-prefixed files.
      " To "toggle" this, just press `R` to reload.
      autocmd FileType dirvish nnoremap <buffer>
        \ gh :keeppatterns g@\v/\.[^\/]+/?$@d<cr>
    augroup END
Plug 'ludovicchabant/vim-gutentags'
    let g:gutentags_ctags_exclude = [
    \ '*.min.js',
    \ '*html*',
    \ 'jquery*.js',
    \ '*/node_modules/*',
    \ '*/migrate/*.rb'
    \ ]
    let g:gutentags_generate_on_write = 0
    let g:gutentags_cache_dir = '/home/alex/.tags'
    let g:gutentags_ctags_executable_php = 'phpctags --recurse=yes'
Plug 'junegunn/vim-peekaboo'
    let g:peekaboo_delay = 400
Plug 'kassio/neoterm'
    let g:neoterm_size = '15'
" Task Management
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
  let g:vimwiki_list = [{'path': '~/ownCloud/vimwiki/', 'path_html': '~/public_html/'}]
Plug 'tbabej/taskwiki'
Plug 'powerman/vim-plugin-AnsiEsc'

" File Navigation
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
    let g:fzf_nvim_statusline = 0 " disable statusline overwriting
    let g:fzf_files_options =
      \ '--preview "(highlight -O ansi {} || cat {}) 2> /dev/null | head -'.&lines.'"'

    function! SearchWordWithAg()
        execute 'Ag' expand('<cword>')
    endfunction

    function! SearchVisualSelectionWithAg() range
        let old_reg = getreg('"')
        let old_regtype = getregtype('"')
        let old_clipboard = &clipboard
        set clipboard&
        normal! ""gvy
        let selection = getreg('"')
        call setreg('"', old_reg, old_regtype)
        let &clipboard = old_clipboard
        execute 'Ag' selection
    endfunction

    function! s:ag_to_qf(line)
        let parts = split(a:line, ':')
        return {'filename': parts[0], 'lnum': parts[1], 'col': parts[2],
        \ 'text': join(parts[3:], ':')}
    endfunction

    function! s:ag_handler(lines)
        if len(a:lines) < 2 | return | endif

        let cmd = get({'ctrl-x': 'split',
        \ 'ctrl-v': 'vertical split',
        \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
        let list = map(a:lines[1:], 's:ag_to_qf(v:val)')

        let first = list[0]
        execute cmd escape(first.filename, ' %#\')
        execute first.lnum
        execute 'normal!' first.col.'|zz'

        if len(list) > 1
            call setqflist(list)
            copen
        wincmd p endif
    endfunction

    command! -nargs=* Ag call fzf#run({
    \ 'source':  printf('rg --column --color always "%s"',
    \                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
    \ 'sink*':    function('<sid>ag_handler'),
    \ 'options': "--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. "
    \ })

    let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

Plug 'lvht/fzf-mru'

" Appearance
Plug 'arakashic/chromatica.nvim', {'for': 'c'}
Plug 'junegunn/goyo.vim'

Plug 'mhinz/vim-startify'
    let g:startify_session_dir = '~/.config/nvim/session'
    let g:startify_bookmarks = [{'o': '~/ownCloud/shared/org/index.org'}]
    let g:startify_list_order = [
                \ ['Sessions:'],
                \ 'sessions',
                \ ['Bookmarks:'],
                \ 'bookmarks',
                \ ['Files:'],
                \ 'files',
                \ ['Dir:'],
                \ 'dir'
                \ ]
    let g:startify_session_persistence = 1
    let g:startify_session_delete_buffers = 1
    let g:startify_change_to_dir = 1
    let g:startify_change_to_vcs_root = 1
    let g:startify_custom_header = map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['','']
    " let g:startify_session_before_save = [
    "     \ 'echo "Cleaning left over terminals"',
    "     \ 'TcloseAll!',
    "     \ 'bufdo if bufname("%")=~? "term:\/\/" | bdel! | endif',
    "     \ ]
    autocmd! User Startified setlocal colorcolumn=0

" Statusline plugin
Plug 'itchyny/lightline.vim'
    let g:lightline = {
        \   'colorscheme': 'jellybeans',
        \   'active': {
        \     'left': [
        \       ['mode', 'paste'],
        \       ['fugitive', 'bufferinfo'],
        \       ['tagbar']
        \     ],
        \     'right': [
        \       ['colinfo', 'percent'],
        \       ['fileformat', 'filetype'],
        \     ]
        \   },
        \   'inactive': {
        \     'left': [ ['bufferinfo'] ],
        \     'right': [ ['percent'], ['filetype'] ]
        \   },
        \   'tabline': {
        \     'left': [ ['tabs'], ['bufferline'] ],
        \     'right': [ ['fileencoding'] ]
        \   },
        \   'component': {
        \     'bufferinfo': '%<%f %m',
        \     'colinfo': ':%c%V',
        \     'fileencoding': '%{&fenc}',
        \     'readonly': '%{&readonly?"":""}',
        \     'paste': '%{&paste?"PASTE":""}',
        \   'tagbar': '%{tagbar#currenttag("%s", "")}',
        \   },
        \   'component_function': {
        \     'fileformat'  : 'MyFileformat',
        \     'filetype'    : 'MyFiletype',
        \     'fugitive'    : 'MyFugitive'
        \   },
        \   'separator': { 'left': '', 'right': '' },
        \   'subseparator': { 'left': '', 'right': '' },
        \ }

    let g:lightline.enable = {
        \   'statusline': 1,
        \   'tabline': 1
        \ }

    let g:lightline.mode_map = {
        \   'n'      : ' N ',
        \   'i'      : ' I ',
        \   'R'      : ' R ',
        \   'v'      : ' V ',
        \   'V'      : 'V-L',
        \   'c'      : ' C ',
        \   "\<C-v>" : 'V-B',
        \   's'      : ' S ',
        \   'S'      : 'S-L',
        \   "\<C-s>" : 'S-B',
        \   "t"      : ' T ',
        \   '?'      : ' ? '
        \ }

    function! MyFiletype()
    return strlen(&filetype) ? &filetype : '--'
    endfunction

    function! MyFileformat()
    return winwidth('.') > 80 ? &fileformat : ''
    endfunction

    function! MyFugitive()
    if exists('*fugitive#head') && winwidth('.') > 75
        let bmark = '┣ '
        let branch = fugitive#head()
        return strlen(branch) ? bmark . branch : ''
    endif
    return ''
    endfunction

" VCS
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" Languages
" Plug 'autozimu/LanguageClient-neovim', {'branch': 'next',  'do': 'bash install.sh'}
" Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
Plug 'phpactor/phpactor', {'do': 'composer install'}
Plug 'roxma/ncm-phpactor'
Plug 'sheerun/vim-polyglot'
Plug '2072/PHP-Indenting-for-VIm', {'for': 'php'}
Plug 'tobyS/vmustache', {'for': 'php'} "Library for pdv
Plug 'tobyS/pdv', {'for': 'php'}
    let g:pdv_template_dir = $HOME . "/Documents/git/dotfiles/vim/plugged/pdv/templates_snip"
Plug 'vim-php/tagbar-phpctags.vim', {'for': 'php'}
Plug 'tmhedberg/SimpylFold', {'for': 'python'}
Plug 'mattn/emmet-vim'
call plug#end()
