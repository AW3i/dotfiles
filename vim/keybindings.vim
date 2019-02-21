nnoremap <silent> <leader>bc :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <silent> <leader>bd :bd<CR>
nnoremap <silent> <leader>tn :tabnew<CR>
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

" neoterm
xmap <leader>tr <plug>(neoterm-repl-send)
nmap <leader>trl <plug>(neoterm-repl-send-line)

nnoremap <leader>tr :T 
" Rerun last command
nnoremap <silent> <leader>tR :<c-u>exec printf("%sTexec !! \<lt>cr>", v:count)<cr>
nnoremap <silent> <leader>tt :<c-u>exec printf('%sTtoggle', v:count)<cr>
nnoremap <silent> <leader>vt :<c-u>exec printf('botright vertical %s Ttoggle', v:count)<cr>
nnoremap <silent> <leader>te :<c-u>exec printf('%sT exit', v:count)<cr>
nnoremap <silent> <leader>tl :<c-u>exec printf('%sTclear', v:count)<cr>
nnoremap <silent> <leader>tk :<c-u>exec printf('%sTkill', v:count)<cr>

cabbrev tt Ttoggle
cabbrev htt botright Ttoggle
cabbrev vtt botright vertical Ttoggle
cabbrev vt botright vertical T

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
nnoremap <silent> <leader>m :Mru<CR>

imap <C-x><C-f> <plug>(fzf-complete-file-ag)
imap <C-x><C-l> <plug>(fzf-complete-line)

" fugitive mappings
nmap <leader>ga :Gwrite<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gc :Gcommit -v -q<CR>
nmap <leader>gb :Git branch<Space>

" Others
nnoremap <C-p> :call pdv#DocumentWithSnip()<CR>
nnoremap <F12> :Startify<CR>
nnoremap <silent> <F1>  :UndotreeToggle<CR>

" Include use statement
nmap <Leader>u :call phpactor#UseAdd()<CR>
" Invoke the context menu
nmap <Leader>cm :call phpactor#ContextMenu()<CR>
" Goto definition of class or class member under the cursor
nmap <Leader>go :call phpactor#GotoDefinition()<CR>
nmap <Leader>na :call phpactor#Navigate()<CR>
" Transform the classes in the current file
nmap <Leader>pt :call phpactor#Transform()<CR>
" Display information
nmap <Leader>h :call phpactor#Hover()<CR>
" Generate a new class (replacing the current file)
nmap <Leader>cc :call phpactor#ClassNew()<CR>
" Extract expressoins
nmap <Leader>ee :call phpactor#ExtractExpression(v:false)<CR>
vmap <silent><Leader>em :<C-U>call phpactor#ExtractExpression(v:true)<CR>
"Extract interface
nmap <Leader>ei :call phpactor#ClassInflect()<CR>
nmap <Leader>fr :call phpactor#FindReferences()<CR>
" Extract method from selection
vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>
" Ale
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END
