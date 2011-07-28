"Le Defaults
set nocompatible
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set showmatch
set history=700
set autoread
set shortmess=a


"Filetypes
filetype plugin indent on
au BufNewFile,BufRead *.less set filetype=less


"Badass mappings
imap kj <Esc>
imap {( {<CR><CR>});<up><Tab>
imap {{ {<CR><CR>}<up><Tab>
imap (( ()<left>
nnoremap gm :call cursor(0, len(getline('.'))/2)<cr>
noremap <c-s-k> ::call feedkeys( line('.')==1 ? '' : 'ddkP' )<CR>
noremap <c-s-j> ddp


"Sessions
set sessionoptions=blank,buffers,curdir,folds,globals,help,localoptions,options,resize,tabpages,winsize,winpos
nmap SSA :wa<CR>:mksession! ~/sessions/
nmap SO :wa<CR>:so ~/sessions/


" Tab configuration
ca tn tabnew
"ca th tabp
"ca tl tabn
nmap <silent> <C-n> :tabnext<CR>
nmap <silent> <C-p> :tabprev<CR>
imap <silent> <C-n> <esc><C-n>
imap <silent> <C-p> <esc><C-p>
map <right> :tabn<CR>
map <left> :tabp<CR>


" recursively grep current directory for word under cursor
map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
" open quicklist items in new tabs (avoid duplicates)
set switchbuf+=usetab,newtab


" Omnicomplete
set completeopt=longest,menuone
set cot+=menuone
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"PHP
let php_sql_query=1
let php_htmlInStrings=1
let php_noShortTags=1
let php_folding=0
