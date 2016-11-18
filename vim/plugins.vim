call plug#begin(vimpath. 'plugged')

" Text Manipulation
Plug 'Raimondi/delimitMate'
    let delimitMate_jump_expansion = 1
    let delimitMate_expand_cr = 2
    let delimitMate_expand_space = 1
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-abolish'

" Completion
Plug 'Shougo/deoplete.nvim'
    let g:deoplete#enable_at_startup = 1
    "let g:deoplete#tag#cache_limit_size = 50000000
    "let g:deoplete#omni_patterns = {}
    "let g:deoplete#omni_patterns.php = '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

Plug 'ervandew/supertab'
    let g:SuperTabDefaultCompletionType = '<tab>'
    let g:SuperTabClosePreviewOnPopupClose = 1
Plug 'honza/vim-snippets'

" Utility
Plug 'kana/vim-niceblock'
Plug 'tommcdo/vim-exchange'
Plug 'dhruvasagar/vim-table-mode', {'on': 'TableModeEnable'}
Plug 'wellle/targets.vim'
Plug 'pgdouyon/vim-evanesco'
Plug 'diepm/vim-rest-console'
Plug 'janko-m/vim-test'
    let test#strategy = "neoterm"
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
Plug 'tpope/vim-unimpaired'
Plug 'majutsushi/tagbar'
    "remap sort for tagbar so it doesn't collide with sneak
    let g:tagbar_map_togglesort = "r"
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'jceb/vim-orgmode'

" for orgmode
Plug 'vim-scripts/utl.vim'
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-speeddating'
Plug 'mattn/calendar-vim'

Plug 'tpope/vim-eunuch'
Plug 'ryanss/vim-hackernews'
Plug 'joonty/vdebug'
Plug 'Valloric/ListToggle'
Plug 'benekastah/neomake'
    autocmd! BufWritePost * Neomake
    let g:neomake_open_list = 0
    let g:neomake_error_sign = { 'text': '✘', 'texthl': 'ErrorSign' }
    let g:neomake_warning_sign = { 'text': ':(', 'texthl': 'WarningSign' }
    let g:neomake_php_phpcs_args_standard = 'PSR2'
    let g:neomake_php_phpmd_maker = {
    \ 'args': ['%:p', 'text', '~/.phpmd.xml'],
    \ 'errorformat': '%E%f:%l%\s%m'
    \ }
    let g:neomake_php_enabled_makers = ['php', 'phpcs', 'phpmd']
    "let g:neomake_php_enabled_makers = ['php']
Plug 'justinmk/vim-sneak'
    let g:sneak#streak = 1
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
        if !exists("g:snips_project_email")
            let g:snips_project_email= 'info@appserver.io'
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
endif

Plug 'ludovicchabant/vim-gutentags'
    let g:gutentags_exclude = [
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
    let g:neoterm_position = 'horizontal'
    let g:neoterm_size = '15'

" File Navigation
Plug 'zenbro/mirror.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
    let g:fzf_nvim_statusline = 0 " disable statusline overwriting
    let g:fzf_files_options =
      \ '-i --preview "(coderay {} ) 2> /dev/null | head -'.&lines.'"'

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
    \ 'source':  printf('ag --nogroup --column --color "%s"',
    \                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
    \ 'sink*':    function('<sid>ag_handler'),
    \ 'options': "--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. "
    \ })

" Appearance
Plug 'junegunn/goyo.vim'
    let g:goyo_width=120
Plug 'nanotech/jellybeans.vim'
    let g:jellybeans_background_color_256=234
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
    let g:startify_session_before_save = [
        \ 'echo "Cleaning up before saving.."',
        \ 'call CleanEmptyBuffers()',
        \ ]
    autocmd! User Startified setlocal colorcolumn=0
Plug 'junegunn/limelight.vim'
    let g:limelight_default_coefficient = 0.7
    let g:limelight_conceal_ctermfg = 238

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
"Plug 'jreybert/vimagit'
    "nmap <leader>m :call magit#show_magit('h')<CR>
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" Languages
"Plug 'shawncplus/phpcomplete.vim', {'for': 'php'}
    "let g:phpcomplete_parse_docblock_comments = 1
Plug 'pbogut/deoplete-padawan'
Plug 'suan/vim-instant-markdown'
Plug 'phpvim/phpfold.vim', { 'for': 'php', 'do': 'composer update' }
Plug 'arnaud-lb/vim-php-namespace', {'for': 'php'}
    function! IPhpInsertUse()
        call PhpInsertUse()
        call feedkeys('a',  'n')
    endfunction
    autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

    function! IPhpExpandClass()
        call PhpExpandClass()
        call feedkeys('a', 'n')
    endfunction
    autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>
Plug '2072/PHP-Indenting-for-VIm', {'for': 'php'}
Plug 'tobyS/vmustache', {'for': 'php'}
Plug 'tobyS/pdv', {'for': 'php'}
    let g:pdv_template_dir = $HOME . "/Documents/git/dotfiles/vim/plugged/pdv/templates_snip"

Plug 'vim-php/tagbar-phpctags.vim'
Plug 'docteurklein/php-getter-setter.vim', {'for': 'php'} 
Plug 'adoy/vim-php-refactoring-toolbox'
Plug 'sheerun/vim-polyglot'
call plug#end()
