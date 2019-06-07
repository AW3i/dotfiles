call plug#begin(vimpath. 'plugged')

" Delimitmate: Auto Close Pairs
" Lion: Align
" Surround: Surround/change or delete
" Repeat: duh
" Tcomment: Comment out lines
" Abolish: Abreviate, Substitute on steroids 
" Ncm2: Completion manager & +6 Plugins
" Echodoc: Display method signatures
" Ultisnips: Snippets + Honza/snippets
" RSI: Readline Keybindings
" Zommwintab: Zoom in and out of buffers
" Targets: Provide vim objects
" Evanesco: Visual Star search
" VimTest: Testing
" UndoTree: a Tree view of vim's undo
" Unimpaired: Useful keybindings
" Eunuch: Provide file utility commands
" Hackernews: Procrastination
" ListToggle: Toggle Quickfix and Location list
" Ale: Linter/LSP support
" Sneak: Motion Plugin
" Dirvish: File manager
" Peekaboo: Display registers on specific keybindings
" Neoterm: Terminal manager
" PythonSupport: Update Python libraries for nvim
" FZF: Fuzzy Searcher
" Vimade: Fade inactive buffers
" Startify: Session Manager
" Lightline: A statusline
" Iceberg: Colorscheme for now
" Fugitve: Git client
" Signify: Show changed lines in VCS
" Vdebug: Debugging
" Polyglot: Support many languages
" Vimtex: Latex
" Pdv: Php docblocks generator
" Editrconfig: Respect editorconfig

" Text Manipulation
" Plug 'Raimondi/delimitMate'
"     let delimitMate_jump_expansion = 1
"     let delimitMate_expand_cr = 2
"     let delimitMate_expand_space = 0
Plug 'jiangmiao/auto-pairs'
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-abolish'

" Completion
if has('nvim')
    Plug 'ncm2/ncm2'
    " ncm2 requires nvim-yarp
    Plug 'roxma/nvim-yarp'
    " enable ncm2 for all buffers
    autocmd BufEnter * call ncm2#enable_for_buffer()
    " suppress the annoying 'match x of y', 'The only match' and 'Pattern not
    " found' messages
    set shortmess+=c
    " CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
    inoremap <c-c> <ESC>
    " When the <Enter> key is pressed while the popup menu is visible, it only
    " hides the menu. Use this mapping to close the menu and also start a new
    " line.
    inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
    " :help Ncm2PopupOpen for more information
    set completeopt=noinsert,menuone,noselect
        " some completion sources
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-path'
    Plug 'ncm2/ncm2-ultisnips'
    Plug 'ncm2/ncm2-tern',  {'for': 'js', 'do': 'npm install'}
    Plug 'ncm2/float-preview.nvim'
    Plug 'phpactor/phpactor', {'branch': 'develop', 'for': 'php', 'do': 'composer install'}
        let g:phpactorInputListStrategy = 'fzf'
    Plug 'phpactor/ncm2-phpactor', {'for': 'php'}
endif
Plug 'Shougo/echodoc.vim'
    let g:echodoc_enable_at_startup = 1
if has('python')
    Plug 'SirVer/UltiSnips'
        let g:UltiSnipsExpandTrigger = "<tab>"
        let g:UltiSnipsJumpForwardTrigger = "<tab>"
        let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
        let g:UltiSnipsUsePythonVersion = 3
        let g:UltiSnipsEditSplit="vertical"
""        let g:UltiSnipsSnippetDirectories=["UltiSnips"]
        let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', 'UltiSnips']
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
        \ 'twig' : 1,
        \}
    Plug 'honza/vim-snippets'
endif


