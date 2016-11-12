nnoremap <leader>s :w<CR>

nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-l> :wincmd l<CR>
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <leader>bc :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <silent> <leader>bd :bd<CR>
nnoremap <silent> <leader>tn :tabnew<CR>

" Switch back to normal mode from terminal mode
if has('nvim')
    tnoremap <esc><esc> <C-\><C-n>
endif

" Keep search results at the center of screen
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

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
nnoremap <silent> <leader>tc :call neoterm#kill()<cr>
" toggle terminal
nnoremap <leader>tt :Ttoggle<CR>
nnoremap <leader>tr :T 

" fzf
nnoremap <silent> <leader><space> :Files<CR>
nnoremap <silent> <leader>a :Buffers<CR>
nnoremap <silent> <leader>; :BLines<CR>
nnoremap <silent> <leader>. :Lines<CR>
nnoremap <silent> <leader>o :BTags<CR>
nnoremap <silent> <leader>O :Tags<CR>
nnoremap <silent> <leader>? :History<CR>
nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
"nnoremap <silent> K :call SearchWordWithAg()<CR>
"vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>
nnoremap <silent> <leader>gl :Commits<CR>
nnoremap <silent> <leader>ga :BCommits<CR>
nnoremap <silent> <leader>w :Windows<CR>
inoremap <silent> <C-s> <ESC>:Snippets<CR>

imap <C-x><C-f> <plug>(fzf-complete-file-ag)
imap <C-x><C-l> <plug>(fzf-complete-line)

" airline mappings
nmap <M-1> <Plug>AirlineSelectTab1
nmap <M-2> <Plug>AirlineSelectTab2
nmap <M-3> <Plug>AirlineSelectTab3
nmap <M-4> <Plug>AirlineSelectTab4
nmap <M-5> <Plug>AirlineSelectTab5
nmap <M-6> <Plug>AirlineSelectTab6
nmap <M-7> <Plug>AirlineSelectTab7
nmap <M-8> <Plug>AirlineSelectTab8
nmap <M-9> <Plug>AirlineSelectTab9

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
nnoremap <silent> <F3>  :Dirvish<CR>
nnoremap <silent> gy :Goyo<CR>
nnoremap <F12> :Startify<CR>
nmap <silent> gl :Limelight!!<CR>
xmap gl <Plug>(Limelight)
nnoremap <silent> <F1>  :UndotreeToggle<CR>

"tagbar
nnoremap <silent> <leader>ff  :TagbarOpenAutoClose<CR>
nnoremap <silent> <F2>  :TagbarToggle<CR>

" Easy align bindings
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
