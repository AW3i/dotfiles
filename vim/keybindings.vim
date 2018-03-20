nnoremap <leader>s :w<CR>
nnoremap <silent> <leader>bc :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <silent> <leader>bd :bd<CR>
nnoremap <silent> <leader>tn :tabnew<CR>
nnoremap <silent> <M-1> 1gt<CR>
nnoremap <silent> <M-2> 2gt<CR>
nnoremap <silent> <M-3> 3gt<CR>
nnoremap <silent> <M-4> 4gt<CR>
nnoremap <silent> <M-5> 5gt<CR>
nnoremap <silent> <M-6> 6gt<CR>
nnoremap <silent> <M-7> 7gt<CR>
nnoremap <silent> <M-8> 8gt<CR>
nnoremap <silent> <M-9> 9gt<CR>
nnoremap <silent> <M-0> 0gt<CR>
" Switch back to normal mode from terminal mode
if has('nvim')
    tnoremap <esc><esc> <C-\><C-n>
    nnoremap  <leader>tv :vs +te<CR>
    nnoremap  <leader>ts :sp +te<CR>
endif

" Keep search results at the center of screen
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz
"
" Store relative line number jumps in the jumplist.
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'

" vim-test  bindings
nmap <silent> <leader>rT :TestNearest<CR>
nmap <silent> <leader>rt :TestFile<CR>
nmap <silent> <leader>ra :TestSuite<CR>
nmap <silent> <leader>rl :TestLast<CR>
nmap <silent> <leader>rg :TestVisit<CR>

" sneak
"replace 'f' with 1-char Sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
"replace 't' with 1-char Sneak
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

" clear terminal
nnoremap <silent> <leader>tl :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> <leader>tc :1Tkill<cr>
" toggle terminal
nnoremap <leader>tt :1Ttoggle<CR>
nnoremap <leader>tr :T 
let g:neoterm_automap_keys = '<leader>tm'

" fzf
nnoremap <silent> <leader><space> :Files<CR>
nnoremap <silent> <leader>a :Buffers<CR>
nnoremap <silent> <leader>; :BLines<CR>
nnoremap <silent> <leader>. :Lines<CR>
nnoremap <silent> <leader>o :BTags<CR>
nnoremap <silent> <leader>O :Tags<CR>
nnoremap <silent> <leader>? :History<CR>
nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
nnoremap <silent> K :call SearchWordWithAg()<CR>
vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>
nnoremap <silent> <leader>gl :Commits<CR>
nnoremap <silent> <leader>ga :BCommits<CR>
nnoremap <silent> <leader>w :Windows<CR>
inoremap <silent> <C-s> <ESC>:Snippets<CR>
nnoremap <silent> <leader>m :FZFMru<CR>

imap <C-x><C-f> <plug>(fzf-complete-file-ag)
imap <C-x><C-l> <plug>(fzf-complete-line)

" fugitive mappings
nmap <leader>ga :Gwrite<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gt :Gcommit -v -q %:p<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gc :Gcommit -v -q<CR>
nmap <leader>gb :Git branch<Space>
nmap <leader>go :Git checkout<Space>

" Others
nnoremap <C-p> :call pdv#DocumentWithSnip()<CR>
nnoremap <F12> :Startify<CR>
nnoremap <silent> <F1>  :UndotreeToggle<CR>

"tagbar
nnoremap <silent> <leader>ff  :TagbarOpenAutoClose<CR>
nnoremap <silent> <F2>  :TagbarToggle<CR>

" Easy align bindings
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" Put at the very end of your .vimrc file.

function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

" LanguageClient_Neovim
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F3> :call LanguageClient_textDocument_rename()<CR>

" Ale
    nmap <silent> <C-k> <Plug>(ale_previous_wrap)
    nmap <silent> <C-j> <Plug>(ale_next_wrap)