" Utility
" Readline bindings
Plug 'tpope/vim-rsi'
" Zooms into a buffer and also unzooms back without breaking the layout
Plug 'troydm/zoomwintab.vim', {'on': 'ZoomWinTabToggle'}
" Text objects
Plug 'wellle/targets.vim'
" Star search
Plug 'pgdouyon/vim-evanesco'
Plug 'janko-m/vim-test'
    let test#strategy = "neoterm"
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
Plug 'tpope/vim-unimpaired'
" Basic file management commands
Plug 'tpope/vim-eunuch'
Plug 'dansomething/vim-hackernews', {'on': 'HackerNews'}
Plug 'Valloric/ListToggle'
Plug 'w0rp/ale'
    let g:ale_lint_on_text_changed = 'never'
    let g:ale_lint_on_enter = 1
    let g:ale_lint_on_insert_leave = 1
    let g:ale_sign_error = '✘'
    let g:ale_sign_warning = ':('
    let g:ale_php_phpcs_standard = 'PSR2'
    let g:ale_linters = { 'php': ['php','psalm'] }
    let g:ale_echo_msg_format = '<%linter%> %code: %%s'
    " autocmd BufEnter *.min.js ALEDisableBuffer
    " autocmd BufEnter *.sql ALEDisableBuffer
    let g:ale_pattern_options = {
        \   '.*\.json$': {'ale_enabled': 0},
        \   '.*\.min\.*$': {'ale_enabled': 0},
        \   '.*\.sql': {'ale_enabled': 0},
        \}
Plug 'justinmk/vim-sneak'
    let g:sneak#label = 1
" Alternative to netrw
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
" Display the registers
Plug 'junegunn/vim-peekaboo'
    let g:peekaboo_delay = 400
Plug 'kassio/neoterm'
    let g:neoterm_default_mod = 'botright'
    let g:neoterm_automap_keys = '<leader>tm'
    let g:neoterm_use_relative_path = 1
    let g:neoterm_autoscroll = 1
    let g:neoterm_always_open_to_exec = 0
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
    let g:fzf_nvim_statusline = 0 " disable statusline overwriting
    let g:fzf_files_options =
      \ '--preview "(highlight -O ansi {} || cat {}) 2> /dev/null | head -'.&lines.'"'

    function! SearchWordWithAg()
        execute 'Ag' expand('<cword>')
    endfunction

    function! SearchWordWithAgi()
        execute 'Agi' expand('<cword>')
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

    function! SearchVisualSelectionWithAgi() range
        let old_reg = getreg('"')
        let old_regtype = getregtype('"')
        let old_clipboard = &clipboard
        set clipboard&
        normal! ""gvy
        let selection = getreg('"')
        call setreg('"', old_reg, old_regtype)
        let &clipboard = old_clipboard
        execute 'Agj' selection
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

    command! -nargs=* Agi call fzf#run({
    \ 'source':  printf('rg --no-ignore --column --color always "%s"',
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

Plug 'Konfekt/Fastfold'
    nmap zuz <Plug>(FastFoldUpdate)
    let g:fastfold_savehook = 1
    let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
    let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
    let g:markdown_folding = 1
    let g:tex_fold_enabled = 1
    let g:xml_syntax_folding = 1
    let g:javaScript_fold = 1
    let g:sh_fold_enabled= 7
    let g:php_folding = 1
    let g:elixir_folding = 1
Plug 'AndrewRadev/tagalong.vim'
    let g:tagalong_additional_filetypes = ['phtml', 'twig', 'dhtml']
Plug 'vimwiki/vimwiki'

" Appearance
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
            \   'colorscheme': 'one',
            \   'active': {
            \     'left': [
            \       ['mode', 'paste'],
            \       ['fugitive', 'bufferinfo'],
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

Plug 'rakr/vim-one'
Plug 'kristijanhusak/vim-hybrid-material'
    let g:enable_bold_font = 1
    let g:enable_italic_font = 1
Plug 'justinmk/vim-gtfo'


" VCS
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" Languages
Plug 'vim-vdebug/vdebug'
    if !exists('g:vdebug_options')
      let g:vdebug_options = {}
    endif
    let g:vdebug_options.break_on_open = 0
    let g:vdebug_options.ide_key = 'PHPSTORM'
Plug 'sheerun/vim-polyglot'
    let g:polyglot_disabled = ['latex']
Plug 'lervag/vimtex'
Plug 'tobyS/vmustache', {'for': 'php'} "Library for pdv
Plug 'tobyS/pdv', {'for': 'php'}
    let g:pdv_template_dir = $HOME . "/Documents/git/dotfiles/vim/plugged/pdv/templates_snip"
Plug 'sgur/vim-editorconfig'
Plug 'slashmili/alchemist.vim'
Plug 'pbogut/ncm2-alchemist'
Plug 'arcseldon/vim-elixirConceal'
Plug 'mattn/emmet-vim'
    let g:user_emmet_install_global = 0
call plug#end()
